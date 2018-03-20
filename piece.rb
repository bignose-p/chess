class Piece

attr_reader :type
attr_accessor :pos

  def initialize(type, pos, board)
    @type, @pos, @board = type, pos, board
  end


end
