class Pawn < Piece

  def initialize(color, board, pos)
    super
    @symbol = :P
  end 

  def to_s 
    @symbol
  end

end