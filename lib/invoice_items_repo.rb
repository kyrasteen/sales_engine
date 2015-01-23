require 'csv'
require_relative 'invoice_items_parser'

class InvoiceItemsRepo

  attr_reader :invoices, :data, :invoice_items_parser

  def initialize(filename, se_self)
    @invoice_items_parser = InvoiceItemsParser.new(filename, se_self)
    @data = invoice_items_parser.parse
  end

  def all
    data
  end

  def random
    record = rand(0..data.length)
    data[record]
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
    data.each_with_index do |row, index|
      if row.send(attribute) == criteria
        return data[index]
      end
    end
  end

  def find_all_by_attribute(attribute, criteria)
    all_found = []
    data.each_with_index do |row, index|
      if row.send(attribute) == criteria
        all_found << data[index]
      end
    end
    all_found
  end


end
