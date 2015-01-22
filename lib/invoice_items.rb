class InvoiceItems

  attr_reader :id, :created_at, :updated_at, :item_id, :invoice_id, :quantity, :unit_price

  def initialize(line, parent)
    @id = line[:id].to_i
    @invoice_id = line[:invoice_id].to_i
    @item_id = line[:item_id].to_i
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @quantity = line[:quantity]
    @unit_price = line[:unit_price]
  end

end
