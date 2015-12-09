class ActionPlansController < ApplicationController
  before_action :set_action_plan, only: [:show, :edit, :update, :destroy]

  def submit_to_apr
  end

  def submit_confirmed
    @user = User.find_by_username(session[:cas_user].to_s)
    @action_plan_t = ActionPlan.find_by_user_id(@user.id)
    # Tell the AprMailer to send the mail to user and Admins of the site
    AprMailer.apr_submit_mail(@user).deliver_now
    @action_plan_t.update_attribute(:status, 'Complete')
    respond_to do |format|
      # format.html { redirect_to action_plans_s_submit_to_apr_url, notice: 'Submitted to APR successfully. You cannot edit the forms now.' }
      format.html { redirect_to action_plans_s_submit_to_apr_url }
    end
  end

  # GET /action_plans
  # GET /action_plans.json
  def index
    @action_plans = ActionPlan.all
  end

  # GET /action_plans/1
  # GET /action_plans/1.json
  def show

  end

  # GET /action_plans/new
  def new
    @action_plan = ActionPlan.new
  end

  # GET /action_plans/1/edit
  def edit
    if !User.find_by_username(session[:cas_user].to_s).role.eql?("Admin") then
      if !User.find_by_username(session[:cas_user].to_s).eql?(User.find(@action_plan.user_id)) then
        raise ActionController::RoutingError.new('Action Plan not found.')
      end
    end
  end

  # POST /action_plans
  # POST /action_plans.json
  def create
    @action_plan = ActionPlan.new(action_plan_params)

    respond_to do |format|
      if @action_plan.save
        # format.html { redirect_to @action_plan, notice: 'Action plan was successfully created.' }
        format.html { redirect_to edit_action_plan_path(:id => @action_plan.id), notice: 'Action plan was successfully created.' }
        format.json { render :show, status: :created, location: @action_plan }
      else
        format.html { render :new }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_plans/1
  # PATCH/PUT /action_plans/1.json
  def update
    respond_to do |format|
      if @action_plan.update(action_plan_params)
        # format.html { redirect_to @action_plan, notice: 'Action plan was successfully updated.' }
        format.html { redirect_to edit_action_plan_path(:id => @action_plan.id), notice: 'Action plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_plan }
      else
        format.html { render :edit }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_plans/1
  # DELETE /action_plans/1.json
  def destroy
    @criterion_details = CriterionDetail.where(["action_plan_id = ?", @action_plan.id])
    @criterion_details.each do |cd|
      CriterionSubDetail.destroy_all "criterion_detail_id = #{cd.id}"
      CriterionFile.destroy_all "criterion_detail_id = #{cd.id}"
      # CriterionDetail.destroy_all "criterion_detail_id = #{@action_plan.id}"
      cd.destroy
    end
    @action_plan.destroy
    respond_to do |format|
      format.html { redirect_to action_plans_url, notice: 'Action plan and its associated Criterion Details (along with files uploaded) were successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_action_plan
    @action_plan = ActionPlan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def action_plan_params
    # params.require(:action_plan).permit(:unit_id, :user_id, :date_of_site_visit, :submission_or_update, :submission_or_update_date, :submitter_first_name, :submitter_last_name, :submitter_title)
    params.require(:action_plan).permit(:unit_id, :user_id, :date_of_site_visit, :submitter_first_name, :submitter_last_name, :submitter_title, :status)
  end

end
