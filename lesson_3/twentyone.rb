FACE_CARDS = ['Jack', 'Queen', 'King']
PARTITION = "---------------------------------------------------------"
BUST = 21
DEALER_MIN = 17

def initialize_deck
  deck = []
  card_values = [(2..10).to_a, FACE_CARDS, 'Ace'].flatten
  ['Hearts', 'Diamonds', 'Spades', 'Clubs'].each do |suit|
    card_values.each do |value|
      deck << if value.to_i == 0
                [suit, value]
              else
                [suit, value.to_s]
              end
    end
  end
  deck.shuffle
end

def prompt(msg)
  puts "=> #{msg}"
end

def joinand(arr, delimiter=', ', word='and')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[0..-2].join(delimiter) + ", #{word} #{arr.last}"
  end
end

def deal!(player_hand, dealer_hand, deck)
  2.times do |_|
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
end

def hit!(deck, hand)
  hand << deck.pop
end

def player_turn(player_hand, dealer_hand, deck)
  player_total = total(player_hand)
  display_hands(player_hand, player_total, dealer_hand)
  loop do
    prompt "Would you like to hit or stay?"
    choice = gets.chomp.downcase
    if choice.start_with?('h')
      hit!(deck, player_hand)
      player_total = total(player_hand)
      prompt "You drew a #{player_hand[-1][1]} of #{player_hand[-1][0]} " \
             "for a total of #{player_total}."
    end
    break if choice.start_with?('s') || busted?(player_total)
  end
  prompt "Bust! Dealer wins" if busted?(player_total)
end

def dealer_turn(dealer_hand, deck)
  dealer_total = total(dealer_hand)
  loop do
    break if dealer_total > DEALER_MIN || busted?(dealer_total)
    hit!(deck, dealer_hand)
    dealer_total = total(dealer_hand)
    prompt "Dealer drew a #{dealer_hand.last[1]} of #{dealer_hand.last[0]}."
  end
  if busted?(dealer_total)
    prompt "Dealer busts. You win!"
  else
    prompt "Dealer stays."
  end
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

def busted?(total)
  total > BUST
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

def display_hands(player_hand, player_total, dealer_hand)
  prompt "Dealer has: #{dealer_hand[0][1]} " \
         "of #{dealer_hand[0][0]} and 1 unknown card"
  prompt "Player has: #{joinand(format_hand(player_hand))} " \
         "for a total of #{player_total}"
end

def format_hand(hand)
  hand.map do |card|
    "#{card[1]} of #{card[0]}"
  end
end

def display_totals(player_hand, dealer_hand)
  player_values = hand_values(player_hand)
  prompt "Player had #{joinand(format_hand(player_hand))} " \
         "for a total of #{total(player_hand)}"
  dealer_values = hand_values(dealer_hand)
  prompt "Dealer had #{joinand(format_hand(dealer_hand))} " \
         "for a total of #{total(dealer_hand)}"
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
    display_wins(player_wins, dealer_wins)
    prompt PARTITION

    if player_wins == 5
      prompt "Game over! Player wins."
      break
    elsif dealer_wins == 5
      prompt "Game over! Dealer wins."
      break
    end
    
    deck = initialize_deck
    player_hand = []
    dealer_hand = []

    deal!(player_hand, dealer_hand, deck)

    player_turn(player_hand, dealer_hand, deck)
    player_total = total(player_hand)
    dealer_total = total(dealer_hand)
    if busted?(player_total)
      dealer_wins += 1
      display_totals(player_hand, dealer_hand)
      prompt PARTITION
      next
    else
      dealer_turn(dealer_hand, deck)
      dealer_total = total(dealer_hand)
      if busted?(dealer_total)
        player_wins += 1
        display_totals(player_hand, dealer_hand)
        prompt PARTITION
        next
      end
    end

    case
    when player_total > dealer_total
      player_wins += 1
      prompt "Player wins!"
      display_totals(player_hand, dealer_hand)
      prompt PARTITION
    when player_total < dealer_total
      dealer_wins += 1
      prompt "Dealer wins!"
      display_totals(player_hand, dealer_hand)
      prompt PARTITION
    else
      prompt "It's a tie!"
      display_totals(player_hand, dealer_hand)
      prompt PARTITION
    end
  end
  break unless play_again?
end
