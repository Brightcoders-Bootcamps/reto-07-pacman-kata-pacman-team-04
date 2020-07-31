# frozen_string_literal: true

# Class that print
class Prints
  def print_board(line)
    puts line.to_s
  end

  def prints_array(array_board)
    (0...14).each do |indice_x|
      (0..61).each do |indice_y|
        print array_board[indice_x][indice_y]
      end
    end
  end
end
