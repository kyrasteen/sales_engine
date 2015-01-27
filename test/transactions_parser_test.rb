require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction_parser'


class TransactionParserTest < Minitest::Test
  def test_it_parses_a_csv_of_data
    filename = "test/support/transactions_test_data.csv"
    t_parser = TransactionParser.new(filename, nil)
    transactions = t_parser.parse

    first = transactions.first
    assert_equal 1, first.id
    assert_equal "4654405418249632", first.credit_card_number

    second = transactions[1]
    assert_equal 2, second.id
    assert_equal "4580251236515201", second.credit_card_number
  end
end
