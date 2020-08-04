# frozen_string_literal: true

require_relative "functions"

class Pacman

  attr_accessor :direction
  attr_reader :board, :character, :position

  def initialize(args)
    @board = args.clone
    @direction = 1
    @position = {x: 7, y: 32}
    @character = "<"
  end

  def calculate_movement
    case @direction
    when 1 then @position[:x] += check_row('∨', - 1)
    when 2 then @position[:x] += check_row('∧', + 1)
    when 3 then @position[:y] += check_col('<', + 1)
    when 4 then @position[:y] += check_col('>', - 1)
    end
  end

  def capture_direction
    capture_value = STDIN.getch
    @direction = helper_find_numeric(capture_value, @direction)
    return ((capture_value == "\r") || (capture_value == "\n")) ? nil : capture_direction
  end

  private

  def check_row(charac, val)
    row, col = @position[:x], @position[:y]
    @character = (charac == @character) ? '|' : charac
    return board.can_move?(row + val, col, 1) ? val : 0
  end

  def check_col(charac, val)
    row, col = @position[:x], @position[:y]
    @character = (charac == @character) ? '-' : charac
    return board.can_move?(row, col + val, 1) ? val : 0
  end
end
