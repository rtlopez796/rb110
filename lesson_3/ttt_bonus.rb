# my solutions to bonus features

# improved `join`
def joinor(arr, punctuation=', ', conjunction='or')
  case arr.length
  when 0 then ''
  when 1 then arr.to_s
  when 2 then arr.join(" #{conjunction} ")
  else
    arr1 = arr[0..-2]
    arr1.join(punctuation) + "#{punctuation}#{conjunction} #{arr[-1]}"
  end
end

# computer ai: defense
def computer_turn(brd)
  if immediate_threat?(brd)
    square = defense(brd)
    prompt "IMMEDIATE THREAT"
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def immediate_threat?(brd)
  !!defense(brd)
end

def defense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 #[" ", "X", "X"]
      empty_square = brd.values_at(*line).index(" ")
      if empty_square
        return line[empty_square]
      end
    end
  end
  nil
end

# computer ai: offense, offense first
def computer_turn(brd)
  if potential_win?(brd, COMPUTER_MARKER)
    square = offense_defense(brd, COMPUTER_MARKER)
  elsif immediate_threat?(brd, PLAYER_MARKER)
    square = offense_defense(brd, PLAYER_MARKER)
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def potential_win?(brd, marker)
  !!offense_defense(brd, COMPUTER_MARKER)
end

def immediate_threat?(brd, marker)
  !!offense_defense(brd, PLAYER_MARKER)
end

def offense_defense(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 
      empty_square = brd.values_at(*line).index(" ")
      if empty_square
        return line[empty_square]
      end
    end
  end
  nil
end
