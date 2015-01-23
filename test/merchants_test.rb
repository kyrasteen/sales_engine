require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchants'

class MerchantsTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    @merchant = engine.merchants_repository('test/support/merchants_test_data.csv').merchants[0]
  end

  def test_it_stores_an_id
    merchant = Merchants.new({id:1}, nil)
    assert_equal 1, merchant.id
  end

  def test_it_stores_id_as_integer
    merchant = Merchants.new({id:'1'}, nil)
    assert_equal 1, merchant.id
  end

  def test_it_stores_a_name
    merchant = Merchants.new({name:'kyra'}, nil)
    assert_equal "kyra", merchant.name
  end

  def test_it_finds_related_items
    assert @merchant.id
    assert_equal 1, @merchant.id
  end

  def test_it_finds_related_invoices
    assert @merchant.id
    assert_equal 1, @merchant.id
  end

end
