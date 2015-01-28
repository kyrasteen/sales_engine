class Merchant

  attr_reader :id, :name, :created_at, :updated_at, :mr_self

  def initialize(line, mr_self)
    @id = line[:id].to_i
    @name = line[:name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @mr_self = mr_self
  end

  def items
    mr_self.find_items(id.to_s)
  end

  def invoices
    mr_self.find_invoices(id.to_s)
  end

  def successful_invoices
    invoices.select do |invoice|
      invoice.transactions.select { |transaction| transaction.successful? }
    end
  end

  def revenue(date = nil)
    if date
      invoice_pool = successful_invoices.select { |invoice| invoice.updated_at == date }
    else
      invoice_pool = successful_invoices
    end
    invoice_pool.reduce(0) do |revenue, invoice|
      revenue + invoice.total_amount_billed
    end
  end

  def favorite_customer
    #find invoices with successful transaction
    #for each invoice find customer
    #group invoices by customer
    #find largest group and return corresponding customer object
    found_customers = successful_invoices.group_by { |invoice| invoice.customer[0] }
    #require 'pry'; binding.pry
    found_customers.max_by { |customer, found_invoices| found_invoices.length }
  end

end
