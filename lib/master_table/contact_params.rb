# frozen_string_literal: true
module MasterTable
  class ContactParams
    attr_accessor :contact
    attr_accessor :valid_params

    def initialize(contact)
      self.contact = contact
      self.valid_params = set_params
    end

    private

    def set_params
      new_params = contact.as_json(except: [:id, :owner_id, :created_at, :updated_at])
      new_params[:owner] = contact.formatted_owner

      # associations
      new_params[:engagements] = associated(:engagements, :body) if contact.engagements.present?
      new_params[:deals] = associated(:deals, :deal_name) if contact.deals.present?
      new_params
    end

    def associated(assoc, assoc_attr)
      concatenated_assoc = ''
      contact.send(assoc).each do |single_assoc|
        concatenated_assoc += "#{single_assoc.send(assoc_attr)}, "
      end
      concatenated_assoc
    end
  end
end
