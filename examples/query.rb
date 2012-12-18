require File.join(File.dirname(__FILE__), "..", "lib", "kooaba.rb")

# set the query key
Kooaba.query_key = <QUERY_KEY>

# send the query to the kooaba servers
query = Kooaba::Query.new(:image_path => <PATH_TO_IMAGE>)
response = Kooaba.query(query)

# inspect the result
puts "Response code: #{response.code}"
puts "Response body: #{response.body}"
