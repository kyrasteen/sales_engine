require_relative '../lib/repository'
require 'minitest/autorun'
require 'minitest/pride'

class RepositoryTest < Minitest::Test
  def test_it_exists
    repo = Repository.new
  end

  def test_can_find_all
    skip
  end

end
