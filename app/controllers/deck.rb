get '/deck/answer' do
  @card = Card.find(session[:card_id])
  @deck = Deck.find(session[:deck_id])
  @message = session[:message]
  erb :"/deck/answer"
end

get '/deck/question' do
  @card = next_card(session[:deck_id])
  @card.update(answered: true)
  erb :"/deck/guess"
end

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user_id: session[:user_id], deck: @deck)
  session[:round_id] = @round.id
  session[:deck_id] = @deck.id
  @card = next_card(params[:deck_id])
  @card.update(answered: true)
  erb :"/deck/guess"
end

post '/deck/:deck_id' do
  @card = Card.find(params[:card_id])
  @user_guess = params[:user_guess]
  if @user_guess == @card.answer
    Guess.new(round_id: session[:round_id], card_id: @card.id, correct: true)
      session[:message] = "CORRECT!"
  else
    Guess.new(round_id: session[:round_id], card_id: @card.id)
      session[:message] = "INCORRECT, IDIOT!"
  end
  session[:card_id] = @card.id
  redirect '/deck/answer'
end
