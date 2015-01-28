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
    mr_self.find_invoices(id)
  end

  def successful_invoices
    invoices.select { |invoice| invoice.successful_transaction? }
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
    found_customers = successful_invoices.group_by { |invoice| invoice.customer}
    found_customers.max_by { |customer, invoices| invoices.length }[0]
  end

  def customers_with_pending_invoices
    pending_invoices = invoices - successful_invoices
    pending_invoices.map { |invoice| invoice.customer }
  end

end
