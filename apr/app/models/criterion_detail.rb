class CriterionDetail < ActiveRecord::Base
  belongs_to :action_plan
  belongs_to :criterion

  # validates :comments, presence: {message: "cannot be blank!"}
  # validates :cd_field1, presence: {message: "cannot be blank!"}
  # validates :cd_field2, presence: {message: "cannot be blank!"}
  #
  # validate :cd_date1_cannot_be_in_the_past
  # validate :cd_date2_cannot_be_in_the_past
  #
  # def cd_date1_cannot_be_in_the_past
  #   errors.add(:cd_date1, "can't be in the future") if !cd_date1.blank? and cd_date1 > Date.today
  # end
  #
  # def cd_date2_cannot_be_in_the_past
  #   errors.add(:cd_date2, "can't be in the future") if !cd_date2.blank? and cd_date2 > Date.today
  # end
end
