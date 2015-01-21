require 'minitest/autorun'
# require 'minitest/pride'
require '../lib/transactions_repo'
require 'pry'

class TransactionsRepoTest < Minitest::Test
  attr_reader :trans_repo

  def setup
    @trans_repo = TransactionsRepo.new('../fixtures/transactions_test_data.csv')
  end

  def test_array_is_created_when_file_loads
    assert trans_repo.load_data.is_a?(Array) 
  end

  def test_file_has_19_records
    trans_repo.load_data
    assert_equal 19, trans_repo.all.count
  end

  def test_it_can_find_a_random_record
    trans_repo.load_data
    assert trans_repo.random
  end

  def test_can_find_an_id_number
    trans_repo.load_data
    assert_equal 5,trans_repo.find_by_id(4)
  end



end
