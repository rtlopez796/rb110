INITIAL_MARKER = " "
PLAYER_MARKER = "X"
PLAYER = 'Player'
COMPUTER_MARKER = "O"
COMPUTER = 'Computer'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_turn(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry, that's an invalid choice."
    end
  end
  brd[square] = PLAYER_MARKER
end

def computer_turn(brd)
  square = nil

  # defense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # offense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square && brd[5] == ' '
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      return PLAYER
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return COMPUTER
    end
  end
  nil
end

def place_piece(brd, player)
  if player == PLAYER
    player_turn(brd)
  else
    computer_turn(brd)
  end
end

def alternate_player(player)
  if player == PLAYER
    COMPUTER
  else
    PLAYER
  end
end

loop do
  player_score = 0
  computer_score = 0

  loop do
    board = initialize_board

    # # Ask user who goes first
    # prompt "Who should go first? (Player/Computer)"
    # first_player = gets.chomp.downcase
    # if first_player[0] = 'p'
    #   current_player = PLAYER
    # else
    #   current_player = COMPUTER
    # end
    
    # Computer randomly selects first player
    current_player = [COMPUTER, PLAYER].sample

    prompt "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."

    loop do
      display_board(board) if current_player == PLAYER
      place_piece(board, current_player)
      current_player = alternate_player(current_player)
      break if winner?(board) || board_full?(board)
    end

    display_board(board)

    if winner?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == PLAYER
        player_score += 1
      else
        computer_score += 1
      end
    else
      prompt "It's a tie!"
    end

    if player_score == 5
      break prompt "You won the tournament!"
    elsif computer_score == 5
      break prompt "Computer won the tournament!"
    end
  end
  prompt "Play again? (Y/N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
