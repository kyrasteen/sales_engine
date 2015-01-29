require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class ItemsTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    @item = engine.item_repository('test/support/items_test_data.csv').data[0]
  end

  def test_it_stores_an_id
    assert_equal 1, @item.id
  end

  def test_it_stores_id_as_integer
    assert_equal 1, @item.id
  end

  def test_it_stores_a_name
    assert_equal "Item Qui Esse", @item.name
  end

  def test_it_has_other_attributes
    assert @item.description.is_a?(String)
    assert_equal BigDecimal.new("75107"), @item.unit_price
    assert_equal "1", @item.merchant_id
  end

  def test_it_finds_related_invoice_items
    assert_equal 24, @item.invoice_items.length
  end

  def test_it_finds_related_merchant
    assert_equal "Schroeder-Jerde", @item.merchant.name
  end

  def test_it_finds_best_day
    assert @item.best_day
    assert_equal Date.parse("Tue, 10 Mar 2012"), @item.best_day
  end

end
