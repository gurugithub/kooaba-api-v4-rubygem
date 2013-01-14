require 'test/unit'
require 'kooaba'
require 'mocha/setup'

class UploadRequestTest < Test::Unit::TestCase

  include Kooaba

  def test_parse_item
    item = Item.new(:title => 1)
    req = UploadRequest.new(item, "123")

    http_resp = Net::HTTPSuccess.new(1.0, 200, "hi")
    http_resp.stubs(:code).returns(200)
    http_resp.stubs(:kind_of?).returns('Net::HTTPSuccess')
    http_resp.stubs(:body).returns('{"uuid":"07382685-ba1d-47bf-be78-7be0db2ebf92","enabled":true,"images":[{"sha1":"14970c3a70d7d295250a10783c7e222625a757ea"},{"sha1":"704f8c649f41262a9232639573dc2210431ebf3b"}]}')

    req.stubs(:make_request).returns(http_resp)
    req.start

    assert_equal item.uuid, "07382685-ba1d-47bf-be78-7be0db2ebf92"
    assert_equal item.enabled, true
    assert_equal item.images_sha1, ["14970c3a70d7d295250a10783c7e222625a757ea", "704f8c649f41262a9232639573dc2210431ebf3b"]
  end

  def test_parse_item_no_sha1s
    item = Item.new(:title => 1)
    req = UploadRequest.new(item, "123")

    http_resp = Net::HTTPSuccess.new(1.0, 200, "hi")
    http_resp.stubs(:code).returns(200)
    http_resp.stubs(:kind_of?).returns('Net::HTTPSuccess')
    http_resp.stubs(:body).returns('{"uuid":"07382685-ba1d-47bf-be78-7be0db2ebf92","enabled":true,"images":[]}')

    req.stubs(:make_request).returns(http_resp)
    req.start

    assert_equal item.uuid, "07382685-ba1d-47bf-be78-7be0db2ebf92"
    assert_equal item.enabled, true
    assert_equal item.images_sha1, []
  end
end
