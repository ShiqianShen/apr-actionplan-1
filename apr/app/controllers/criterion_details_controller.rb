class CriterionDetailsController < ApplicationController
  before_action :set_criterion_detail, only: [:show, :edit, :update, :destroy]

  # GET /criterion_details
  # GET /criterion_details.json
  def index
    @criterion_details = CriterionDetail.all
  end

  # GET /criterion_details/1
  # GET /criterion_details/1.json
  def show
    @criterion_sub_details = CriterionSubDetail.where(["criterion_detail_id = ?", @criterion_detail.id])
  end

  # GET /criterion_details/new
  def new
    criterion_number = params[:cr]
    @criterion = Criterion.find_by_criterion_number(criterion_number)
    @criterion_detail = CriterionDetail.new
  end

  # GET /criterion_details/1/edit
  def edit
    criterion_number = params[:cr]
    @criterion = Criterion.find_by_criterion_number(criterion_number)
  end

  # POST /criterion_details
  # POST /criterion_details.json
  def create
    @criterion_detail = CriterionDetail.new(criterion_detail_params)

    respond_to do |format|
      if @criterion_detail.save
        # format.html { redirect_to @criterion_detail, notice: 'Criterion detail was successfully created.' }
        format.html { redirect_to edit_criterion_detail_path(:id => @criterion_detail.id, :cr => Criterion.find(@criterion_detail.criterion_id).criterion_number), notice: 'Criterion was successfully created.' }
        format.json { render :show, status: :created, location: @criterion_detail }
      else
        format.html { render :new }
        format.json { render json: @criterion_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criterion_details/1
  # PATCH/PUT /criterion_details/1.json
  def update
    respond_to do |format|
      if @criterion_detail.update(criterion_detail_params)
        # format.html { redirect_to @criterion_detail, notice: 'Criterion detail was successfully updated.' }
        format.html { redirect_to edit_criterion_detail_path(:id => @criterion_detail.id, :cr => Criterion.find(@criterion_detail.criterion_id).criterion_number), notice: 'Criterion was successfully updated.' }
        format.json { render :show, status: :ok, location: @criterion_detail }
      else
        format.html { render :edit }
        format.json { render json: @criterion_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterion_details/1
  # DELETE /criterion_details/1.json
  def destroy
    @criterion_detail.destroy
    respond_to do |format|
      format.html { redirect_to criterion_details_url, notice: 'Criterion detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterion_detail
      @criterion_detail = CriterionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterion_detail_params
      params.require(:criterion_detail).permit(:action_plan_id, :criterion_id, :cd_date1, :cd_date2, :cd_field1, :cd_field2, :comments)
    end
end
