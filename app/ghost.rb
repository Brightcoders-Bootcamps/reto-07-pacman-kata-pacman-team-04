# frozen_string_literal: true
require_relative "searcher.rb"

class Ghost
  
  attr_reader :board, :character, :position, :direction, :path

  def initialize(args)
    @board = args.clone
    @position = {:x => 12, :y => 4}
    @character = 'N'
    @path = Array.new
  end

  def calculate_movement(pacman_position)
    unless @path.delete_at(0)
      @path = exaustive_search(pacman_position, @position, @board)
    else
      @position = @path[0]
    end
  end

end
