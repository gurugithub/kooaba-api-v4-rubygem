require 'rubygems'
require 'uri'
require 'net/http'
require 'net/https'
require 'time'
require 'json'

module Kooaba

  class UpdateRequest

    attr_accessor :item_uuid
    attr_accessor :params

    CONTENT_TYPE = 'application/json'

    ALLOWED_PARAMS = ["title", "enabled", "reference_id", "metadata"]

    def initialize(item_uuid, params)
      @item_uuid = item_uuid
      puts "Warning! The following params are not allowed and will be ignored: #{notAllowedParams(params)}" if notAllowedParams(params) != ""
      @params = cleanedParams(params)
    end

    #
    # Clean params and only use those allowed.
    #
    def cleanedParams(params)
      params.select {|k, v| ALLOWED_PARAMS.include? k}
    end

    def notAllowedParams(params)
      params.select {|k, v| !ALLOWED_PARAMS.include? k}.keys.join(", ")
    end

    #
    # Returns the http response from the Kooaba servers.
    #
    def start
      url = URI.parse(Kooaba::UPLOAD_URL + "items/" + item_uuid)

      resp = make_request(url)
      parse_request(resp)

      return resp
    end

    def make_request(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.read_timeout = 500

      req = Net::HTTP::Put.new(url.path)

      req.body = params.to_json
      req['date'] = Time.new.httpdate
      req['content-type'] = CONTENT_TYPE
      req['authorization'] = "Token #{Kooaba.data_key}"

      http.request(req)
    end

    def parse_request(http_resp)
      case http_resp
      when Net::HTTPSuccess
        parse_2xx(http_resp)
      when Net::HTTPClientError
        parse_4xx(http_resp)
      when Net::HTTPServerError
        parse_5xx(http_resp)
      else
        unknown_response(http_resp)
      end
    end

    def parse_2xx(http_resp)
      # "Item has been updated.\n"
    end

    def parse_4xx(http_resp)
      case http_resp.code
      when 404
          raise ArgumentError.new("Kooaba Response: #{http_resp.code} #{http_resp.body}. Perhaps your key is not allowed to access this item?")
      when 422
          raise ArgumentError.new("Kooaba Response: #{http_resp.code} #{http_resp.body}. Please check your params.")
      else
          raise ArgumentError.new("Kooaba Response: #{http_resp.code} #{http_resp.body}.")
      end
    end

    def parse_5xx(http_resp)
      raise StandardError.new("Internal Server Error: #{http_resp.code} #{http_resp.body}")
    end

    def unknown_response(http_resp)
      raise StandardError.new("Unknown response: #{http_resp.code} #{http_resp.body} ")
    end

  end

end
