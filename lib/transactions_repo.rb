require 'csv'

class TransactionsRepo 

  attr_reader :data

  def initialize
    @data = []
  end

  def load_file(path)
    rows = CSV.open(path, headers:true, header_converters: :symbol)
    @data = rows.select do |row|
        row
      end
      data
  end

  def invoice_id(row_id)
    #travel to row of row_id passed in
    line = data.select do |row|
      row[:id] == row_id
    end
    #then find its invoice_id
    line[:invoice_id]
  end

  def all
    [5,2]
  end

end
