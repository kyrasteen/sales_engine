require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchants_repo'

class MerchantsRepoTest < Minitest::Test

  def test_it_loads_file
    merch = MerchantsRepo.new
    assert_equal 19, merch.load_file('./fixtures/merchants_test_data.csv').length
  end

  def test_it_finds_all
    merch = MerchantsRepo.new
    assert_equal merch.all
  end

end
