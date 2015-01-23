require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoices_repo'

class InvoicesRepoTest < Minitest::Test

  def setup
    filename = './test/support/invoices_test_data.csv'
    @invoices_repo = InvoicesRepo.new(filename, nil)
  end

  def test_it_finds_all
    assert_equal 19, @invoices_repo.all.length
  end

  def test_it_can_find_by_id
    assert_equal "1", @invoices_repo.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    assert_equal 1, @invoices_repo.find_all_by_id(5).count
  end

  def test_it_can_find_by_created_at
    assert_equal '2012-03-25 09:54:09 UTC', @invoices_repo.find_by_created_at('2012-03-25 09:54:09 UTC').created_at
  end

  def test_it_can_find_all_by_created_at
    assert_equal 1, @invoices_repo.find_all_by_created_at('2012-03-25 09:54:09 UTC').count
  end

  def test_it_can_find_by_updated_at
    assert_equal "2012-03-25 09:54:09 UTC", @invoices_repo.find_by_updated_at('2012-03-25 09:54:09 UTC').updated_at
  end

  def test_it_can_find_all_by_updated_at
    assert_equal 1, @invoices_repo.find_all_by_updated_at('2012-03-25 09:54:09 UTC').count
  end

  def test_it_can_find_by_customer_id
    assert_equal '3', @invoices_repo.find_by_customer_id('3').customer_id
  end

  def test_it_can_find_all_by_customer_id
    assert_equal 4, @invoices_repo.find_all_by_customer_id('3').count
  end

  def test_it_can_find_by_merchant_id
    assert_equal '34', @invoices_repo.find_by_merchant_id('34').merchant_id
  end

  def test_it_can_find_all_by_merchant_id
    assert_equal 2, @invoices_repo.find_all_by_merchant_id('44').count
  end

  def test_it_can_find_by_status
    assert_equal 'shipped', @invoices_repo.find_by_status('shipped').status
  end

  def test_it_can_find_all_by_merchant_id
    assert_equal 19, @invoices_repo.find_all_by_status('shipped').count
  end

end
