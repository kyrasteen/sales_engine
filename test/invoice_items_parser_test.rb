require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items_parser'


class InvoiceItemsParserTest < Minitest::Test
  def test_it_parses_a_csv_of_data
    filename = "./test/support/invoice_items_test_data.csv"
    ii_parser = InvoiceItemsParser.new(filename)
    invoice_items = ii_parser.parse

    first = invoice_items.first
    assert_equal 1, first.id
    assert_equal 539, first.item_id

    second = invoice_items[1]
    assert_equal 2, second.id
    assert_equal 528, second.item_id
  end
end
