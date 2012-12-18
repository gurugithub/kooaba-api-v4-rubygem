require 'rubygems'
require 'uri'
require 'net/http'
require 'net/https'
require 'time'

module Kooaba
  class UploadRequest
    attr_accessor :message
    attr_accessor :bucket_id

    def initialize(item, bucket_id)
      @bucket_id = bucket_id
      @message = MultipartMessage.new
      item.image_files.each do |image_file|
        @message.add_file_part('images', image_file, "image/jpeg") #TODO fix this
      end
      @message.add_text_part('referenceId', item.reference_id) if item.reference_id
      @message.add_text_part('title', item.title) if item.title
      @message.add_text_part('enabled', item.enabled)
      @message.add_text_part('metadata', item.metadata) if item.metadata
    end

    #
    # Returns the http response from the Kooaba servers.
    #
    def start
      url = URI.parse(Kooaba::UPLOAD_URL + "buckets/" + bucket_id + "/items")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Post.new(url.path)

      req.body = @message.body
      req['date'] = Time.new.httpdate
      req['content-type'] = @message.content_type
      req['authorization'] = "Token #{Kooaba.upload_key}"

      http.start { |h| h.request(req) }
    end
  end
end
