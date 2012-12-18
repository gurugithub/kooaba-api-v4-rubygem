require File.join(File.dirname(__FILE__), "..", "lib", "kooaba.rb")


# set the query key
Kooaba.query_key = "QC7qkcDdSxEkXTcDBRWj9GE52xRVqwjYZTW1DE52"

# send the query to the kooaba servers
query = Kooaba::Query.new(:image_path => "/home/cristi/Pictures/background/background/1308504847996.jpg")
response = Kooaba.query(query)

# inspect the result
puts "Response code: #{response.code}"
puts "Response body: #{response.body}"
