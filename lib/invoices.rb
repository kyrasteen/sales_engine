class Invoices
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :invoice_repo_self

  def initialize(line, invoice_repo_self)
    @id = line[:id].to_i
    @customer_id = line[:customer_id]
    @merchant_id = line[:merchant_id]
    @status = line[:status]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @invoice_repo_self = invoice_repo_self
  end

  def transactions
    invoice_repo_self.find_all_by_id(id) 
  end

  # def invoice_items
    # invoice_repo_self. 
  # end

  # def items
    # invoice_repo_self. 
  # end

  # def customer
    # invoice_repo_self. 
  # end

  # def merchant
    # invoice_repo_self. 
  # end



end
