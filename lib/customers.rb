class Customers
  attr_reader :id, :first_name, :last_name,
    :created_at, :updated_at, :cr_self

  def initialize(data, cr_self)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @cr_self    = cr_self
  end

  def invoices
    cr_self.find_invoices(id.to_s)
  end

  def transactions
    invoices.map { |invoice| invoice.transactions }
  end

  def successful_invoices
      invoices.select do |invoice|
        found_transactions = invoice.transactions
        found_transactions.select { |transaction| transaction.result == 'success' }
    end
  end

  def favorite_merchant
    merchants = successful_invoices.group_by { |invoice| invoice.merchant[0] }
    merchants.max_by { |merchant, invoices| invoices.length }
  end

end
