require File.join(File.dirname(__FILE__), "..", "lib", "kooaba.rb")

# set the data key
Kooaba.data_key = <data-key-secret-token>

# initialize the item
item = Kooaba::Item.new(
  :title => "A lake",
  :metadata => nil,
  :image_files => <path-to-image-on-local-filesystem>,
  :referenceId => "lake"
  )

# select the bucket you want to put the item into
bucket_id = <BUCKET_ID>

# upload the item
response = Kooaba.upload(item, bucket_id)

puts "Response code: #{response.code}"
puts "Response body: #{response.body}"
