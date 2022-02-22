require_relative 'inheritance.rb'
class Board 
  BOARD_SIZE = 8
  
  attr_accessor :rows
  
  def fill_board 
    pawn_rows = [1, self.rows.length-2]
    knight_pos = [[0,1], [7,1], [0,6], [7,6]]
    king_pos = [[0,3], [7,3]]
    queen_pos = [[0,4], [7,4]]
    bishop_pos = [[0,2],[7,2],[0,5], [7,5]]
    rook_pos = [[0,0], [7,0], [0,7], [7,7]]
    null_piece_pos = (2...self.rows.length-2).to_a

    pawn_rows.each do |row|
      (0...rows[row].length).each { |col| rows[row][col] = Pawn.new(:white, self, [row,col]) }
    end

    knight_pos.each do |pos|
      self[pos] = Knight.new(:white, self, pos)
    end

    king_pos.each do |pos|
      self[pos] = King.new(:white, self, pos)
    end

    queen_pos.each do |pos|
      self[pos] = Queen.new(:white, self, pos)
    end

    bishop_pos.each do |pos|
      self[pos] = Bishop.new(:white, self, pos)
    end

    rook_pos.each do |pos|
      self[pos] = Rook.new(:white, self, pos)
    end

    null_piece_pos.each do |row|
      (0...rows[row].length).each { |col| rows[row][col] = NullPiece.instance }
    end

    [0,1].each do |row|
      (0...rows[row].length).each { |col| rows[row][col].color = :black }
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

  def length 
    BOARD_SIZE
  end

  def move_piece(start_pos, end_pos)
    raise "Invalid Start Position" if self[start_pos].is_a?(NullPiece)

    if !self[end_pos].is_a?(NullPiece) && self[end_pos].color == self[start_pos].color
      raise "Invalid End Position" 
    elsif !self[end_pos].is_a?(NullPiece)
      moved = self[start_pos]
      self[end_pos] = moved
      self[start_pos] = NullPiece.instance
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
pawn_move = b[[1,0]].moves[0]
p pawn_move
b.move_piece([1,0], pawn_move)
b.print_board