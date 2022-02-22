require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize
    @symbol = " "
    @color = nil
  end 

  def to_s 
    @symbol
  end

  def color=(value)
    @color = value
  end
end
