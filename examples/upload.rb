require File.join(File.dirname(__FILE__), "..", "lib", "kooaba.rb")


# set the upload key
Kooaba.upload_key = "KPeoZU7LZ91ETJziAMjacw9LEArzBfZYcXgVCZr0"

# initialize the item
item = Kooaba::Item.new(
  :title => "A lake",
  :metadata => nil,
  :image_files => "/home/cristi/Pictures/background/background/1.jpg",
  :referenceId => "lake"
  )

# select the bucket you want to put the item into
bucket_id = "108695a2-7825-4a98-8bda-b980782c5e33"

# upload the item
response = Kooaba.upload(item, bucket_id)

puts "Response code: #{response.code}"
puts "Response body: #{response.body}"
