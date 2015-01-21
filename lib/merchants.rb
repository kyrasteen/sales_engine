class Merchants

  attr_reader :id, :name

  def initialize(line, my_parent)
    @line = line
    @id = line[:id].to_i
    @name = line[:name]
  end

end
