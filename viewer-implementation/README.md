# Median Viewer and Subaccount REST API Implementation

Median's cobrowse API allows you to create subaccounts via the REST API. 

In this example, we create a model for "companies", or indidivual companies/installs that is analogous to a company installed on your platform, and another new model called "Median Subaccount" that contains some settings data related to the subaccount.

There's a [service object](https://github.com/HelloMedian/cobrowse-implementation-rails/blob/master/viewer-implementation/app/services/median_subaccount_service.rb) that we use when a company is created to make a REST API call to Median to create a new Subaccount.

Median's viewer is a Javascript bundle takes a signed JSON Web Token to initiate a CoBrowsing session. You can see a commented example of how to generate a signed token in the [session controller](https://github.com/HelloMedian/cobrowse-implementation-rails/blob/master/viewer-implementation/app/controllers/session_controller.rb).
