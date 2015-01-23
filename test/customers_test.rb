require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customers'

class CustomersTest < Minitest::Test

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
    skip
    customers = Customers.new({invoice:'kyra'}, nil)
    assert_equal "kyra", customers.invoice
  end

end

class CustomerIntegrationTest < Minitest::Test
  require_relative "../lib/customers_parser"
  require_relative "../lib/invoices"

  def test_customers_can_access_invoices
    data = { id: 1}
    customers = Customers.new(data, nil)
    invoices = Array.new(5){Invoices.new(data, )}

    assert_equal invoices, customers.invoices
  end
end
