class Merchants

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
    successful_invoices.reduce(0) do |revenue, invoice|
      revenue + invoice.total_amount_billed
    end
  end
end
