class CreateUsers < ActiveRecord::Migration

  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :password

  		t.timestamps
<<<<<<< HEAD
  	end

=======
    end
>>>>>>> 713215bd853fa2d8187fa571fb1a214b036a2a5d
  end
  
end
