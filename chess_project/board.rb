require_relative 'pieces.rb'
class Board 
  BOARD_SIZE = 8
  
  attr_accessor :rows

  #initialize an 8x8 board and set each space to a null piece
  #call helper method fill board to place pieces
  def initialize
    @rows = Array.new(BOARD_SIZE){Array.new(BOARD_SIZE, NullPiece.instance)}
    fill_board
  end

  #called when board is initialized to place pieces
  def fill_board 
    #for each color, fill the pawn row and the back row using helper methods
    [:white, :black].each do |color|
      fill_back_rows(color)
      fill_pawn_rows(color)
    end
  end

  #helper method to fill the pawn rows for both colors
  def fill_pawn_rows(color)
    #if color is white, we should fill pawns at row 6 otherwise at row 1
    color == :white ? i = 6 : i = 1
    (0...BOARD_SIZE).each do |j|
      Pawn.new(color, self, [i,j])
    end
  end

  #helper method to fill the back rows for both colors
  def fill_back_rows(color)
    #We can use this to place pieces in this order in the back row
    pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    #if color is white, we should fill back row 7 otherwise back row 0
    color == :white ? i = 7 : i = 0
    pieces.each_with_index do |piece, j|
      piece.new(color, self, [i,j])
    end
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

  #Takes in a start pos and end pos and moves piece if valid
  def move_piece(start_pos, end_pos)
    #raise error if start is null because we can't move from an empty spot
    raise "Invalid Start Position" if self[start_pos].is_a?(NullPiece)

    #raise error if end pos is not empty and its filled by the same color piece
    #it is a valid attack if it is filled by an opposite color piece
    if !self[end_pos].is_a?(NullPiece) && self[end_pos].color == self[start_pos].color
      raise "Invalid End Position" 
    else
      #Save the current piece at the start pos
      moved = self[start_pos]

      #move the current piece to end pos and update the piece's position variable
      self[end_pos] = moved
      self[end_pos].pos = end_pos

      #Empty the start pos
      self[start_pos] = NullPiece.instance
    end
  end

  #This is called when a new piece is made to place itself on the board
  def add_piece(piece, pos)
    self[pos] = piece
  end

  #prints the board in a readable fashion
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

p b[[1,4]].moves



