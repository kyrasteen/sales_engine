class Invoices
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(line, my_parent)
    @id = line[:id].to_i
    @customer_id = line[:customer_id]
    @merchant_id = line[:merchant_id]
    @status = line[:status]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
  end

end