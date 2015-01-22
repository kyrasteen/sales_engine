require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_items_repo'

class InvoiceItemsRepoTest < Minitest::Test


  def test_it_finds_all
    filename = './test/support/invoice_items_test_data.csv'
    invoice_items = InvoiceItemsRepo.new(filename)
    assert_equal 19, invoice_items.all.length
  end

  def test_it_can_find_by_id
    filename = './test/support/invoice_items_test_data.csv'
    invoice_items = InvoiceItemsRepo.new(filename)
    assert_equal "1", invoice_items.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    filename = './test/support/invoice_items_test_data.csv'
    invoice_items = InvoiceItemsRepo.new(filename)
    assert_equal 2, invoice_items.find_all_by_id(5).count
  end

  def test_it_can_find_by_created_at
    filename = './test/support/invoice_items_test_data.csv'
    invoice_items = InvoiceItemsRepo.new(filename)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.find_by_created_at('2012-03-27 14:54:09 UTC').created_at
  end

  def test_it_can_find_all_by_created_at
    filename = './test/support/invoice_items_test_data.csv'
    invoice_items = InvoiceItemsRepo.new(filename)
    assert_equal 15, invoice_items.find_all_by_created_at('2012-03-27 14:54:09 UTC').count
  end

  def test_it_can_find_by_updated_at
    filename = './test/support/invoice_items_test_data.csv'
    invoice_items = InvoiceItemsRepo.new(filename)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.find_by_updated_at('2012-03-27 14:54:09 UTC').updated_at
  end

  def test_it_can_find_all_by_updated_at
    filename = './test/support/invoice_items_test_data.csv'
    invoice_items = InvoiceItemsRepo.new(filename)
    assert_equal 15, invoice_items.find_all_by_updated_at('2012-03-27 14:54:09 UTC').count
  end

end
