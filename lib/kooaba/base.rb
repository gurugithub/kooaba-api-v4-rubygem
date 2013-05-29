module Kooaba
  QUERY_URL  = "https://query-api.kooaba.com/v4/"
  UPLOAD_URL = "https://upload-api.kooaba.com/api/v4/"

  def self.data_key=(data_key)
    @@data_key = data_key
  end

  def self.query_key=(query_key)
    @@query_key = query_key
  end

  def self.data_key
    @@data_key
  end

  def self.query_key
    @@query_key
  end

  def self.upload(item, bucket_id)
    raise ArgumentError, "You need to specify the Data Key before uploading an item" if !Kooaba.data_key
    UploadRequest.new(item, bucket_id).start
  end

  def self.query(image_path)
    raise ArgumentError, "You need to specify the Query Key before making queries" if !Kooaba.query_key
    QueryRequest.new(image_path).start
  end

  def self.update(item_uuid, params = {})
    raise ArgumentError, "You need to specify the item uuid for the item you want to update" if !item_uuid
    UpdateRequest.new(item_uuid, params).start
  end
end
