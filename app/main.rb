# frozen_string_literal: true

require_relative 'game.rb'

# Class that represents the main class
class Main
  def initialize
    @board_file = File.open('../board/new_tab.txt', mode: 'w')
    @game = Game.new(@board_file)
  end

  def start_threads
    @ghosts = Thread.new { game.produce_ghost }
    @capture = Thread.new { game.capture_direction }
    @board = Thread.new { game.game }
  end
end

Main.new
print @game
