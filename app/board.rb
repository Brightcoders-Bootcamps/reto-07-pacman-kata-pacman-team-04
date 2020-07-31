# frozen_string_literal: true

require_relative 'prints.rb'
require_relative 'pacman.rb'
# Class that represents the game board
class Board
  def initialize
    @board_file = File.open('../board/new_tab.txt', mode: 'r+')
    @prints = Prints.new
    @array_board = IO.readlines(@board_file)
  end

  def copy_file
    file_name = File.open('../board/board1.txt').read
    file_name.each_line do |line|
      @prints.print_board(line)
      @board_file.puts line.to_s
    end
  end

  def eat_dots(pacman)
    pacman_position_x = pacman.position[:row].to_i
    pacman_position_y = pacman.position[:col].to_i
    # wraps_around(pacman_position_x, pacman_position_y)
    @array_board[pacman_position_x][pacman_position_y] = ' '
    pacman_new_position(pacman_position_x, pacman_position_y)
  end

  def pacman_new_position(pacman_position_x, pacman_position_y)
    @array_board[pacman_position_x + 1][pacman_position_y + 1] = 'v'
    @prints.prints_array(@array_board)
  end

  def wraps_around(pacman_position_x, pacman_position_y)
    pacman_position_y.zero? && pacman_position_x == @array_board.lenght ? posicion[otro_extremo] : ''
  end
end

board = Board.new
board.copy_file
board.eat_dots(Pacman.new)
