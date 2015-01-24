require 'csv'
require_relative 'invoice_items_parser'

class InvoiceItemsRepo

  attr_reader :invoices, :data, :filename, :sales_engine

  def initialize(filename, sales_engine)
    @filename = filename
    @sales_engine = sales_engine
    @data = invoice_items_parser.parse
  end

  def invoice_items_parser
    @invoice_items_parser ||= InvoiceItemsParser.new(filename, self)
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

  def find_by_invoice_id(invoice_id)
    find_by_attribute(:invoice_id, invoice_id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by_attribute(:invoice_id, invoice_id)
  end

  def find_by_quantity(quantity)
    find_by_attribute(:quantity, quantity.to_s)
  end

  def find_all_by_quantity(quantity)
    find_all_by_attribute(:quantity, quantity.to_s)
  end

  def find_by_unit_price(price)
    find_by_attribute(:unit_price, price.to_s)
  end

  def find_all_by_unit_price(price)
    find_all_by_attribute(:unit_price, price.to_s)
  end


  private
  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row, index| row.send(attribute) == criteria }
  end


end
