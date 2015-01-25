class InvoiceItems

  attr_reader :id, :created_at, :updated_at, :item_id, :invoice_id, :quantity, :unit_price, :invoice_items_repo_self

  def initialize(line, invoice_items_repo_self)
    @id = line[:id].to_i
    @invoice_id = line[:invoice_id].to_i
    @item_id = line[:item_id].to_i
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @quantity = line[:quantity]
    @unit_price = line[:unit_price]
    @invoice_items_repo_self = invoice_items_repo_self
  end

  def invoice
    @invoice_items_repo_self.find_invoices(id)
  end

  def item
    @invoice_items_repo_self.find_item(id)
  end

end
