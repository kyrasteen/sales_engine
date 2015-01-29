require 'csv'
require_relative 'sales_engine'
require_relative 'merchant_parser'
require 'bigdecimal'

class MerchantRepo

  attr_reader :data, :filename, :se_self

  def initialize(filename, se_self)
    @se_self = se_self
    @filename = filename
    @data = merchants_parser.parse
  end

  def merchants_parser
    @merchants_parser ||= MerchantParser.new(filename, self)
  end

  def all
    data
  end

  def find_random
    rand(0..data.length)
  end

  def random
    data[find_random]
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_all_by_id(id)
    find_all_by_attribute(:id, id)
  end

  def find_by_created_at(time)
    find_by_attribute(:created_at, time)
  end

  def find_all_by_created_at(time)
    find_all_by_attribute(:created_at, time)
  end

  def find_by_updated_at(time)
    find_by_attribute(:updated_at, time)
  end

  def find_all_by_updated_at(time)
     find_all_by_attribute(:updated_at, time)
  end

   def find_by_name(name)
    find_by_attribute(:name, name)
  end

  def find_all_by_name(name)
    find_all_by_attribute(:name, name)
  end

  def find_items(merchant_id)
    se_self.item_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_invoices(merchant_id)
    se_self.invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def most_revenue(number)
    found_revenues = data.sort_by { |merchant| merchant.revenue }
    found_revenues.reverse.take(number)
  end

  def most_items(number)
    result = all.sort_by do |merchant|
      invoices = merchant.successful_invoices
      items_sold_for_all_invoices(invoices)
    end
    result.reverse.take(number)
  end

  def revenue(date)
    #for each merchant find their revenue and pass in date
    #reduce revenues
    result = data.reduce(0) { |total, merchant| total + merchant.revenue(date) }
    BigDecimal(result)
  end


private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

  def items_sold_for_invoice(invoice)
    invoice.invoice_items.reduce(0) do |items_sold, invoice_item|
      items_sold + invoice_item.quantity.to_i
    end
  end

  def items_sold_for_all_invoices(invoices)
    invoices.reduce(0) do |total_items, invoice|
      total_items + items_sold_for_invoice(invoice)
    end
  end
end
