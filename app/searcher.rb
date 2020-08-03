# frozen_string_literal: true

def exaustive_search(goal, position, board)
  posibilities = Array.new
  movements = [position.clone]
  flag = false
  loop do
    analize(movements, posibilities, board, flag)
    posibility = posibilities.pop
    flag = movements.include?(posibility)
    posibilities.delete(posibility)
    (movements << posibility.clone)
    break if (posibilities.size < 2) ||  (posibility == goal) || (movements.size > 100)
  end
  return movements
end
  
def analize(movements, posibilities, board, flag)
  unless flag
    ren, col = movements.last[:x], movements.last[:y]
    posibilities << check_movement(ren - 1, col, board)
    posibilities << check_movement(ren + 1, col, board)
    posibilities << check_movement(ren, col + 1, board)
    posibilities << check_movement(ren, col - 1, board)
    posibilities.delete(nil)
  end
end
  
def check_movement(ren, col, board)
  return (board.can_move?(ren, col, 0)) ? { :x => ren, :y => col } : nil
end
