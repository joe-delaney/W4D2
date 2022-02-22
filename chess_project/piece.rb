class Piece 
  attr_reader :color, :board, :pos
  def initialize (color, board, pos)
    @color = color 
    @board = board 
    @pos = pos
  end 

  def to_s 
    return :P
  end

  def moves 

  end

  def valid_moves 

  end

  def empty? 
    return board[pos].nil? 
  end 
end 