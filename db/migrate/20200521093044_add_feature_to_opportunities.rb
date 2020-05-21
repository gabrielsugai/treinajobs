class AddFeatureToOpportunities < ActiveRecord::Migration[6.0]
  def change
    add_column :opportunities, :feature, :integer, default: 0
  end
end
