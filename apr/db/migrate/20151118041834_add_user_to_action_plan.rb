class AddUserToActionPlan < ActiveRecord::Migration
  def change
  	add_reference :action_plans, :user, index: true, foreign_key: true
  end
end
