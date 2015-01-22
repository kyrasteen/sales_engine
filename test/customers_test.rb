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

  def test_it_finds_related_invoices
    data =  { id:1 }
    customers_repo = CustomersRepo.new(data)
    customers = Customers.new(data, customers_repo)

    invoices = Array.new(5){Invoices.new}
    customers_repo.invoices = invoices
    assert_equal invoices, customers.invoices
  end
end
