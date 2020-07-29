# frozen_string_literal: true

# Class that represents the game board
class Board
  def initialize; end

  def read_file
    nom_archivo = File.open('../board/board1.txt').read
    nom_archivo.each_line do |line|
      puts " #{line}"
    end
  end
end

board = Board.new
board.read_file
