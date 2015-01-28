require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class CustomerTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    @customer = engine.customer_repository('./test/support/customers_test_data.csv').data[0]
  end

  def test_it_stores_an_id
    customers = Customer.new({id:1}, nil)
    assert_equal 1, customers.id
  end

  def test_it_stores_id_as_integer
    customers = Customer.new({id:'1'}, nil)
    assert_equal 1, customers.id
  end

  def test_it_stores_a_first_name
    customers = Customer.new({first_name:'kyra'}, nil)
    assert_equal "kyra", customers.first_name
  end

  def test_it_can_find_related_invoices
    assert @customer.invoices
    assert_equal 8, @customer.invoices.length
  end

  def test_it_can_find_related_transactions
    assert @customer.transactions
    assert_equal 8, @customer.transactions.length
  end

  def test_it_can_find_favorite_merchant_by_amount_of_successful_transactions
    assert @customer.favorite_merchant
    assert_equal "Schroeder-Jerde", @customer.favorite_merchant[0].name
  end

end
