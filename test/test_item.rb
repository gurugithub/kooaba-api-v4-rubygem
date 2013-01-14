require 'test/unit'
require 'kooaba'

class ItemTest < Test::Unit::TestCase
  def test_init_item
    item = Kooaba::Item.new(
      :title => "A lake",
      :metadata => nil,
      :image_files => ["/path/to/image"],
      :reference_id => "lake",
      :enabled => true
      )

    assert_equal item.title, "A lake"
    assert_equal item.metadata, nil
    assert_equal item.image_files, ["/path/to/image"]
    assert_equal item.reference_id, "lake"
    assert_equal item.enabled, true
  end

  def test_init_item_default_attributes
    item = Kooaba::Item.new

    assert_equal item.title, nil
    assert_equal item.metadata, nil
    assert_equal item.enabled, true
    assert_equal item.reference_id, nil
    assert_equal item.image_files, []
  end

  def test_init_wrong_type_for_enabled
    assert_raise TypeError do
      item = Kooaba::Item.new(
        :enabled => 1
        )
    end
  end

  def test_init_wrong_type_for_image_files
    assert_raise TypeError do
      item = Kooaba::Item.new(
        :image_files => "something"
        )
    end
  end

end
