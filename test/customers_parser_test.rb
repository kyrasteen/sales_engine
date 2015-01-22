require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customers_parser'


class CustomersParserTest < Minitest::Test
  def test_it_parses_a_csv_of_data
    filename = "test/support/customers_test_data.csv"
    c_parser = CustomersParser.new(filename)
    customers = c_parser.parse

    first = customers.first
    assert_equal 1, first.id
    assert_equal "Joey", first.first_name

    second = customers[1]
    assert_equal 2, second.id
    assert_equal "Cecelia", second.first_name
  end
end
