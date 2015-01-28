require 'csv'
require_relative 'sales_engine'
require_relative 'invoice_parser'
class InvoiceRepo

  attr_reader :data, :filename, :se_self

  def initialize(filename, se_self)
    @se_self = se_self
    @filename = filename
    @data = invoice_parser.parse
  end

  def invoice_parser
    @invoice_parser ||= InvoiceParser.new(filename, self)
  end

  def find_transactions(invoice_id)
    se_self.transaction_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_invoice_items(invoice_id)
    se_self.invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_items(invoice_id)
    invoice_items = se_self.invoice_item_repository.find_all_by_invoice_id(invoice_id)
    invoice_items.map do |invoice_item|
      invoice_item.item 
    end
  end

  def find_customer(invoice_id)
    se_self.customer_repository.find_by_id(invoice_id)
  end

  def find_merchant(invoice_id)
    se_self.merchant_repository.find_all_by_id(invoice_id)
  end

  def all
    data
  end

  def find_random
    rand(0..data.length-1)
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

  def find_by_customer_id(customer_id)
    find_by_attribute(:customer_id ,customer_id )
  end

  def find_all_by_customer_id(customer_id)
    find_all_by_attribute(:customer_id, customer_id)
  end

  def find_by_merchant_id(merchant_id)
    find_by_attribute(:merchant_id, merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_attribute(:merchant_id,merchant_id)
  end

  def find_by_status(status)
    find_by_attribute(:status, status)
  end

  def find_all_by_status(status)
    find_all_by_attribute(:status, status)
  end

private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

end
