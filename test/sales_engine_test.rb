require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def setup
    @engine = SalesEngine.new
  end

  def test_it_exists
    assert @engine
  end

  def test_it_creates_merchant_repo
    assert_instance_of MerchantsRepo, @engine.merchants_repository
  end

  def test_it_creates_customer_repo
    assert_instance_of CustomersRepo, @engine.customers_repository
  end

  def test_it_creates_invoice_items_repo
    assert_instance_of InvoiceItemsRepo, @engine.invoice_items_repository
  end

  def test_it_creates_invoices_repo
    assert_instance_of InvoicesRepo, @engine.invoices_repository
  end

  def test_it_creates_items_repo
    assert_instance_of ItemsRepo, @engine.items_repository
  end

  def test_it_creates_transactions_repo
    assert_instance_of TransactionsRepo, @engine.transactions_repository
  end

  def test_startup_return_repo_object
    assert @engine.startup.is_a?(MerchantsRepo)
  end
  

end
