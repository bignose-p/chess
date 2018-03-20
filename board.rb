require_relative 'piece'

class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    populate
  end

  def [](pos)
    raise "not a valid position" unless valid_pos?(pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, piece)
    raise "not a valid position" unless valid_pos?(pos)
    x, y = pos
    @rows[x][y] = piece
  end

  def valid_pos?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

  def move_piece(start_pos, end_pos)
    raise 'not a valid move' unless self[start_pos].type == "reg" && valid_pos?(end_pos)

    piece = self[start_pos]
    self[end_pos] = piece
    piece.pos = end_pos

    self[start_pos] = Piece.new(nil, start_pos, self)

    #this method needs to be updated to check if end pos is occupied, if piece can perform move
  end

  private

  def populate
    0.upto(7) do |i1|
      0.upto(7) do |i2|
        if i1.between?(2,5)
          type = nil
        else
          type = "reg"
        end
        pos = [i1, i2]
        self[pos] = Piece.new(type, pos, self)
      end
    end
  end

end
