class Card < ActiveRecord::Base
	
	def change 
		create_table cards: do |t|
			t.string :question, :answer
			t.integer :deck_id

			t.timestamps
		end
	end

end
