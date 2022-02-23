class Pawn < Piece

  def initialize(color, board, pos)
    super
    @symbol = :P
  end 

  def to_s 
    @symbol
  end

  def moves
    possible_moves = []

    new_row = pos[0]
    (1..forward_steps).each do |i|
      new_row = new_row + forward_dir
      new_pos = [new_row, pos[1]]
      if valid?(new_pos) && !(possible_moves.length == 0 && i == 2)
        possible_moves << new_pos 
      end
    end

    possible_attacks = side_attacks(pos)
    possible_attacks.each do |attack_pos|
      possible_moves << attack_pos if valid_attack?(attack_pos)
    end
    possible_moves
  end

  private 
  def valid?(pos)
    row, col = pos 
    (row >= 0 && col >= 0 && row < board.length && col < board.length 
    && board[pos].is_a?(NullPiece))
  end

  def valid_attack?(pos)
    row, col = pos 
    (row >= 0 && col >= 0 && row < board.length && col < board.length 
    && board[pos].color != color && !board[pos].is_a?(NullPiece))
  end

  def forward_dir
    if color == :black 
      return 1
    else
      return -1
    end
  end

  def forward_steps
    at_start_row? ? 2 : 1
  end

  def at_start_row?
    return true if color == :white && pos[0] == 6
    return true if color == :black && pos[0] == 1
    return false
  end

  def side_attacks(pos)
    row, col = pos
    if color == :white
      possible_attack_1 = [row-1][col-1]
      possible_attack_2 = [row-1][col+1]
    else
      possible_attack_1 = [row+1][col-1]
      possible_attack_2 = [row+1][col+1]
    end
    [possible_attack_1, possible_attack_2]
  end

end