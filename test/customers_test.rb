require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class CustomersTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    @customer = engine.customers_repository('./test/support/customers_test_data.csv').data[0]
  end

  def test_it_stores_an_id
    customers = Customers.new({id:1}, nil)
    assert_equal 1, customers.id
  end

  def test_it_stores_id_as_integer
    customers = Customers.new({id:'1'}, nil)
    assert_equal 1, customers.id
  end

  def test_it_stores_a_first_name
    customers = Customers.new({first_name:'kyra'}, nil)
    assert_equal "kyra", customers.first_name
  end

  def test_it_can_find_an_invoice
    assert @customer.invoices
    assert_equal 1, @customer.id
  end

end
