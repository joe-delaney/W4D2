require_relative 'piece.rb'
class Board 
  BOARD_SIZE = 8
  
  attr_accessor :rows
  

  def fill_board 
    row_to_fill = [0,1, self.rows.length-2, self.rows.length-1]
    row_to_fill.each do |row|
      (0...rows[row].length).each { |col| rows[row][col] = Piece.new }
    end
  end

  def initialize
    @rows = Array.new(BOARD_SIZE){Array.new(BOARD_SIZE)}
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

  def move_piece(start_pos, end_pos)
    raise "Invalid Start Position" if self[start_pos].nil? 
    raise "Invalid End Position" if !self[end_pos].nil?
    moved = self[start_pos]
    self[end_pos] = moved
    self[start_pos] = nil 
  end

  def print_bord 
    narr = []
    @rows.each do |w|
        x = []
      w.each do |i|
        if i == nil 
          x << 'o'
        else
          x << i.i_i
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

# b.print_bord
# b.move_piece([1,1],[3,3])
# p '-----'

b.print_bord
# p '-----'

b.move_piece([1,1], [0,0])
# b.move_piece
# p '-----'

b.print_bord