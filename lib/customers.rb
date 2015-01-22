class Customers
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(data, my_parent)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  # def invoice
  # end

end
