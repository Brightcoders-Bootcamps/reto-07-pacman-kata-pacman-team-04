# frozen_string_literal: true

require_relative 'file_opener.rb'

class Board
  attr_accessor :board, :board_numeric

  def initialize(file)
    @board = Array.new() 
    @board_numeric = Array.new()
    stream = File.open(File.expand_path("../../", __FILE__) + file)
    open_file(stream.to_a, @board, @board_numeric)
  end

  def print_b(pacman)
    system("clear")
    @board.each_with_index do |row, index_i|
      row.each_with_index do |col, index_j|
        col = helper_print_b_character(pacman, col, [index_i, index_j])
        print col
      end
      print "\n\r"
    end
  end

  def can_move?(row, col, condition)
    return (@board_numeric[row][col] > condition) ? true : false 
  end

  def calculate_points(pacman)
    pac_x, pac_y = pacman[:x], pacman[:y]
    if can_move?(pac_x, pac_y, 2)
      @board[pac_x][pac_y] = " "
      @board_numeric[pac_x][pac_y] = 2
      return 1
    end
    return 0
  end

end
