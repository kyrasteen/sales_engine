require 'minitest/autorun'
require_relative '../lib/sales_engine'

class TransactionsTest < Minitest::Test

  attr_reader :transaction

  def setup
    engine = SalesEngine.new
    @transaction = engine.transactions_repository('test/support/transactions_test_data.csv').data[0]
  end

  def test_it_stores_an_id
    transactions = Transactions.new({:id => 6}, nil)
    assert_equal 6, transactions.id
  end

  def test_it_stores_ids_as_integers_only
    transactions = Transactions.new({:id => '6'}, nil)
    assert_equal 6, transactions.id
  end

  def test_it_stores_a_credit_card_number
    transactions = Transactions.new({:credit_card_number => '12345'}, nil)
    assert_equal "12345", transactions.credit_card_number
  end

  def test_it_finds_related_invoices
    assert @transaction.invoice
    assert_equal 1, @transaction.invoice.length
  end

end
