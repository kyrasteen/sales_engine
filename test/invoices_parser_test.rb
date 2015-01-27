require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_parser'


class InvoiceParserTest < Minitest::Test
  def test_it_parses_a_csv_of_data
    filename = "test/support/invoices_test_data.csv"
    invoice_parser = InvoiceParser.new(filename, nil)
    invoices = invoice_parser.parse

    first = invoices.first
    assert_equal 1, first.id
    assert_equal "1", first.customer_id

    second = invoices[1]
    assert_equal 2, second.id
    assert_equal "1", second.customer_id
  end
end
