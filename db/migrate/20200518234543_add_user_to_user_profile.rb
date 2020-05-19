class AddUserToUserProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_profiles, :user, null: false, foreign_key: true
  end
end
