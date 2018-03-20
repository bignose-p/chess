require 'colorize'
require_relative 'cursor'
require_relative 'board'

#WHEN COMPlETE, REMOVE BOARD REQUIREMENT AND DO IT METHOD 

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render_grid
    board.rows.map.with_index do |row, i|
      render_row(row, i)
    end
  end

  def render_row(row, i)
    row.map.with_index do |square, j|
      color = colors(i, j)
      square.to_s.colorize(color)
    end
  end


  def colors(i, j)
    if cursor.cursor_pos == [i, j] && cursor.selected
      color = :magenta
    elsif cursor.cursor_pos == [i, j]
      color = :cyan
    elsif (i + j).even?
      color = :light_yellow
    else
      color = :light_green
    end
    {background: color}
  end

  def render
    system("clear")
    puts "make a move"
    render_grid.each {|row| puts row.join}
  end

def do_it
  x = 1
  while x == 1
  render
  cursor.get_input
end
end

end
