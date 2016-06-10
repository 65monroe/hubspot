# http://developers.hubspot.com/docs/methods/owners/get_owners
# Require at least 35 records
# GET /owners/v2/owners/
# Returns all of the owners that exist inside of HubSpot. Owners
# can be created from users inside of the application, owners
# passing through CRM integrations, or created via the API.

module Api
  #:nodoc
  class Owners < Base
    def hash_access
      ''
    end

    def params
      super
    end

    def format_params
      {
        id: :ownerId,
        first: :firstName,
        last: :lastName,
        email: :email
      }
    end
  end
end
