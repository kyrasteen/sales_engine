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
    assert_instance_of MerchantRepo, @engine.merchant_repository
  end

  def test_it_creates_customer_repo
    assert_instance_of CustomerRepo, @engine.customer_repository
  end

  def test_it_creates_invoice_items_repo
    assert_instance_of InvoiceItemsRepo, @engine.invoice_item_repository
  end

  def test_it_creates_invoices_repo
    assert_instance_of InvoiceRepo, @engine.invoice_repository
  end

  def test_it_creates_items_repo
    assert_instance_of ItemsRepo, @engine.item_repository
  end

  def test_it_creates_transactions_repo
    assert_instance_of TransactionRepo, @engine.transaction_repository
  end

  def test_startup_return_repo_object
    assert @engine.startup.is_a?(MerchantRepo)
  end


end
