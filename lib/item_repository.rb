require 'csv'
require_relative 'item_parser'
require_relative 'sales_engine'

class ItemsRepo

  attr_reader :data, :filename, :se_self

  def initialize(filename, se_self)
    @filename = filename
    @data = items_parser.parse
    @se_self = se_self
  end

  def items_parser
    @items_parser ||= ItemParser.new(filename, self)
  end

  def find_successful_transactions_for_item
    data.collect do |item|
      found_invoice_items = item.invoice_items
      found_invoice_items.collect do |invoice_item|
        found_invoices = invoice_item.invoice
          found_invoices.select do |invoice|
            found_transactions = invoice.transactions
              found_transactions.select do |transaction|
                transaction.result == "success"
              end
          end
      end
    end
  end


  def most_revenue(top_num)

    # most_items(x) returns the top x item instances ranked by total number sold
    
    find_successful_transactions_for_item
    #iterating over successful transactions
    #invoice items: revenue = qty * unit_price
    #calc revenue
    #return top 2 items by revenue

  end

    #each item find your invoice_items
    #for each invoice_item, find your one invoice
    #for each invoice find all of your successful transactions
    #if no successful transaction, don't do the math

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
    find_by_attribute(:name,name)
  end

  def find_all_by_name(name)
    find_all_by_attribute(:name, name)
  end

  def find_by_description(description)
    find_by_attribute(:description, description)
  end

  def find_by_unit_price(unit_price)
    find_by_attribute(:unit_price, unit_price)
  end

  def find_by_merchant_id(merchant_id)
    find_by_attribute(:merchant_id, merchant_id)
  end

  def find_all_by_description(description)
    find_all_by_attribute(:description, description)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by_attribute(:unit_price, unit_price)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_attribute(:merchant_id, merchant_id)
  end

  def find_invoice_items(id)
    se_self.invoice_item_repository.find_all_by_item_id(id)
  end

  def find_merchant(merchant_id)
    se_self.merchant_repository.find_by_id(merchant_id)
  end

  private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

end
