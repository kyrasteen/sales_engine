require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_repository'
require 'pry'

class CustomerRepoTest < Minitest::Test

  def setup
    filename = ('./test/support/customers_test_data.csv')
    @customers = CustomerRepo.new(filename, nil)
  end

  def test_it_finds_all
    assert_equal 19, @customers.all.length
  end

  def test_it_can_find_by_id
    assert_equal "1", @customers.find_by_id("1").id
  end

  def test_it_can_find_all_by_id
    assert_equal 2, @customers.find_all_by_id(19).count
  end

  def test_it_can_find_by_created_at
    assert_equal "2012-03-27 14:54:10 UTC", @customers.find_by_created_at('2012-03-27 14:54:10 UTC').created_at
  end

  def test_it_can_find_all_by_created_at
    assert_equal 6, @customers.find_all_by_created_at('2012-03-27 14:54:10 UTC').count
  end

  def test_it_can_find_by_updated_at
    assert_equal "2012-03-27 14:54:10 UTC", @customers.find_by_updated_at('2012-03-27 14:54:10 UTC').updated_at
  end

  def test_it_can_find_all_by_updated_at
    assert_equal 6, @customers.find_all_by_updated_at('2012-03-27 14:54:10 UTC').count
  end

end
