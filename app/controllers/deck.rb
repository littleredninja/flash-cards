get '/deck/start' do
	erb :"deck/start"
end

get '/decks/:id' do
  redirect to ('/') unless current_user
  @deck = Deck.find(params[:id])
  @card = @deck.cards.first
  unless @round
    @round = Round.create(user_id: session[:user_id], deck: @deck )
  end
  session[:round_id] = @round.id
  erb :'deck/guess'
end


post '/decks/:id' do
  redirect to ('/') unless current_user
  current_round = Round.find(session[:round_id])
  deck = Deck.find(params[:id])
  user_guess = params[:user_guess]
  card = Card.find(params[:card_id])

  guess = Guess.create(round: current_round, card: @card)

  guess.correct = true if @user_guess == @card.answer
  if guess.correct
    @message = "Correct"
    next_card = card.id + 1
    @card = Card.find_by(card_id: next_card, deck: deck)
  else
    @message = "Incorrect"
  end
  erb :"decks/:guess"



  # if guess.correct

end