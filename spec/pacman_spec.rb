# frozen_string_literal: true

require_relative "../app/pacman"

describe Pacman do
  describe "#Pacman initialize" do
    it "Checks Pacman initialize" do
      pacman = Pacman.new('a','b')
    end
  end
end
