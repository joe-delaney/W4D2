module Stepable 
  require "byebug"
  def moves 
    possible_moves = []
    directions = move_diffs 
    directions.each do |direction|
      new_row = pos[0]+direction[0]
      new_col = pos[1]+direction[1]
      new_p = [new_row, new_col]
      possible_moves << new_p if valid?(new_p)
    end
    possible_moves
  end 


  private 
  def valid?(pos)
    row, col = pos 
    (row >= 0 && col >= 0 && row < board.length && col < board.length && 
    (board[pos].is_a?(NullPiece) || board[pos].color != color))
  end

  def move_diffs 
    # OVERWRITTEN BY PIECE INSTANCE
  end 
end