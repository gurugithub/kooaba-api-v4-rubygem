require 'test/unit'
require 'kooaba'

class QueryTest < Test::Unit::TestCase
  def test_query_init
    query = Kooaba::Query.new(
      :image_path => "/path/to/image.png",
      :max_results => 2,
      :user_data => "some data"
      )

    assert_equal query.image_path, "/path/to/image.png"
    assert_equal query.max_results, 2
    assert_equal query.user_data, "some data"
  end

  def test_query_no_image
    assert_raise ArgumentError do
      query = Kooaba::Query.new()
    end
  end

  def test_default_parameters
    query = Kooaba::Query.new(
      :image_path => "/path/to/image.png"
      )

    assert_equal query.max_results, 10
    assert_equal query.user_data, nil
  end
end
