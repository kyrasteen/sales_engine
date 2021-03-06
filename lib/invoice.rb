require 'date'

class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :invoice_repo_self

  def initialize(line, invoice_repo_self)
    @id = line[:id].to_i
    @customer_id = line[:customer_id].to_i
    @merchant_id = line[:merchant_id].to_i
    @status = line[:status]
    @created_at = Date.parse(line[:created_at])
    @updated_at = Date.parse(line[:updated_at])
    @invoice_repo_self = invoice_repo_self
  end

  def transactions
    invoice_repo_self.find_transactions(id)
  end

  def invoice_items
   invoice_repo_self.find_invoice_items(id)
  end

  def items
    invoice_repo_self.find_items(id)
  end

  def customer
    invoice_repo_self.find_customer(customer_id)
  end

  def merchant
    invoice_repo_self.find_merchant(merchant_id)
  end

  def total_amount_billed
    invoice_items.reduce(0) do |sum, invoice_item|
      sum + invoice_item.total_price
    end
  end

  def successful_transaction?
    transactions.any? { |transaction| transaction.successful? }
  end

end
