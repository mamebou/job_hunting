class SelectionsController < ApplicationController
  before_action :set_selection, only: %i[ show edit update destroy ]

  # GET /selections or /selections.json
  def index
    @selections = Selection.all
  end

  # GET /selections/1 or /selections/1.json
  def show
  end

  # GET /selections/new
  def new
    @selection = Selection.new
  end

  # GET /selections/1/edit
  def edit
  end

  # POST /selections or /selections.json
  def create
    @selection = Selection.new(selection_params)
    company = Company.where(company_name: selection_params[:company_name])
    @selection.company_id = company.first.id
    if selection_params[:plan_date].present? && selection_params[:next_plan].present?
      Plan.create(title: selection_params[:next_plan], start_time: selection_params[:plan_date])
    end

    if selection_params[:es_deadline].present?
      Plan.create(title: "#{company.company_name}: ES締め切り", start_time: selection_params[:es_deadline])
    end


    respond_to do |format|
      if @selection.save
        format.html { redirect_to root_path, notice: "Selection was successfully created." }
        format.json { render :show, status: :created, location: @selection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selections/1 or /selections/1.json
  def update
    if selection_params[:plan_date].present? && selection_params[:next_plan].present? && selection_params[:plan_date] != @selection.plan_date && selection_params[:next_plan] != @selection.next_plan
      Plan.create(title: "#{@selection.company.company_name}: #{selection_params[:next_plan]}", start_time: selection_params[:plan_date])
    end

    if selection_params[:es_deadline].present? && selection_params[:es_deadline] != @selection.es_deadline
      Plan.create(title: "#{@selection.company.company_name}: ES締め切り", start_time: selection_params[:es_deadline])
    end
    
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to root_path, notice: "Selection was successfully updated." }
        format.json { render :show, status: :ok, location: @selection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1 or /selections/1.json
  def destroy
    @selection.destroy

    respond_to do |format|
      format.html { redirect_to selections_url, notice: "Selection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def selection_params
      params.require(:selection).permit(:company_id, :status, :es_deadline, :is_intern, :next_plan, :plan_date, :note, :company_name)
    end
end
