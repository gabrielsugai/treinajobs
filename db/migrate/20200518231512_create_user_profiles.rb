class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :social_name
      t.date :date_of_birth
      t.string :schooling
      t.string :description
      t.string :experience

      t.timestamps
    end
  end
end
