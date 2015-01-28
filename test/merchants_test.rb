require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class MerchantTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    @merchant = engine.merchant_repository('test/support/merchants_test_data.csv').data[0]
  end

  def test_it_stores_an_id
    assert_equal 1, @merchant.id
  end

  def test_it_stores_id_as_integer
    assert_equal 1, @merchant.id
  end

  def test_it_stores_a_name
    assert_equal "Schroeder-Jerde", @merchant.name
  end

  def test_it_finds_related_items
    assert @merchant.items
    assert_equal 15, @merchant.items.length
  end

  def test_it_finds_related_invoices
    assert @merchant.invoices
    assert_equal 59, @merchant.invoices.length
  end

  def test_it_finds_total_revenue_across_all_transactions
    assert @merchant.revenue
    assert_equal 'BigDecimal', @merchant.revenue
  end

  def test_it_finds_total_revenue_for_given_date
    assert_equal 'bigDecimal', @merchant.revenue("2012-03-25 13:54:11 UTC")
  end

  def test_it_finds_favorite_customer
    skip
  end

end
