require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items'

class InvoiceItemsTest < Minitest::Test

  def test_it_stores_an_id
    invoice_items = InvoiceItems.new({id:1}, nil)
    assert_equal 1, invoice_items.id
  end

  def test_it_stores_id_as_integer
    invoice_items = InvoiceItems.new({id:'1'}, nil)
    assert_equal 1, invoice_items.id
  end

  def test_it_stores_a_item_id
    invoice_items = InvoiceItems.new({item_id: 531}, nil)
    assert_equal 531, invoice_items.item_id
  end

end
