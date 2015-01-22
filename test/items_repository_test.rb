require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/items_repo'

class ItemsRepoTest < Minitest::Test

  def test_it_finds_all
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal 20, items.all.length
  end

  def test_it_can_find_by_id
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal "1", items.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal 2, items.find_all_by_id(19).count
  end

  def test_it_can_find_by_created_at
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal "2012-03-27 14:53:59 UTC", items.find_by_created_at('2012-03-27 14:53:59 UTC').created_at
  end

  def test_it_can_find_all_by_created_at
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal 20, items.find_all_by_created_at('2012-03-27 14:53:59 UTC').count
  end

  def test_it_can_find_by_updated_at    
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal "2012-03-27 14:53:59 UTC", items.find_by_updated_at('2012-03-27 14:53:59 UTC').updated_at
  end

  def test_it_can_find_all_by_updated_at
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal 20, items.find_all_by_updated_at('2012-03-27 14:53:59 UTC').count
  end

  def test_it_can_find_by_name
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal 'Item Qui Esse', items.find_by_name('Item Qui Esse').name
  end

  def test_it_can_find_all_by_name
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal 2, items.find_all_by_name('Item Rerum Saepe').count
  end

  def test_it_can_find_by_description
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    description = "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro."
    assert_equal description, items.find_by_description(description).description
  end

  def test_it_can_find_by_unit_price
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal "75107", items.find_by_unit_price('75107').unit_price
  end

  def test_can_find_by_merchant_id
    filename = './test/support/items_test_data.csv'
    items = ItemsRepo.new(filename)
    assert_equal "2", items.find_by_merchant_id('2').merchant_id
  end


end
