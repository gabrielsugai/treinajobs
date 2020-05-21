class RemoveFeaturedFromOpportunities < ActiveRecord::Migration[6.0]
  def change
    remove_column :opportunities, :featured, :boolean
  end
end
