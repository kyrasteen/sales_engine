require_relative '../lib/transactions_repo'
require 'minitest/autorun'
require 'minitest/pride'

class TransactionsRepoTest < Minitest::Test

  attr_reader :trans_repo

  def setup
    @trans_repo = TransactionsRepo.new
  end

  def test_it_exists
    assert trans_repo = TransactionsRepo.new
  end

  def test_file_has_19_lines
    assert_equal 19,trans_repo.load_file('./fixtures/transactions_test_data.csv').length
  end

  def test_fourth_record_has_invoice_id
    skip
    assert_equal 5,trans_repo.invoice_id(4)
  end

  def test_it_finds_all
    
  end

end
