# frozen_string_literal: true

require_relative 'game_character'

class Pacman < GameCharacter
  def initialize(args, posibilities)
    super(args, posibilities)
    @direction = 1
    @position = { x: 7, y: 32 }
    @character = '<'
    @characters = ['∨', '∧', '<', '>']
  end

  def calculate_movement
    elem = @direction - 1
    @position, @character = check_element(@characters[elem], @posibilities[elem])
  end

  def capture_direction
    capture_value = STDIN.getch
    @direction = find_numeric(capture_value, @direction)
    (capture_value == "\r") || (capture_value == "\n") ? nil : capture_direction
  end

  private

  def check_element(charac, sum)
    ren, col, caracter = @position[:x] + sum[:x], @position[:y] + sum[:y]
    character = charac == @character ? '-' : charac
    [board.can_move?(ren, col, 1) ? { x: ren, y: col } : @position, character]
  end
end
