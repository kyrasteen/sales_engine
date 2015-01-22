require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchants'

class MerchantsTest < Minitest::Test

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

end

class MerchantIntegrationTest < Minitest::Test

  def test_it_finds_related_orders
    merchant_repo = MerchantRepo.new
    data = {name:"my shop"}
    merchant = Merchants.new(data, merchant_repo)

    invoices = Array.new(5){Invoice.new}
    merchant_repo.invoices = invoices
    assert_equal invoices, merchant.invoices
  end
end
