class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :skills
      t.string :salary
      t.string :level
      t.date :limit_date
      t.string :local
      t.references :headhunter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
