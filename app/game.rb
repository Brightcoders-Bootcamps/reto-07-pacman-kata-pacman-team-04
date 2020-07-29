# frozen_string_literal: true
require_relative 'board.rb'
require_relative 'pacman.rb'
require_relative 'ghost.rb'

# Class that represents the center of entire game
class Game
  def initialize
    @board = Board.new
    @pacman = Pacman.new
    @ghosts = Array.new() { |Ghost.new| }
  end
end
