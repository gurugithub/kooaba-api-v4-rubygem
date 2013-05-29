require 'test/unit'
require 'kooaba'
require 'mocha/setup'

class UpdateRequestTest < Test::Unit::TestCase

  include Kooaba

  def test_disable_item
    req = UpdateRequest.new("123", "enabled" => false)

    http_resp = Net::HTTPSuccess.new(1.0, 200, "hi")
    http_resp.stubs(:code).returns(204)
    http_resp.stubs(:kind_of?).returns('Net::HTTPSuccess')
    http_resp.stubs(:body).returns('')

    req.stubs(:make_request).returns(http_resp)

    req.expects(:parse_2xx).with(http_resp).returns("")
    assert req.start
  end

end
