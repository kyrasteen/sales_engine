class Transactions
  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at, :mr_self

  def initialize(data, mr_self)
    @id = data[:id].to_i
    @invoice_id = data[:invoice_id]
    @credit_card_number = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result = data[:result]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @mr_self = mr_self
  end

  def invoice
    mr_self.transactions_repository.find_all_by_invoice_id(id)
  end

end
