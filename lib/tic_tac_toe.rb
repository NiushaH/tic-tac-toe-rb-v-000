require "pry"

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  user_input = user_input.to_i
  user_input + -1
end


def turn_count(board)
  turn_count = 9 - board.count(" ")
end


def current_player(board)
  turn_count = 9 - board.count(" ")
     turn_count.even? == true ? current_player = "X" : current_player = "O"
end


def move(board, index, token)
  board[index] = token
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end


def turn(board)
  puts "Please enter 1-9:"

  user_input = gets.chomp
  puts "Your move is to space #{user_input}."

  position = input_to_index(user_input)

  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
    puts 'Great move!  Now sit tight while the other player makes their move.'

  else
    turn(board)
  end
end


def won?(board)
  WIN_COMBINATIONS.detect do |winning_array|

    win_index_1 = winning_array[0]
    win_index_2 = winning_array[1]
    win_index_3 = winning_array[2]
  
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
  position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
  end
end 


def full?(board)
  board.include?("X" && "O") == true
  board.include?(" ") == false
end


def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  draw?(board) || won?(board)
end


def winner(board)
  if won?(board)
  board[won?(board)[0]]
  end
end


def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
   puts "Cat's Game!"
  else 
   puts "Game over."
  end
end



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 

# # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
# def position_taken?(board, index)
#   if board[index] == " " || board[index] == ""
#     return false
#   elsif board[index] == nil
#     return false
#   else board[index] == "X" || board[index] == "O"
#     return true
#   end
# end


# def input_to_index(user_input)
#   user_input.to_i - 1
# end

# def move(board, index, current_player = "X")
#   board[index] = current_player
# end

# def position_taken?(board, location)
#   board[location] != " " && board[location] != ""
# end

# def valid_move?(board, index)
#   index.between?(0,8) && !position_taken?(board, index)
# end


# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     move(board, index)
#     display_board(board)
#   else
#     turn(board)
#   end
# end


# # code your #position_taken? method here!
# def position_taken?(board, index)
#   if board[index] == " " || board[index] == ""
#     return false
#   elsif board[index] == nil
#     return false
#   else board[index] == "X" || board[index] == "Y"
#     return true
#   end
# end


# # code your #valid_move? method here
# def valid_move?(board, index)

#   #position is present on game board
#   !position_taken?(board, index) && index.between?(0,8)

#   #ternary operator not needed because above line is either true or false
#       #this is what I initially thought
#       #comment: position already filled with a token
#       # code: else position_taken == true
      
#       #comment: valid_move is false
#       #code: return !valid_move?
# end
  
