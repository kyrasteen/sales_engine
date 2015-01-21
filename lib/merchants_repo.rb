require 'csv'
require_relative 'merchants_parser'

class MerchantsRepo

  attr_reader :invoices, :data

  def initialize
    merchants = MerchantsParser.new(filename)
    @data = merchants.parse
  end

  def find_invoices_by_merchant_id(id_number)
    @invoices =

  end


end
