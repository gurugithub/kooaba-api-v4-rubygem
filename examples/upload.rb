require File.join(File.dirname(__FILE__), "..", "lib", "kooaba.rb")

# set the data key
Kooaba.data_key = <data-key-secret-token>

# initialize the item
item = Kooaba::Item.new(
  :title => "A lake",                                  # the title of the item (String)
  :metadata => nil,                                    # metadata associated with the item. It must be a valid JSON String (String)
  :image_files => <path-to-image-on-local-filesystem>, # images associated with the item (Array of Strings)
  :reference_id => "lake"                              # the reference id of an item (String)
  )

# select the bucket you want to put the item into
bucket_id = <BUCKET_ID>

# upload the item
response = Kooaba.upload(item, bucket_id)

puts "Response code: #{response.code}"
puts "Response body: #{response.body}"
