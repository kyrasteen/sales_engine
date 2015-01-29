require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repository'

class MerchantRepoTest < Minitest::Test

  def setup
    filename = './test/support/merchants_test_data.csv'
    se_self = SalesEngine.new
    @merch = MerchantRepo.new(filename, se_self)
  end

  def test_it_finds_all
    assert_equal 19, @merch.all.length
  end

  def test_it_can_find_by_id
    assert_equal "1", @merch.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    assert_equal 2, @merch.find_all_by_id(5).count
  end

  def test_it_can_find_by_created_at
    date = Date.parse('2012-03-27 14:54:00 UTC')
    assert @merch.find_by_created_at(date).is_a?(Merchant)
  end

  def test_it_can_find_all_by_created_at
    date = Date.parse('2012-03-27 14:53:59 UTC')
    assert_equal 19, @merch.find_all_by_created_at(date).count
  end

  def test_it_can_find_by_updated_at
    date = Date.parse('2012-03-27 14:54:00 UTC')
    assert @merch.find_by_updated_at(date).is_a?(Merchant)
  end

  def test_it_can_find_all_by_updated_at
    date = Date.parse('2012-03-27 14:54:00 UTC')
    assert_equal 19, @merch.find_all_by_updated_at(date).count
  end

  def test_it_can_find_by_name
    assert_equal 'Williamson Group', @merch.find_by_name('Williamson Group').name
  end

  def test_it_can_find_all_by_name
    assert_equal 2, @merch.find_all_by_name('Williamson Group').count
  end

  def test_it_finds_most_revenue_x
    assert_equal "Dicki-Bednar", @merch.most_revenue(3)[0].name
  end

  def test_it_finds_most_items_x
  skip
    assert_equal "Dicki-Bednar", @merch.most_items(3)[0].name
  end

  def test_it_finds_revenue
    skip
    assert_equal 100, @merch.revenue('2012-03-27 14:54:00 UTC')
  end

end
