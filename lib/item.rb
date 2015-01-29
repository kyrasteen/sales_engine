require 'bigdecimal'

class Item
  attr_reader :id, :name, :created_at, :updated_at, :merchant_id,
    :unit_price, :description, :ir_self

  def initialize(line, ir_self)
    @id = line[:id].to_i
    @name = line[:name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @description = line[:description]
    @unit_price = BigDecimal(line[:unit_price].to_i).round(2)
    @merchant_id = line[:merchant_id]
    @ir_self = ir_self
  end

  def invoice_items
    ir_self.find_invoice_items(id)

  end

  def merchant
    ir_self.find_merchant(merchant_id.to_i)
  end

  def find_best_date
     #array of invoice items by item id

    invoice_items.group_by do |invoice_item|
      collection_of_invoices = invoice_item.invoice
      collection_of_invoices.map { |invoice| invoice.updated_at }.max
    end
  end

=begin
given an item, go to the invoice item to find out what invoices it belongs to. you'll have an array of invoice items
-iterate through the invoice items to find the invoices by invoice id
-return array of invoices
-go get the transactions by invoice_id
-if the transaction, is successful, do the math
  else don't include the failure in the calc
-iterate over the invoices
for each invoice, take the invoice id and pass it to find transactions by id
=end
    #these are invoice_items selected by item id

  def hey_invoice_items_get_my_invoices_said_the_item
    invoice_items.map {|invoice_item| invoice_item.invoice.first }
  end

  def find_transactions_by_invoice_id(invoice_id)
   ir_self.se_self.transaction_repository.find_all_by_invoice_id(invoice_id)
  end

  def successfully_paid?(invoice_id)
    find_transactions_by_invoice_id(invoice_id).select do |transaction| transaction.successful?
    end
  end

  def best_day
    invoice_items_with_successful_transactions =
      invoice_items.select do |invoice_item|
        invoice = invoice_item.invoice[0]
        successfully_paid?(invoice.id)
      end

    invoice_items_by_day =
      invoice_items_with_successful_transactions.group_by do |invoice_item|
        invoice_item.invoice[0].updated_at
      end

    item_sales_by_day =
      invoice_items_by_day.inject({}) do |item_sales_by_day, (date, invoice_items)|
        item_sales_by_day[date] = invoice_items.reduce(0) do |sum, invoice_item|
          sum + invoice_item.quantity
        end
        item_sales_by_day
      end

    sorted_item_sales =
      item_sales_by_day.sort do |a, b|
        b[1] <=> a[1]
      end

    date = Date.parse(sorted_item_sales[0][0])
    date.strftime('%a, %d %b %Y')
  end

end
