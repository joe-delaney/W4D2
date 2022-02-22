module Slideable 
  HORIZONTAL_DIRS = [[0,1], [1,0], [0,-1],[-1,0]]
  DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]] 

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def moves
    possible_moves = []
    directions = move_dirs
    directions.each do |direction|
      dx = direction[0]
      dy = direction[1]
      possible_moves += grow_unblocked_moves_in_dr(dx, dy)
    end
    possible_moves
  end

  private
  def move_dirs
    #Dummy method, should get overwitten by subclass
    horizontal_dirs + diagonal_dirs
  end

  require "byebug"
  def grow_unblocked_moves_in_dr(dx, dy)
    # debugger
    start_pos = pos 
    unblocked_moves = []

    new_row = start_pos[0] + dx
    new_col = start_pos[1] + dy
    new_pos = [new_row, new_col ]
    while board[new_pos].nil? && new_row >= 0 && new_col >= 0 && 
      new_row < board.length && new_col < board.length
      unblocked_moves << new_pos 
      new_row = new_row + dx
      new_col = new_col + dy
      new_pos = [new_row, new_col]
    end
    unblocked_moves
  end
end 