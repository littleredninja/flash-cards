class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.authenticate(name, password)
    user = User.find_by(name: name)
    return user if user && (user.password == password)
    nil
  end
  
end
