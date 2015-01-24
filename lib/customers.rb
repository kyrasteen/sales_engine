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
    cr_self.find_all_by_id(id)
  end

end
