class Piece 
  attr_reader :color, :board, :pos
  attr_writer :color
  def initialize (color, board, pos)
    @color = color 
    @board = board 
    @pos = pos
    board.add_piece(self, pos)
  end 

  def to_s 
    return :P
  end

  def moves 

  end

  def color=(new_color)
    @color = new_color
  end

  def valid_moves 

  end

  def empty? 
    return board[pos].nil? 
  end 
end 