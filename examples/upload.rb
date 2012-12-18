require 'rubygems'
require 'kooaba'

# set the upload key
Kooaba.upload_key = <ENTER_KEY_HERE>

# initialize the item
item = Kooaba::Item.new(
  :title => "A lake",
  :metadata => nil,
  :image_files => <PATH_TO_IMAGE>,
  :referenceId => "lake"
  )

# select the bucket you want to put the item into
bucket_id = <BUCKET_ID>

# upload the item
response = Kooaba.upload(item, bucket_id)

puts "Response code: #{response.code}"
puts "Response body: #{response.body}"
