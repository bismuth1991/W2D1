require_relative 'piece.rb'
require 'byebug'

class InvalidStartPos < StandardError
end
class InvalidEndPos < StandardError
end

NULL = NullPiece.new

class Board
  attr_reader :grid


  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
  end

  def populate_board
    # debugger
    (@grid[0..1] + @grid[6..7]).each do |row|
      (0...row.length).each do |i|
        row[i] = Piece.new
      end
    end

    (@grid[2..5]).each do |row|
      (0...row.length).each do |i|
        row[i] = NULL
      end
    end
  end


  def move_piece(start_pos,end_pos)
    raise InvalidStartPos.new if self[start_pos].is_a?(NullPiece)
    # raise InvalidEndPos.new if valid_move?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NULL

  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,piece)
    row,col = pos
    @grid[row][col] = piece
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def render
    @grid.each do |row|
      p row.map do |el|
        if el.class == NullPiece
          "N"
        else
          "P"
        end
      end
    end

  end


end
