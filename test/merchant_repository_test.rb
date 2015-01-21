require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchants_repo'

class MerchantsRepoTest < Minitest::Test

  def test_it_loads_file
    merch = MerchantsRepo.new
    assert_equal 19, merch.load_file('../test/support/merchants_test_data.csv').length
  end

  def test_it_finds_all
    skip
    merch = MerchantsRepo.new
    assert_equal merch.all
  end

end


class MerchantRepoIntegrationTest < Minitest::Test

  def test_repo_stores_data
    m_parser = MerchantsParser.new('../test/support/merchant_test_data.csv')
    merch = MerchantsRepo.new
    assert_equal 19, merch.data.count
  end

end
