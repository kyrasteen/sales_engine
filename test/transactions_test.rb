require 'minitest/autorun'
require_relative '../lib/transactions'
require_relative '../lib/transactions_parser'
# require_relative '../lib/invoice'

class TransactionsTest < Minitest::Test
  def test_it_stores_an_id
    transactions = Transactions.new({:id => 6}, nil)
    assert_equal 6, transactions.id
  end

  def test_it_stores_ids_as_integers_only
    transactions = Transactions.new({:id => '6'}, nil)
    assert_equal 6, transactions.id
  end

  def test_it_stores_a_credit_card_number
    transactions = Transactions.new({:credit_card_number => '12345'}, nil)
    assert_equal "12345", transactions.credit_card_number
  end
end

# class FakeMerchantRepository
#   attr_accessor :invoices

#   def find_invoices_by_merchant_id(id)
#     @invoices
#   end
# end


#this is where we test the bridge to invoices
# class MerchantIntegrationTest < Minitest::Test
#   def test_it_finds_related_invoice
#     @merchant_repo = FakeMerchantRepository.new
#     data = {:name => "My Shop"}
#     @merchant = Merchant.new(data, @merchant_repo)

#     invoices = Array.new(5){ Invoice.new }
#     @merchant_repo.invoices = invoices

#     assert_equal invoices, @merchant.invoices
#   end
# end





