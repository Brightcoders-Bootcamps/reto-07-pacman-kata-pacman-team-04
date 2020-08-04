# # frozen_string_literal: true

# require_relative 'prints.rb'
# require_relative 'pacman.rb'
# # Class that represents the game board
# class Board
#   def initialize
#     @board_file = File.open('../board/new_tab.txt', mode: 'r+')
#     @prints = Prints.new
#     @array_board = IO.readlines(@board_file)
#   end

#   def board_level
#     if level == 1 
#       file_name = File.open('../board/board1.txt').read
#     end
#     if level == 2
#       file_name = File.open('../board/board2.txt').read
#     end
#     if level == 3
#       file_name = File.open('../board/board3.txt').read
#     end
#     file_name
#   end

#   def copy_file
#     file_name = File.open('../board/board1.txt').read
#     file_name.each_line do |line|
#       @prints.print_board(line)
#       @board_file.puts line.to_s
#     end
#   end

#   def eat_dots(pacman)
#     @pacman_position_x = pacman.position[:row].to_i
#     @pacman_position_y = pacman.position[:col].to_i
#     # wraps_around
#     @array_board[@pacman_position_x][@pacman_position_y] = ' '
#     pacman_new_position
#     move_ghost
#   end

#   def pacman_new_position
#     @array_board[@pacman_position_x][@pacman_position_y - 1] = 'v' #w
#     @array_board[@pacman_position_x + 1][@pacman_position_y] = '<' #d
#     @array_board[@pacman_position_x - 1][@pacman_position_y] = '>' #a
#     @array_board[@pacman_position_x][@pacman_position_y + 1] = '^' #s
#     @prints.prints_array(@array_board)
#   end

#   def wraps_around   
#     @pacman_position_x.zero ? @pacman_position_x = @array_board.lenght : ""
#     @pacman_position_x == @array_board.lenght ? @pacman_position_x = 0 : ""
#     @pacman_position_y.zero ? @pacman_position_y = @array_board.lenght : ""
#     @pacman_position_y == @array_board.lenght ? @pacman_position_y= 0 : ""
#   end

#   def move_ghost
#     num_random = rand(1..4)
#     ghost_position_x = rand(1..50)
#     ghost_position_y = rand(1..15)
#     if num_random == 1
#       @array_board[ghost_position_x][ghost_position_y - 1] = 'N' #w
#     end
#     if num_random == 2
#       @array_board[ghost_position_x][ghost_position_y + 1] = 'N' #s
#     end
#     if num_random == 3
#       @array_board[ghost_position_x + 1][ghost_position_y] = 'N' #d
#     end
#     if num_random == 4
#       @array_board[ghost_position_x - 1][ghost_position_y] = 'N' #a
#     end
#     @prints.prints_array(@array_board)
#   end 

#   #def is_wall
#    # if @array_board[@pacman_position_x][@pacman_position_y] == '║' || @array_board[@pacman_position_x][@pacman_position_y] == '╗' || @array_board[@pacman_position_x][@pacman_position_y] == '╚' || @array_board[@pacman_position_x][@pacman_position_y] == '╝' || @array_board[@pacman_position_x][@pacman_position_y] == '╔' || @array_board[@pacman_position_x][@pacman_position_y] == '═' |°|    @array_board[@pacman_position_x][@pacman_position_y] == '╩' || @array_board[@pacman_position_x][@pacman_position_y] == '╦' 
#     #  print " wall"
#     #end
#   #end

# end

# board = Board.new
# board.copy_file
# board.eat_dots(Pacman.new)

# frozen_string_literal: true

require_relative 'file_opener.rb'

class Board
  attr :board, :board_numeric

  def initialize(file)
    @board = Array.new() 
    @board_numeric = Array.new()
    stream = File.open(File.expand_path("../../", __FILE__) + file)
    open_file(stream.to_a, @board, @board_numeric)
  end

  def print_b(ghosts, pacman)
    system("clear")
    @board.each_with_index do |row, index_i|
      row.each_with_index do |col, index_j|
        ghosts.map{ |ghost| col = helper_print_b_character(ghost, col, [index_i, index_j]) }
        col = helper_print_b_character(pacman, col, [index_i, index_j])
        print col
      end
      print "\n\r"
    end
  end

  def can_move?(row, col, condition)
    return (@board_numeric[row][col] > condition) ? true : false 
  end

  def calculate_points(pacman)
    pac_x, pac_y = pacman[:x], pacman[:y]
    if can_move?(pac_x, pac_y, 2)
      @board[pac_x][pac_y] = " "
      @board_numeric[pac_x][pac_y] = 2
      return 1
    end
    return 0
  end

end
