class CreateGuesses < ActiveRecord::Migration
  
  def change
  	create_table :guesses do |t|
  		t.integer :round_id
  		t.integer :card_id
  		t.boolean :correct
  	end
  end

end
