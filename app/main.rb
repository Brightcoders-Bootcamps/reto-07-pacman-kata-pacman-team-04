# frozen_string_literal: false

require 'timeout'
require_relative "game.rb"

game = Game.new

capture = Thread.new { game.pacman.capture_direction }
board = Thread.new { game.start_game }

gets.chomp

Thread.kill(capture)
Thread.kill(board)