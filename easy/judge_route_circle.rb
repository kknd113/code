# Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
# 
# The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.
# 
# Example 1:
# Input: "UD"
# Output: true
# Example 2:
# Input: "LL"
# Output: false

# @param {String} moves
# @return {Boolean}
def judge_circle_naive(moves)
  initial_pos, pos = [0,0], [0,0]
  
  moves.split('').each do |move|
    case move
    when 'U'
      pos[1] += 1
    when 'D'
      pos[1] -= 1
    when 'L'
      pos[0] -= 1
    when 'R'
      pos[0] += 1
    else
      puts 'do not understand'
    end
  end
  return initial_pos == pos
end

def judge_circle(moves)
  return (moves.count('U') == moves.count('D')) && (moves.count('L') == moves.count('R'))
end