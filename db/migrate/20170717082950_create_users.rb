class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :city
    	t.string :state
    	t.string :house_number
    	t.string :email
    	t.string :gender
    	t.string :password_digest
    	t.integer :phone_number
    	t.date :date_of_birth
      t.timestamps
    end
  end
end
