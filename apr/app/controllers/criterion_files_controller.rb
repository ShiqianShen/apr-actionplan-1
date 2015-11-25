class CriterionFilesController < ApplicationController
  before_action :set_criterion_file, only: [:show, :edit, :update, :destroy]

  # GET /criterion_files
  # GET /criterion_files.json
  def index
    @criterion_files = CriterionFile.all
  end

  # GET /criterion_files/1
  # GET /criterion_files/1.json
  def show
  end

  # GET /criterion_files/new
  def new
    @criterion_file = CriterionFile.new
  end

  # GET /criterion_files/1/edit
  def edit
  end

  # POST /criterion_files
  # POST /criterion_files.json
  def create
    @criterion_file = CriterionFile.new(criterion_file_params)

    respond_to do |format|
      if @criterion_file.save
        format.html { redirect_to @criterion_file, notice: 'Criterion file was successfully created.' }
        format.json { render :show, status: :created, location: @criterion_file }
      else
        format.html { render :new }
        format.json { render json: @criterion_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criterion_files/1
  # PATCH/PUT /criterion_files/1.json
  def update
    respond_to do |format|
      if @criterion_file.update(criterion_file_params)
        format.html { redirect_to @criterion_file, notice: 'Criterion file was successfully updated.' }
        format.json { render :show, status: :ok, location: @criterion_file }
      else
        format.html { render :edit }
        format.json { render json: @criterion_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterion_files/1
  # DELETE /criterion_files/1.json
  def destroy
    @criterion_file.destroy
    respond_to do |format|
      format.html { redirect_to criterion_files_url, notice: 'Criterion file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterion_file
      @criterion_file = CriterionFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterion_file_params
      params.require(:criterion_file).permit(:criterion_detail_id, :name, :attachment)
    end
end
