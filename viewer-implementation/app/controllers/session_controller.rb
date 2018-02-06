class SessionController < ApplicationController
  def index
    # We're going to sign a JSON web token on the server and pass it in to the frontend so the viewer start.
    # Once loaded, the viewer will make a few requests back to Median to gather some information about the visitor, such as if they're online or not.
    # We do this inside the viewer that way you (as a CoBrowse implementer) don't have to know anything about the visitor you're trying to start a session with,
    # or make an external API request in the middle of an incoming request cycle.
    @token = signed_jwt
  end

  private

  # Some of these method names are ridiculous, the point being to illustrate clearly how to generate a token rather than show a terse implementation.

  def signed_jwt
    # We're using the Ruby JWT library.
    # There are very well supported libraries in nearly every language here: https://jwt.io/
    JWT.encode(jwt_payload, median_api_key)
  end

  def jwt_payload
    {
      iss: first_company_median_subaccount_id, # The "iss" or "Issuer" is the GUID of the subaccount that the visitor is connected to.
      sub: identified_visitor_id,              # The visitor ID set by Median.identify({id}) on the Visitor side. This can be any string.
      exp: fifteen_minutes_from_now            # A UTC Unix Epoch set in the future so that tokens cannot be re-used. You can set this any future value. We recommend 15 minutes.
    }

    # Example Payload:
    # {
    #   "iss": "63290b57-7387-4937-98ea-886ed2bf43fc",
    #   "sub": "identified_visitor_1234",
    #   "exp": "1513975066"
    # }
  end

  def first_company_median_subaccount_id
    # The "iss" or "issuer" of the payload must be the GUID of the subaccount that the visitor is on.
    # In your application, you'll want to fill this in with the sub-account of the "company" or installation your chat agent is with.
    # For demonstration purposes, we're just using the first company we created in this application.
    Company.first.median_subaccount.subaccount_id
  end

  def identified_visitor_id
    # This can be any valid string, and it's whatever you previously set on the visitor side by calling Median.identify({id}).
    # For example, if you have a chat product where you assign an anonymous id to someone before a chat starts, you could use that to identify the visitor.
    'identified_visitor_1234'
  end

  def fifteen_minutes_from_now
    # This must be a UNIX Epoch in UTC.
    Time.now.to_i + 900
  end

  def median_api_key
    # Your API key found in Median's control panel. Do not expose this publicly.
    ENV["MEDIAN_API_KEY"]
  end
end