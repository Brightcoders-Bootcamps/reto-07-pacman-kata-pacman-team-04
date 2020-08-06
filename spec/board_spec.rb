# frozen_string_literal: true

require_relative "../app/board"
require_relative "../app/functions"

describe Board do
	describe "#Check the board initialize" do
		it "initializes the board" do
      $board = Board.new
		end
	end

  describe "#Check the board" do
    it "Checks the first element of the board" do
      expect($board.flag_board.first().first()).to eq(0)
    end
  end
end
