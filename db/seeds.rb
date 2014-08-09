require 'csv'

def load_list(file)
  deck = Deck.create(name: "test")
  user = User.create(name: "frank", password: "1234")
  round = Round.create(user: user, deck: deck)
  CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
    card = Card.create(answer: row[:answer], question: row[:question], deck_id: deck.id)
  end

  10.times do
    card = deck.cards.sample
    answer = [true, false]
    Guess.create(round: round, card: card, correct: answer.sample )
  end
end
load_list("db/capitals.csv")