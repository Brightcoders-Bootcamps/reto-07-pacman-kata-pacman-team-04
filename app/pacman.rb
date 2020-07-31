# frozen_string_literal: true

require_relative 'game_character'

# Subclass that represents the Pacman Character
class Pacman < GameCharacter
  def initialize
    super()
    @position[:row] = 7
    @position[:col] = 32
    @direction = 1
    @character = '<'
  end

  def calculate_position; end

  def calculate_movement; end
end
