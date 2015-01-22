class Merchants

  attr_reader :id, :name, :created_at

  def initialize(line, my_parent)
    @id = line[:id].to_i
    @name = line[:name]
    @created_at = line[:created_at]
  end

end
