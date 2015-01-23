require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items_parser'


class ItemsParserTest < Minitest::Test
  def test_it_parses_a_csv_of_data
    filename = "test/support/items_test_data.csv"
    items_parser = ItemsParser.new(filename, nil)
    items = items_parser.parse

    first = items.first
    assert_equal 1, first.id
    assert_equal "Item Qui Esse", first.name

    second = items[1]
    assert_equal 2, second.id
    assert_equal "Item Autem Minima", second.name
  end
end
