FACE_CARDS = ['Jack', 'Queen', 'King']
PARTITION = "---------------------------------------------------------"
BUST = 21
DEALER_MIN = 17

# rubocop:disable Layout/LineLength
def initialize_deck
  [
    ['Hearts', 'Ace'], ['Hearts', '2'], ['Hearts', '3'], ['Hearts', '4'], ['Hearts', '5'], ['Hearts', '6'], ['Hearts', '7'], ['Hearts', '8'], ['Hearts', '9'], ['Hearts', '10'], ['Hearts', 'Jack'], ['Hearts', 'Queen'], ['Hearts', 'King'],
    ['Diamonds', 'Ace'], ['Diamonds', '2'], ['Diamonds', '3'], ['Diamonds', '4'], ['Diamonds', '5'], ['Diamonds', '6'], ['Diamonds', '7'], ['Diamonds', '8'], ['Diamonds', '9'], ['Diamonds', '10'], ['Diamonds', 'Jack'], ['Diamonds', 'Queen'], ['Diamonds', 'King'],
    ['Spades', 'Ace'], ['Spades', '2'], ['Spades', '3'], ['Spades', '4'], ['Spades', '5'], ['Spades', '6'], ['Spades', '7'], ['Spades', '8'], ['Spades', '9'], ['Spades', '10'], ['Spades', 'Jack'], ['Spades', 'Queen'], ['Spades', 'King'],
    ['Clubs', 'Ace'], ['Clubs', '2'], ['Clubs', '3'], ['Clubs', '4'], ['Clubs', '5'], ['Clubs', '6'], ['Clubs', '7'], ['Clubs', '8'], ['Clubs', '9'], ['Clubs', '10'], ['Clubs', 'Jack'], ['Clubs', 'Queen'], ['Clubs', 'King']
  ]
end
# rubocop:enable Layout/LineLength

def prompt(msg)
  puts "=> #{msg}"
end

def joinand(arr, delimiter=', ', word='and')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def deal!(player_hand, dealer_hand, deck)
  2.times do |_|
    player_hand << deck.sample
    deck.delete_if { |card| player_hand.include?(card) }
    dealer_hand << deck.sample
    deck.delete_if { |card| dealer_hand.include?(card) }
  end
end

def player_turn(player_hand, dealer_hand, deck)
  display_hands(player_hand, dealer_hand)
  loop do
    prompt "Would you like to hit or stay?"
    choice = gets.chomp.downcase
    if choice.start_with?('h')
      hit!(deck, player_hand)
      prompt "You drew a #{player_hand[-1][1]} for a total of #{total(player_hand)}."
    end
    break if choice.start_with?('s') || busted?(player_hand)
  end
  prompt "Bust! Dealer wins" if busted?(player_hand)
end

def dealer_turn(dealer_hand, deck)
  loop do
    break if total(dealer_hand) > DEALER_MIN || busted?(dealer_hand)
    hit!(deck, dealer_hand)
  end
  if busted?(dealer_hand)
    prompt "Dealer busts. You win!"
  else
    prompt "Dealer stays."
  end
  prompt PARTITION
end

def total(hand)
  total = 0
  cards = hand_values(hand)

  cards.each do |card|
    if card.to_i != 0
      total += card.to_i
    elsif FACE_CARDS.include?(card)
      total += 10
    end
  end

  if cards.include?('Ace')
    cards.select { |card| card == 'Ace' }.each do |_|
      total += calculate_ace(total)
    end
  end
  total
end

def calculate_ace(current_total)
  if current_total <= BUST && (current_total + 11) <= BUST
    11
  else
    1
  end
end

def hand_values(hand)
  hand.map { |card| card[1] }
end

def hit!(deck, hand)
  card = deck.sample
  deck.delete(card)
  hand << card
end

def busted?(hand)
  total(hand) > BUST
end

def detect_winner(player_hand, dealer_hand)
  if total(player_hand) == total(dealer_hand)
    nil
  elsif total(player_hand) > total(dealer_hand)
    "Player"
  else
    "Dealer"
  end
end

def winner?(player_hand, dealer_hand)
  !!detect_winner(player_hand, dealer_hand)
end

def play_again?
  prompt "Would you like to play again? (Y/N)"
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

def display_hands(player_hand, dealer_hand)
  prompt "Dealer has: #{dealer_hand[0][1]} and 1 unknown card"
  player_values = hand_values(player_hand)
  player_total = total(player_hand)
  prompt "Player has: #{joinand(player_values)} for a total of #{player_total}"
end

def display_totals(player_hand, dealer_hand)
  prompt "Player total: #{total(player_hand)}"
  prompt "Dealer total: #{total(dealer_hand)}"
end

def display_wins(player_wins, dealer_wins)
  prompt "Player wins: #{player_wins}"
  prompt "Dealer wins: #{dealer_wins}"
end

# main game loop
loop do
  player_wins = 0
  dealer_wins = 0
  loop do
    deck = initialize_deck
    player_hand = []
    dealer_hand = []

    deal!(player_hand, dealer_hand, deck)

    player_turn(player_hand, dealer_hand, deck)
    dealer_wins += 1 if busted?(player_hand)
    prompt PARTITION
    dealer_turn(player_hand, dealer_hand, deck) if !busted?(player_hand)
    player_wins += 1 if busted?(dealer_hand)
    display_totals(player_hand, dealer_hand)
    prompt PARTITION
    if !busted?(player_hand) && !busted?(dealer_hand)
      if winner?(player_hand, dealer_hand)
        prompt "#{detect_winner(player_hand, dealer_hand)} wins!"
        prompt PARTITION
        if detect_winner(player_hand, dealer_hand) == 'Player'
          player_wins += 1
        else
          dealer_wins += 1
        end
      else
        prompt "It's a tie!"
        prompt PARTITION
      end
    end
    display_wins(player_wins, dealer_wins)
    prompt PARTITION

    if player_wins == 5
      break prompt "Game over! Player wins."
    elsif dealer_wins == 5
      break prompt "Game over! Dealer wins."
    end
  end
  break unless play_again?
end
