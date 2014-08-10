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

end
