require_relative 'pieces.rb'
class Board 
  BOARD_SIZE = 8
  
  attr_accessor :rows
  
  def fill_board 
    [:white, :black].each do |color|
      fill_back_rows(color)
      fill_pawn_rows(color)
    end
  end

  def initialize
    @rows = Array.new(BOARD_SIZE){Array.new(BOARD_SIZE, NullPiece.instance)}
    fill_board
  end

  def [](pos)
    row,col = pos 
    @rows[row][col]
  end

  def []=(pos,val)
    row,col = pos 
    @rows[row][col] = val
  end

  def length 
    BOARD_SIZE
  end

  def move_piece(start_pos, end_pos)
    raise "Invalid Start Position" if self[start_pos].is_a?(NullPiece)

    if !self[end_pos].is_a?(NullPiece) && self[end_pos].color == self[start_pos].color
      raise "Invalid End Position" 
    else
      moved = self[start_pos]
      self[end_pos] = moved
      self[start_pos] = NullPiece.instance
    end
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def fill_pawn_rows(color)
    color == :white ? i = 6 : i = 1
    (0...BOARD_SIZE).each do |j|
      Pawn.new(color, self, [i,j])
    end
  end

  def fill_back_rows(color)
    pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    color == :white ? i = 7 : i = 0
    pieces.each_with_index do |piece, j|
      piece.new(color, self, [i,j])
    end
  end

  def print_board 
    narr = []
    @rows.each do |w|
        x = []
      w.each do |i|
        if i == nil 
          x << 'o'
        else
          x << i.to_s
        end
      end
      narr << x 
    end
    narr.each do |ele|
      p ele.join(' ')
     end
  end
 end

b = Board.new
p '-----'
b.print_board
p b[[0,7]].moves
# p pawn_move
# b.move_piece([0,7], rook_move)
# p '-----'
# b.print_board