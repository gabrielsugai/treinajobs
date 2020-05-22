class AddFeedbackMessageToOpportunities < ActiveRecord::Migration[6.0]
  def change
    add_column :opportunities, :feedback_message, :string
  end
end
