require 'date'

class Transaction
  attr_reader :id, :invoice_id, :credit_card_number,
    :credit_card_expiration_date, :result, :created_at, :updated_at, :tr_self

  def initialize(data, tr_self)
    @id = data[:id].to_i
    @invoice_id = data[:invoice_id].to_i
    @credit_card_number = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result = data[:result]
    @created_at = Date.parse(data[:created_at])
    @updated_at = Date.parse(data[:updated_at])
    @tr_self = tr_self
  end

  def invoice
    tr_self.find_invoices(invoice_id)
  end

  def successful?
    result == 'success'
  end

end
