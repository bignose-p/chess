class Piece

attr_reader :type
attr_accessor :pos

  def initialize(type, pos, board, color)
    @type, @pos, @board, @color = type, pos, board, color 
  end


end
