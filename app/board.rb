# frozen_string_literal: true

class Board
  attr :board, :flag_board

  def initialize
    @board = Array.new() 
    @flag_board = Array.new()
    stream = File.open(File.expand_path("../../", __FILE__) + '/board/board1.txt')
    @board = stream.map{ |element| element.split(//) }
    @flag_board = @board.map { |element| element.map{ |element| find_numeric(element, 0) }}
  end

  def can_move?(row, col, condition)
    return (@flag_board[row][col] > condition) ? true : false 
  end

  def calculate_points(pacman)
    return 1 if check_can_move(pacman[:x], pacman[:y]) == 1
    return 0
  end

  def check_can_move(row, col)
    if can_move?(row, col, 2)
      @board[row][col] = " "
      @flag_board[row][col] = 2
      return 1
    end
  end
end
