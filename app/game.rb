# frozen_string_literal: true

require 'io/console'
require_relative 'board.rb'
require_relative 'pacman.rb'
require_relative 'ghost.rb'

# Class that represents the center of entire game
class Game
  def initialize
    @board = Board.new
    @pacman = Pacman.new
    @ghosts = []
  end

  def produce_ghosts
    while @ghosts.size < 3
      @ghosts << Ghost.new(@board)
      sleep(10)
    end
  end

  def capture_direction
    loop do
      aux = STDIN.getc
      @pacman.direction = case aux
                          when 'w' then 1
                          when 'a' then 2
                          when 's' then 3
                          when 'd' then 4
                          end
    end
  end
end
