require_relative '../lib/repository'
require_relative '../lib/transactions_repo'
require 'minitest/autorun'
require 'minitest/pride'

class TransactionsRepoTest < Minitest::Test

  attr_reader :transactions_repo

  def test_it_exists
    repo = Repository.new
    path = './fixtures/transactions_test_data.csv'
    @transactions_repo = TransactionsRepo.new
    transactions_repo.load_file(path)
  end

  def test_can_find_all
    assert_equal 19, transactions_repo.all.length
  end

end
