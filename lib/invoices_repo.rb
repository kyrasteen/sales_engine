require 'csv'
require_relative 'sales_engine'
require_relative 'invoices_parser'
class InvoicesRepo

  attr_reader :data, :filename, :se_self

  def initialize(filename, se_self)
    @se_self = se_self
    @filename = filename
    @data = invoices_parser.parse
  end

  def invoices_parser
    @invoices_parser ||= InvoicesParser.new(filename, self)
  end

  def find_transactions(invoice_id)
    se_self.transactions_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_invoice_items(invoice_id)
    se_self.invoice_items_repository.find_all_by_invoice_id(invoice_id)
  end

  # def find_items_thru_invoice_items(invoice_id)
  #   se_self.invoice_items_repository.find_all_by_invoice_id(invoice_id)
  # end

  # def find_customer(invoice_id)
  #   se_self.customers_repository.find_all_by_invoice_id(invoice_id)
  # end

  # def find_merchant(invoice_id)
  #   se_self.merchants_repository.find_all_by_invoice_id(invoice_id)
  # end

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
