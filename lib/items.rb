class Items
  attr_reader :id, :name, :created_at, :updated_at, :merchant_id,
    :unit_price, :description, :ir_self

  def initialize(line, ir_self)
    @id = line[:id].to_i
    @name = line[:name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @description = line[:description]
    @unit_price = line[:unit_price]
    @merchant_id = line[:merchant_id]
    @ir_self = ir_self
  end

  def invoice_items
    ir_self.find_invoice_items(id)
  end

  def merchant
    ir_self.find_merchant(merchant_id.to_i)
  end
  
end
