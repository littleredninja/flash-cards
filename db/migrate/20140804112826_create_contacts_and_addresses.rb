class CreateContactsAndAddresses < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, :email
    end

    create_table :addresses do |t|
      t.belongs_to :contact
      t.string :street, :city, :state, :zip
    end

  end
end
