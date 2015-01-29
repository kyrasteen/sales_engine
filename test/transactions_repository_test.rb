require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction_repository'
require 'pry'
require 'date'

class TransactionRepoTest < Minitest::Test

  def setup
    filename = ('./test/support/transactions_test_data.csv')
    @transactions = TransactionRepo.new(filename, nil)
  end

  def test_it_finds_all
    assert_equal 20, @transactions.all.length
  end

  def test_it_can_find_by_id
    assert_equal "1", @transactions.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    assert_equal 2, @transactions.find_all_by_id(19).count
  end

  def test_it_can_find_by_created_at
    date = Date.parse('2012-03-27 14:54:10 UTC')
    assert @transactions.find_by_created_at(date).is_a?(Transaction)
  end

  def test_it_can_find_all_by_created_at
    date = Date.parse('2012-03-27 14:54:10 UTC')
    assert_equal 20, @transactions.find_all_by_created_at(date).count
  end

  def test_it_can_find_by_updated_at
    assert @transactions.find_by_updated_at(Date.parse('2012-03-27 14:54:10 UTC')).is_a?(Transaction)
  end

  def test_it_can_find_all_by_updated_at
    date = Date.parse'2012-03-27 14:54:09 UTC'
    assert_equal 20, @transactions.find_all_by_updated_at(date).count
  end

  def test_it_can_find_invoice_id
    assert_equal 3, @transactions.find_all_by_invoice_id(12).count
  end

  def test_it_can_find_a_credit_card_number
    assert_equal "4580251236515201", @transactions.find_by_credit_card_number("4580251236515201").credit_card_number
  end

  def test_it_can_find_all_successful_results
    assert_equal 16, @transactions.find_all_by_result("success").count
  end


end
