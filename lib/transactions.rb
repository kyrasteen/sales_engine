class Transactions
  attr_reader :id, :invoice_id, :credit_card_number,
    :credit_card_expiration_date, :result, :created_at, :updated_at, :tr_self

  def initialize(data, tr_self)
    @id = data[:id].to_i
    @invoice_id = data[:invoice_id]
    @credit_card_number = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result = data[:result]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @tr_self = tr_self
  end

  def invoice
    tr_self.find_invoices(invoice_id.to_i)
  end

end
