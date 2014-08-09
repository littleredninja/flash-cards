class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, through: :rounds





  def self.authenticate(name, password)
    user = User.find_by(name: name)
    return user if user && (user.password == password)
    nil
  end

end
