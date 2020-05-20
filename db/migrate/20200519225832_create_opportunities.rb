class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.references :user_profile, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
