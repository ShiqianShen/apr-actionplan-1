class ActionPlan < ActiveRecord::Base
  belongs_to :unit
  # before_destroy :del_referenced_data

  validates :unit_id, presence: {message: "must be selected!"}
  validates :submitter_first_name, presence: {message: "cannot be blank!"}
  validates :submitter_last_name, presence: {message: "cannot be blank!"}
  validates :submitter_title, presence: {message: "cannot be blank!"}
  validates :user_id, presence: {message: "cannot be blank!"}

  validate :date_of_sv_cannot_be_in_the_past

  def date_of_sv_cannot_be_in_the_past
    errors.add(:date_of_site_visit, "can't be in the future") if !date_of_site_visit.blank? and date_of_site_visit > Date.today
  end

  STATUS_TYPES = ['Complete', 'Incomplete']
  validates :status,
            :inclusion => {:in => ['Complete', 'Incomplete'],
                           :message => "%{value} is not a valid status"}

  TITLE_TYPES = ['Mr', 'Ms', 'Mz.', 'Miss', 'Mrs']
  validates :submitter_title,
            :inclusion => {:in => ['Mr', 'Ms', 'Mz.', 'Miss', 'Mrs'],
                           :message => "%{value} is not a valid title"}

  # def del_referenced_data
  #   criterion_detail = CriterionDetail.find_by_action_plan_id(id)
  #   if !criterion_detail.nil?
  #     criterion_sub_details = CriterionSubDetail.find_by_criterion_detail_id(criterion_detail.id)
  #     if !criterion_sub_details.nil?
  #       criterion_files = CriterionFile.find_by_criterion_detail_id(criterion_detail.id)
  #       if !criterion_files.nil?
  #         criterion_files.destroy
  #       end
  #       criterion_sub_details.destroy
  #     end
  #   end
  # end
end
