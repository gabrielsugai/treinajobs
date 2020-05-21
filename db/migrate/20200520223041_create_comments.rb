class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user_profile, null: false, foreign_key: true
      t.references :headhunter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
