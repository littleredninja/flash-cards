helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find session[:user_id]
    end
  end

  def next_card(deck_id)
    deck = Deck.find(deck_id)
    possible_answers = deck.cards.where(answered: false)
    possible_answers.sample
  end

  def calculate_correct_percentage
    correct = Guess.where(round_id: session[:round_id], correct: true)
    all_answers = Guess.where(round_id: session[:round_id])
    p "Guess length"
    p Guess.all.length
    percentage = (correct.length.to_f)/(all_answers.length.to_f)
    answer = (percentage * 100).to_i # or .round(2), can't decide
    "#{answer}% correct"
  end

  def refresh_cards(array)
    array.each do |card|
      card.update(answered: false)
    end
  end

end
