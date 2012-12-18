# kooaba

This gem is currently in Beta phase. We advise you not to use this in a production system.

This is a lightweight gem (no other dependencies) for accessing the [kooaba APIs](http://kooaba.github.com).

## Installation

1. Make sure you have an accout in the kooaba platform at [https://platform.kooaba.com/](https://platform.kooaba.com). In the API Access section you will find your API key for accessing the platform.


2. Install the kooaba gem:

    gem install kooaba


## Uploading an item

In order to upload items into your account, you need an UPLOAD\_KEY and a BUCKET\_ID. Both of these you can find in your account at https://platform.kooaba.com .

    require 'rubygems'
    require 'kooaba'

    # set the upload key
    Kooaba.upload_key = <UPLOAD_KEY>

    # initialize the item
    item = Kooaba::Item.new(
      :title => "A lake",
      :metadata => nil,
      :image_files => <PATH_TO_IMAGE_ON_LOCAL_SYSTEM>,
      :referenceId => "lake"
      )

    # select the bucket you want to put the item into
    bucket_id = <BUCKET_ID>

    # upload the item
    response = Kooaba.upload(item, bucket_id)

    puts "Response code: #{response.code}"
    puts "Response body: #{response.body}"


The reponse will look like:

    Response code: 201
    Response body: {"uuid":"d956a280-d678-4260-9115-d0382175ae90","enabled":true,"images":[{"sha1":"3d3d8d00cdaf3de4f346f84e83e207780a7e2afe"}]}



## Making a query

To make a query you need a QUERY_KEY which you can find under the API Access section in your account at https://platform.kooaba.com .

    require 'rubygems'
    require 'kooaba'

    # set the query key
    Kooaba.query_key = <QUERY_KEY>

    # send the query to the kooaba servers
    query = Kooaba::Query.new(:image_path => <PATH_TO_QUERY_IMAGE_ON_LOCAL_SYSTEM>)
    response = Kooaba.query(query)

    # inspect the result
    puts "Response code: #{response.code}"
    puts "Response body: #{response.body}"


The response will look like this:

    Response code: 200
    Response body: {"query_id":"698c666aa23348a0b5ef54d9bc2d7ca3","results":[{"item_uuid":"4b641fc5-2c50-44b5-b529-c9e4092ec47f","bucket_uuid":"108695a2-7825-4a98-8bda-b980782c5e33","service_id":"object_retrieval","score":3.301587,"recognitions":[{"score":3.301587,"id":"image.sha1:dd96b28d55db1492c8dd9709ba480efd287fa122","reference_projection":[{"x":6.596069,"y":2.501495},{"x":-4.0,"y":1153.0},{"x":1851.0,"y":1160.0},{"x":1834.0,"y":3.0}],"bounding_box":[{"x":427.0,"y":28.0},{"x":427.0,"y":1090.0},{"x":1644.0,"y":1090.0},{"x":1644.0,"y":28.0}]}],"title":"A lake"},{"item_uuid":"b9914fad-5064-437d-b84b-71c9d69fd248","bucket_uuid":"108695a2-7825-4a98-8bda-b980782c5e33","service_id":"object_retrieval","score":3.301587,"recognitions":[{"score":3.301587,"id":"image.sha1:dd96b28d55db1492c8dd9709ba480efd287fa122","reference_projection":[{"x":6.596069,"y":2.501495},{"x":-4.0,"y":1153.0},{"x":1851.0,"y":1160.0},{"x":1834.0,"y":3.0}],"bounding_box":[{"x":427.0,"y":28.0},{"x":427.0,"y":1090.0},{"x":1644.0,"y":1090.0},{"x":1644.0,"y":28.0}]}],"title":"A lake"}]}
