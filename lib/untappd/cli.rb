require 'thor'
require 'untappd'
require "untappd/client"
require 'pp'

module UntappdBusiness
  class CLI < Thor
    desc "beer BID SECTION_ID", "Show info for a single beer via its untappd ID (BID) in a menu section (SECTION_ID)"
    method_option :email, type: :string, required: false, desc: "Auth email, if not supplied via env variable UNTAPPD_BUSINESS_AUTH_EMAIL"
    method_option :token, type: :string, required: false, desc: "Auth token, if not supplied via env variable UNTAPPD_BUSINESS_AUTH_TOKEN"
    def beer(untappd_beer_id, section_id)
      client = if options[:email]
        UntappdBusiness::Client.new(auth_email: options[:email], auth_token: options[:token])
      else
        UntappdBusiness::Client.new
      end
      pp client.beer(untappd_beer_id, section_id).to_h
    end
  end
end