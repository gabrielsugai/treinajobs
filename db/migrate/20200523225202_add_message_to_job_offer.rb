class AddMessageToJobOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :job_offers, :message, :string
  end
end
