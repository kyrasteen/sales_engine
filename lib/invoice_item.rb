require 'bigdecimal'
require 'date'

class InvoiceItem

  attr_reader :id, :created_at, :updated_at, :item_id, :invoice_id, :quantity, :unit_price, :invoice_items_repo_self

  def initialize(line, invoice_items_repo_self)
    @id = line[:id].to_i
    @invoice_id = line[:invoice_id].to_i
    @item_id = line[:item_id].to_i
    @created_at = Date.parse(line[:created_at])
    @updated_at = Date.parse(line[:updated_at])
    @quantity = line[:quantity]
    @unit_price = BigDecimal(line[:unit_price].to_i).round(2)
    @invoice_items_repo_self = invoice_items_repo_self
  end

  def invoice
    @invoice_items_repo_self.find_invoices(invoice_id)
  end

  def item
    @invoice_items_repo_self.find_item(item_id)
  end

  def total_price
    @quantity.to_i * @unit_price.to_i
  end

end
