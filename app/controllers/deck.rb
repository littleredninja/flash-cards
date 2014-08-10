get '/deck/answer' do
  @card = Card.find(session[:card_id])
  @deck = Deck.find(session[:deck_id])
  @message = session[:message]
  erb :"/deck/answer"
end

get '/deck/question' do
  @card = next_card(session[:deck_id])
  if @card == nil
    redirect '/deck/stats'
  else
    @card.update(answered: true)
    erb :"/deck/guess"
  end
end

get '/deck/stats' do
  @correct_percentage = calculate_correct_percentage
  @user = User.find(session[:user_id])
  erb :"/deck/stats"
end

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user_id: session[:user_id], deck: @deck)
  session[:round_id] = @round.id
  session[:deck_id] = @deck.id
  @cards = Card.where(deck_id: session[:deck_id])
  refresh_cards(@cards)
  @card = next_card(params[:deck_id])
  @card.update(answered: true)
  erb :"/deck/guess"
end

post '/deck/:deck_id' do
  @card = Card.find(params[:card_id])
  @user_guess = params[:user_guess]
  if @user_guess == @card.answer
    Guess.create(round_id: session[:round_id], card_id: @card.id, correct: true)
      session[:message] = "CORRECT!"
  else
    Guess.create(round_id: session[:round_id], card_id: @card.id)
      session[:message] = "INCORRECT, IDIOT!"
  end
  session[:card_id] = @card.id
  redirect '/deck/answer'
end
