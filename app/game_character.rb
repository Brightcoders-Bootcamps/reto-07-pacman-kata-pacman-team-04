# frozen_string_literal: true

# Parent class of game characters (Pacman & Ghosts)
class GameCharacter
  attr_accessor :direction, :speed, :position

  def initialize
    @direction = 0
    @speed = 1
    @position = Array.new(2) { 0 }
  end

  def calculate_position; end
end
