require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_parser'


class MerchantParserTest < Minitest::Test
  def test_it_parses_a_csv_of_data
    filename = "test/support/merchants_test_data.csv"
    m_parser = MerchantParser.new(filename, nil)
    merchants = m_parser.parse

    first = merchants.first
    assert_equal 1, first.id
    assert_equal "Schroeder-Jerde", first.name

    second = merchants[1]
    assert_equal 2, second.id
    assert_equal "Klein, Rempel and Jones", second.name
  end
end
