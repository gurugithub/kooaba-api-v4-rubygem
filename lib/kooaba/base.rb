module Kooaba
  QUERY_URL  = "https://query-api.kooaba.com/v4/"
  UPLOAD_URL = "https://upload-api.kooaba.com/api/v4/"

  def self.upload_key=(upload_key)
    @@upload_key = upload_key
  end

  def self.query_key=(query_key)
    @@query_key = query_key
  end

  def self.upload_key
    @@upload_key
  end

  def self.query_key
    @@query_key
  end

  def self.upload(item, bucket_id)
    UploadRequest.new(item, bucket_id).start
  end

  def self.query(image_path)
    QueryRequest.new(image_path).start
  end
end
