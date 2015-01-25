require 'csv'
require_relative 'invoice_items_parser'

class InvoiceItemsRepo

  attr_reader :data, :filename, :se_self

  def initialize(filename, se_self)
    @filename = filename
    @data = invoice_items_parser.parse
    @se_self = se_self
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

  def find_by_item_id(item_id)
    find_by_attribute(:item_id, item_id)
  end

  def find_all_by_item_id(item_id)
    find_all_by_attribute(:item_id, item_id)
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

  def find_invoices(invoice_id)
    se_self.invoices_repository.find_all_by_id(invoice_id)
  end

  def find_item(item_id)
    se_self.invoices_repository.find_all_by_id(item_id)
  end


  private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row, index| row.send(attribute) == criteria }
  end


end
