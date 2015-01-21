require 'csv'

class MerchantsRepo

  def load_file(filename)
    CSV.read(filename, headers:true, header_converters: :symbol)
  end

  def

end
