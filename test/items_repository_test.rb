require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item_repository'

class ItemsRepoTest < Minitest::Test

  def setup
    filename = './test/support/items_test_data.csv'
    @items = ItemsRepo.new(filename, nil)
  end

  def test_it_finds_all
    assert_equal 20, @items.all.length
  end

  def test_it_can_find_by_id
    assert_equal "1", @items.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    assert_equal 2, @items.find_all_by_id(19).count
  end

  def test_it_can_find_by_created_at
    date = Date.parse('2012-03-27 14:53:59 UTC')
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), @items.find_by_created_at(date).created_at
  end

  def test_it_can_find_all_by_created_at
    assert_equal 20, @items.find_all_by_created_at(Date.parse('2012-03-27 14:53:59 UTC')).count
  end

  def test_it_can_find_by_updated_at
    date = Date.parse('2012-03-27 14:53:59 UTC')
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), @items.find_by_updated_at(date).updated_at
  end

  def test_it_can_find_all_by_updated_at
    date = Date.parse('2012-03-27 14:53:59 UTC')
    assert_equal 20, @items.find_all_by_updated_at(date).count
  end

  def test_it_can_find_by_name
    assert_equal 'Item Qui Esse', @items.find_by_name('Item Qui Esse').name
  end

  def test_it_can_find_all_by_name
    assert_equal 2, @items.find_all_by_name('Item Rerum Saepe').count
  end

  def test_it_can_find_by_description
    description = "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro."
    assert_equal description, @items.find_by_description(description).description
  end

  def test_it_can_find_by_unit_price
    assert_equal BigDecimal("75107"), @items.find_by_unit_price(BigDecimal('75107'))
  end

  def test_can_find_by_merchant_id
    assert_equal "2", @items.find_by_merchant_id('2').merchant_id
  end

  def test_it_can_find_top_two_ranked_items_by_revenue

    assert_equal [],  @items.most_revenue(2)
  end



end
