class MedianSubaccountService

    def initialize(company)
        @company = company
    end

    def create
        # Return the subaccount if it already exists
        @company.median_subaccount if @company.median_subaccount.present?

        # Make an authenticated POST request to https://app.hellomedian.com/v1/sub_accounts to create a new subaccount
        # In this example, we bind a subaccount to a company model.
        # The only required parameter we need to pass to Median is a name for the Subaccount, which can be anything you'd like.
        # You can also set any of the values in the example response on creation -- eg setting phone mode or request permission to true.

        resp = connection.post do |req|
            req.url 'sub_accounts'
            req.headers['Content-Type'] = 'application/json'
            # Encode this POST request as a JSON request
            req.body = JSON.dump({ name: @company.name })
        end

        resp = JSON.parse(resp.body)

        # The response will contain the subaccount's ID as 'id', which is the only piece of information we actually need to initiate a session
        # We made a model called median_subaccount where we'll stash account settings that are returned when we create a subaccount (an example of this response is below)

        # Rename the 'id' key to 'subaccount_id' so we don't overwrite the Rails database ID.
        resp['subaccount_id'] = resp.delete 'id'
        # The response contains statistics which we aren't storing, so only match up the keys we need
        resp.slice!(*MedianSubaccount.attribute_names)
        # Add the company model so we can establish the association
        resp['company'] = @company

        MedianSubaccount.create! resp
    end

    private

    def connection
        # Median uses basic authentication for all REST API calls.
        # The API token should be set as the username and the password should be blank.
        Faraday.new('https://app.hellomedian.com/v1') do |conn|
            conn.basic_auth(ENV["MEDIAN_API_KEY"], '')
            conn.adapter :net_http
        end
    end
end


# When a subaccount is successfully created, Median will return this response with the relevant account information:

# {"dev_mode"=> false,
# "request_permission"=> false,
# "request_permission_text"=> "Allow agent to view your browser window?",
# "excluded_selectors"=> [],
# "phone_mode"=> false,
# "last_socket_at"=> nil,
# "last_screenshare_at"=> nil,
# "d"=> "85cc320e-2dbf-4785-89f8-9e2f5725eb49"}