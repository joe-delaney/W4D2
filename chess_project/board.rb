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
      self[end_pos].pos = end_pos
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
    rows_to_s = []
    @rows.each do |row|
        new_row = []
      row.each do |i|
        new_row << i.to_s
      end
      rows_to_s << new_row 
    end
    rows_to_s.each do |ele|
      p ele.join(' ')
     end
  end
 end

b = Board.new
p '-----'
b.print_board



