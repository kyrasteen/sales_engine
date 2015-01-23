require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items_repo'

class InvoiceItemsRepoTest < Minitest::Test

  def setup
    filename = './test/support/invoice_items_test_data.csv'
    @invoice_items = InvoiceItemsRepo.new(filename, nil)
  end

  def test_it_finds_all
    assert_equal 19, @invoice_items.all.length
  end

  def test_it_can_find_by_id
    assert_equal "1", @invoice_items.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    assert_equal 2, @invoice_items.find_all_by_id(5).count
  end

  def test_it_can_find_by_invoice_id
    assert_equal "1", @invoice_items.find_by_invoice_id(1).invoice_id.to_s
  end

  def test_it_can_find_all_by_invoice_id
    assert_equal 8, @invoice_items.find_all_by_invoice_id(1).count
  end

  def test_it_can_find_by_created_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_items.find_by_created_at('2012-03-27 14:54:09 UTC').created_at
  end

  def test_it_can_find_all_by_created_at
    assert_equal 15, @invoice_items.find_all_by_created_at('2012-03-27 14:54:09 UTC').count
  end

  def test_it_can_find_by_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_items.find_by_updated_at('2012-03-27 14:54:09 UTC').updated_at
  end

  def test_it_can_find_all_by_updated_at
    assert_equal 15, @invoice_items.find_all_by_updated_at('2012-03-27 14:54:09 UTC').count
  end

  def test_it_can_find_by_quantity
    assert_equal 9, @invoice_items.find_by_quantity(9).quantity.to_i
  end

  def test_it_can_find_by_all_by_unit_price
    assert_equal 2, @invoice_items.find_all_by_unit_price(72018).count
  end

end
