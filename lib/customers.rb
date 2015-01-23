class Customers
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :sales_engine

  def initialize(data, sales_engine)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @sales_engine = sales_engine
    
  end

  def invoices
    sales_engine.invoices_repository.find_by_customer_id(customer_id)
  end

end
