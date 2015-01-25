require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require_relative '../lib/invoices_parser'
require_relative '../lib/invoices'


class InvoicesTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    @invoices_se_repo = engine.invoices_repository('test/support/invoices_test_data.csv').data[0]
  end

  def test_it_stores_an_id
    assert_equal 1, @invoices_se_repo.id
  end

  def test_it_stores_a_status
    assert_equal "shipped", @invoices_se_repo.status
  end

  def test_it_finds_related_transactions
    assert @invoices_se_repo.transactions
    assert_equal 1, @invoices_se_repo.transactions.length
  end

  def test_it_finds_related_invoice_items
    assert @invoices_se_repo.invoice_items
  
    assert_equal 0, @invoices_se_repo.invoice_items.length
  end

  # def test_it_finds_related_items
  #   assert @invoices_se_repo.items
  #   assert_equal 1, @invoices_se_repo.item.length
  # end

  # def test_it_finds_related_customers
  #   assert @invoices_se_repo.customer
  #   assert_equal 1, @invoices_se_repo.customer.length
  # end

  # def test_it_finds_related_merchants
  #   assert @invoices_se_repo.merchant
  #   assert_equal 1, @invoices_se_repo.merchant.length
  # end


end