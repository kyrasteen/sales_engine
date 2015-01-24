class Items
  attr_reader :id, :name, :created_at, :updated_at, :merchant_id, :unit_price, :description

  def initialize(line, mr_self)
    @id = line[:id].to_i
    @name = line[:name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @description = line[:description]
    @unit_price = line[:unit_price]
    @merchant_id = line[:merchant_id]

  end
end
