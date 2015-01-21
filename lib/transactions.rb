class Transactions
  attr_reader :id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

  def initialize(data, my_parent)
    @id = data[:id].to_i
    @credit_card_number = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result = data[:result]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  # def invoices
  #   @parent.find_invoices_by_merchant_id(id)
  # end
end