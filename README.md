# kooaba

This is the official kooaba gem.

    gem install kooaba

To make an upload:

    require "kooaba"

    Kooaba.upload_key = "somestuff"
    item = new Kooaba::Item(:title => "something", :metadate => "something")
    response = Kooaap.upload(item)

    puts "Response "
    puts "Response "

The reponse will look like:

    Response code: 201
    Response body: {"uuid":"d956a280-d678-4260-9115-d0382175ae90","enabled":true,"images":[{"sha1":"3d3d8d00cdaf3de4f346f84e83e207780a7e2afe"}]}


To make a query:

    Kooaba.query_key = "soimoimoi"
    query = new Kooaba::Query(:image_path => "oijoij")
    results = Kooaba.query(query) # result type is item

The response will look like:

    Response code: 200
    Response body: {"query_id":"698c666aa23348a0b5ef54d9bc2d7ca3","results":[{"item_uuid":"4b641fc5-2c50-44b5-b529-c9e4092ec47f","bucket_uuid":"108695a2-7825-4a98-8bda-b980782c5e33","service_id":"object_retrieval","score":3.301587,"recognitions":[{"score":3.301587,"id":"image.sha1:dd96b28d55db1492c8dd9709ba480efd287fa122","reference_projection":[{"x":6.596069,"y":2.501495},{"x":-4.0,"y":1153.0},{"x":1851.0,"y":1160.0},{"x":1834.0,"y":3.0}],"bounding_box":[{"x":427.0,"y":28.0},{"x":427.0,"y":1090.0},{"x":1644.0,"y":1090.0},{"x":1644.0,"y":28.0}]}],"title":"A lake"},{"item_uuid":"b9914fad-5064-437d-b84b-71c9d69fd248","bucket_uuid":"108695a2-7825-4a98-8bda-b980782c5e33","service_id":"object_retrieval","score":3.301587,"recognitions":[{"score":3.301587,"id":"image.sha1:dd96b28d55db1492c8dd9709ba480efd287fa122","reference_projection":[{"x":6.596069,"y":2.501495},{"x":-4.0,"y":1153.0},{"x":1851.0,"y":1160.0},{"x":1834.0,"y":3.0}],"bounding_box":[{"x":427.0,"y":28.0},{"x":427.0,"y":1090.0},{"x":1644.0,"y":1090.0},{"x":1644.0,"y":28.0}]}],"title":"A lake"}]}
