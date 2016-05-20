#!/usr/bin/env ruby
require './config'

Api::Companies.new(ENV['COMPANY_URL']).retreive
Api::Contacts.new(ENV['CONTACT_URL']).retreive
Api::Deals.new(ENV['DEAL_URL']).retreive
Api::Engagements.new(ENV['ENGAGEMENT_URL']).retreive
Api::Owners.new(ENV['OWNER_URL']).retreive