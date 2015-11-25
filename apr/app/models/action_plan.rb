class ActionPlan < ActiveRecord::Base
	belongs_to :unit

	validates :unit_id, presence: {message: "must be selected!"}
	validates :submitter_first_name, presence: {message: "cannot be blank!"}
	validates :submitter_last_name, presence: {message: "cannot be blank!"}
	validates :submitter_title, presence: {message: "cannot be blank!"}
	validates :user_id, presence: {message: "cannot be blank!"}
end
