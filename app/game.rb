# frozen_string_literal: true

require "io/console"
require_relative "pacman"
require_relative "board"
require_relative "functions"

class Game 
  attr :stage, :pacman

  def initialize(arguments)
    @stage = arguments
    @board = Board.new(arguments)
    @pacman = Pacman.new(@board)
  end

  def start_game(points = 0, level = 1, velocity = 0.7)
    game_instructions
    loop do
      puts @board.board_numeric
      level, velocity = level_up(level, velocity)
      pacman, position = @pacman, @pacman.position
      pacman.calculate_movement
      @board.print_b(pacman)
      points += @board.calculate_points(position)
      print "Level: #{level}\tPoints: #{points}\n\r\n\rPress enter to exit...\n\r"
      sleep(velocity)
    end
  end

  private

  def game_instructions
    puts "Press the following keys 1 or more times to make Pacman move\n\r"
    puts "W --> Up\n\rA --> Left\n\rS --> Down\n\rD --> Right"
    sleep 5
  end

  def level_up(level, velocity)
    flag = false
    @board.board_numeric.map { |element| (flag = true) if (element.include?(3) || element.include?(4)) }
    unless flag
      @board = Board.new(@stage)
      return level + 1, velocity - 0.02
    end
    return level, velocity
  end
end
