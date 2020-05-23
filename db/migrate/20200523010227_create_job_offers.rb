class CreateJobOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_offers do |t|
      t.date :start_date
      t.decimal :salary
      t.string :benefits
      t.string :function
      t.string :expectations
      t.integer :status, default: 0
      t.references :job, null: false, foreign_key: true
      t.references :user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
