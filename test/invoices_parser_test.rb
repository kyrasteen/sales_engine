require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoices_parser'


class InvoicesParserTest < Minitest::Test
  def test_it_parses_a_csv_of_data
    filename = "test/support/invoices_test_data.csv"
    invoices_parser = InvoicesParser.new(filename)
    invoices = invoices_parser.parse

    first = invoices.first
    assert_equal 1, first.id
    assert_equal "1", first.customer_id

    second = invoices[1]
    assert_equal 2, second.id
    assert_equal "1", second.customer_id
  end
end
