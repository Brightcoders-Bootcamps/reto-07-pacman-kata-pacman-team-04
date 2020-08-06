# frozen_string_literal: true

require "io/console"
require_relative "pacman"
require_relative "board"
require_relative "functions"

class Game 
  attr_accessor :stage, :pacman

  def initialize
    @points, @level, @speed = 0, 1, 0.6
    @posibilites = [{:x => -1, :y => 0}, {:x => 1, :y => 0}, {:x => 0, :y => 1},{:x => 0, :y => -1}]
    @board = Board.new
    @pacman = Pacman.new(@board, @posibilites)
    game_instructions
  end

  def start_game
    loop do
      change_state
      print "\n\r\n\rLevel: #{@level}    Score: #{@points}\n\r\n\rPress enter to exit...\n\r"
      sleep(@speed)
    end
  end

  def change_state
    level_up
    @pacman.calculate_movement
    show_board(@pacman, @board.board)
    @points += @board.calculate_points(@pacman.position)
  end

  private

  def game_instructions
    puts "Press the following keys 1 or more times until Pacman moves\n\r"
    puts "W --> Up\n\rA --> Left\n\rS --> Down\n\rD --> Right"
    sleep 5
  end

  def level_up(flag = false)
    @board.flag_board.map { |element| (flag = true) if (element.include?(3) || element.include?(4)) }
    unless flag
      @board = Board.new
      return @level, @speed = @level + 1, @speed - 0.1
    end
  end
end
