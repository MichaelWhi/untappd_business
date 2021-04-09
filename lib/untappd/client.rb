require 'json'
require 'ostruct'
require 'httparty'

module UntappdBusiness
  class Client
    include HTTParty
    base_uri 'https://business.untappd.com/api/v1'

    def initialize(auth_email: ENV["UNTAPPD_BUSINESS_AUTH_EMAIL"],
                   auth_token: ENV["UNTAPPD_BUSINESS_AUTH_TOKEN"])
      if auth_email.nil? || auth_token.nil?
        throw "no API auth provided. provide as kwargs or as envs (UNTAPPD_BUSINESS_AUTH_EMAIL and _TOKEN)"
      end
      @options = { basic_auth: { username: auth_email, password: auth_token } } #, debug_output: STDOUT }
    end

    def menu_items(menu_section_id)
      body = self.class.get("/sections/#{menu_section_id.to_s}/items", @options).body
      @items ||= JSON.parse(body)["items"].map do |item|
        OpenStruct.new(item)
      end
    end

    def beer(beer_id, menu_section_id = nil)
      if menu_section_id.nil? && !defined?(@items)
        throw "supply a menu_section_id (second param), or load the menu by calling #menu_items(section_id) first."
      end
      menu_items(menu_section_id) unless defined?(@items)

      @items.find do |i|
        i.untappd_id.to_s == beer_id.to_s
      end
    end
  end
end