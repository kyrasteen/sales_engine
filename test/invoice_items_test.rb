require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class InvoiceItemTest < Minitest::Test

  def setup
    engine = SalesEngine.new
    @invoice_items_se_repo = engine.invoice_item_repository('./test/support/invoice_items_test_data.csv').data[0]
  end

  def test_it_stores_an_id
    invoice_items = InvoiceItem.new({id:1}, nil)
    assert_equal 1, invoice_items.id
  end

  def test_it_stores_id_as_integer
    invoice_items = InvoiceItem.new({id:'1'}, nil)
    assert_equal 1, invoice_items.id
  end

  def test_it_stores_a_item_id
    invoice_items = InvoiceItem.new({item_id: 531}, nil)
    assert_equal 531, invoice_items.item_id
  end

  def test_it_can_find_an_invoice
    @invoice_items_se_repo.invoice
    assert_equal 1, @invoice_items_se_repo.invoice.length
  end

  def test_it_can_find_an_item
    @invoice_items_se_repo.item
    assert_equal 1, @invoice_items_se_repo.item.length
  end

end
