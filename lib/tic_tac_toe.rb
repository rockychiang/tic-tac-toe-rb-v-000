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

def display_board(board = [" "," "," "," "," "," "," "," "," "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  11.times {print "-"}
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  11.times {print "-"}
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board,index,player)
  board[index] = player
end

def position_taken?(board,index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)
end

def turn(board)
  puts "Please enter a valid move between 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    board[index] = "X"
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |i|
    p = [board[i[0]], board[i[1]], board[i[2]]]
    if p.include?(" ")
      false
    else
      p.all? {|j| j == p[0]}
    end
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  w = won?(board)
  if w == nil
    nil
  else
    win = board[w[0]]
  end
end

def play(board)
  puts "Welcome to Tic Tac Toe!!!"
  board = [" "," "," "," "," "," "," "," "," "]
  until over?(board)
    turn(board)
    if won?(board)
      puts "Congratulations player #{winner} won."
    else
      puts "The game ended in a draw. No one won."
    end
  end
end
