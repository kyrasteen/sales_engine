require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transactions_repo'
require 'pry'

class TransactionsRepoTest < Minitest::Test

  def test_it_finds_all
    filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal 20, transactions.all.length
  end

  def test_it_can_find_by_id
    filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal "1", transactions.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
   filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal 2, transactions.find_all_by_id(19).count
  end

  def test_it_can_find_by_created_at
   filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal "2012-03-27 14:54:10 UTC", transactions.find_by_created_at('2012-03-27 14:54:10 UTC').created_at
  end

  def test_it_can_find_all_by_created_at
   filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal 18, transactions.find_all_by_created_at('2012-03-27 14:54:10 UTC').count
  end

  def test_it_can_find_by_updated_at    
   filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal "2012-03-27 14:54:10 UTC", transactions.find_by_updated_at('2012-03-27 14:54:10 UTC').updated_at
  end

  def test_it_can_find_all_by_updated_at
    filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal 18, transactions.find_all_by_updated_at('2012-03-27 14:54:10 UTC').count
  end

  def test_it_can_find_invoice_id
    filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal 3, transactions.find_all_by_invoice_id('12').count
  end

  def test_it_can_find_a_credit_card_number
    filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal "4580251236515201", transactions.find_by_credit_card_number("4580251236515201").credit_card_number
  end

  def test_it_can_find_all_successful_results
    filename = ('./test/support/transactions_test_data.csv')
    transactions = TransactionsRepo.new(filename)
    assert_equal 16, transactions.find_all_by_result("success").count
  end


end
