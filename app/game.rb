# frozen_string_literal: true

require "io/console"
require_relative "pacman"
require_relative "board"
require_relative "functions"

class Game 
  attr :stage, :pacman

  def initialize
    @stages = ['/board/board1.txt', '/board/board2.txt', '/board/board3.txt']
    @current_level, @points, @velocity = 0, 0, 0.7
    @current_stage = @stages.first()
    @board = Board.new(@current_stage)
    @pacman = Pacman.new(@board)
  end

  def start_game
    game_instructions
    loop do
      level_up
      pacman, position = @pacman, @pacman.position
      pacman.calculate_movement
      @board.print_b(pacman)
      @points += @board.calculate_points(position)
      print "Level: #{@current_level + 1}\tPoints: #{@points}\n\r\n\rPress enter to exit...\n\r"
      sleep(@velocity)
    end
  end

  private

  def game_instructions
    puts "Press the following keys 1 or more times to make Pacman move\n\r"
    puts "W --> Up\n\rA --> Left\n\rS --> Down\n\rD --> Right"
    sleep 5
  end

  def level_up
    flag = false
    @board.board_numeric.map { |element| (flag = true) if (element.include?(3) || element.include?(4)) }
    unless flag
      @board = Board.new(@current_stage)
      return @level += 1, @velocity -= 0.02
    end
  end
end
