require 'rubygems'
require 'uri'
require 'net/http'
require 'net/https'
require 'time'

module Kooaba

  class QueryRequest

    def initialize(query)
      @message = MultipartMessage.new
      content_type = `file --mime-type -b #{query.image_path}`.chop
      @message.add_file_part('image', query.image_path, content_type)
      @message.add_text_part('max_results', query.max_results) if query.max_results
      @message.add_text_part('user_data', query.user_data) if query.user_data
    end

    #
    # Returns the http response from the Kooaba servers.
    #
    def start
      url = URI.parse(Kooaba::QUERY_URL + "query")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Post.new(url.path)

      req.body = @message.body
      req['date'] = Time.new.httpdate
      req['content-type'] = @message.content_type
      req['authorization'] = "Token #{Kooaba.query_key}"

      http.start { |h| h.request(req) }
    end

  end

end
