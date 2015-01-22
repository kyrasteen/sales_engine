require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchants_repo'

class MerchantsRepoTest < Minitest::Test

  def setup
    filename = './test/support/merchants_test_data.csv'
    @merch = MerchantsRepo.new(filename)
  end

  def test_it_finds_all
    assert_equal 19, @merch.all.length
  end

  def test_it_can_find_by_id
    assert_equal "1", @merch.find_by_id(1).id.to_s
  end

  def test_it_can_find_all_by_id
    assert_equal 2, @merch.find_all_by_id(5).count
  end

  def test_it_can_find_by_id
    assert_equal "12", @merch.find_by_name('Kozey Group').id.to_s
  end

  def test_it_can_find_by_created_at
    assert_equal "2012-03-27 14:54:00 UTC", @merch.find_by_created_at('2012-03-27 14:54:00 UTC').created_at
  end

  def test_it_can_find_all_by_created_at
    assert_equal 9, @merch.find_all_by_created_at('2012-03-27 14:53:59 UTC').count
  end

  def test_it_can_find_by_updated_at
    assert_equal "2012-03-27 14:54:00 UTC", @merch.find_by_updated_at('2012-03-27 14:54:00 UTC').updated_at
  end

  def test_it_can_find_all_by_updated_at
    assert_equal 10, @merch.find_all_by_updated_at('2012-03-27 14:54:00 UTC').count
  end

  def test_it_can_find_by_name
    assert_equal 'Williamson Group', @merch.find_by_name('Williamson Group').name
  end

  def test_it_can_find_all_by_name
    assert_equal 2, @merch.find_all_by_name('Williamson Group').count
  end

end

#
# class MerchantRepoIntegrationTest < Minitest::Test
#
#   def test_repo_stores_data
#     m_parser = MerchantsParser.new(filename)
#     data = m_parser.parse
#     merch = MerchantsRepo.new
#     assert_equal 19, merch.data.count
#   end
#
# end
#
# # './test/support/merchants_test_data.csv'
