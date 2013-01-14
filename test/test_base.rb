require 'test/unit'
require 'kooaba'

class BaseTest < Test::Unit::TestCase
  def test_data_key
    Kooaba.data_key = "123"
    assert_equal Kooaba.data_key, "123"
  end

  def test_query_key
    Kooaba.query_key = "123"
    assert_equal Kooaba.query_key, "123"
  end

  def test_upload_no_key
    assert_raise ArgumentError do
      Kooaba.data_key = nil
      Kooaba.upload(Kooaba::Item.new, "test")
    end
  end

  def test_query_no_key
    assert_raise ArgumentError do
      Kooaba.query_key = nil
      Kooaba.query("/path/to/image")
    end
  end
end
