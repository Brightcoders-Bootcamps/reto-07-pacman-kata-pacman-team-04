# frozen_string_literal: true

def find_numeric(element, default)
  walls = ['║', '╗', '╚', '╝', '╔', '═', '╩', '╦']
  options = [walls, ['w'], [' ', 's'], ['·', 'd'], ['●', 'a'], [default]]
  value = 0
  options.each_with_index { |elem, index| value = index if elem.include?(element) }
  value
end

def show_board(pacman, board)
  system('clear')
  board.each_with_index do |row, index_i|
    show_rows(row, index_i)
    print "\r"
  end
end

def show_rows(row, index_i)
  row.each_with_index do |cols, index_j|
    cols = pacman.show_board_character(cols, [index_i, index_j])
    print cols
  end
end
