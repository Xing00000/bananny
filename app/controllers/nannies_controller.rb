class NanniesController < ApplicationController
  before_action :set_nanny, only: [:show, :edit, :update, :destroy]

  # GET /nannies
  # GET /nannies.json
  def index

    @nannies = Nanny.all

  end

  # GET /nannies/1
  # GET /nannies/1.json
  def show
    @schedule = Schedule.new
    @nanny_schedule = @nanny.schedules.order(:date,:helfhour)
  end

  # GET /nannies/new
  def new
    @nanny = Nanny.new
  end

  # GET /nannies/1/edit
  def edit
  end

  # POST /nannies
  # POST /nannies.json
  def create
    @nanny = Nanny.new(nanny_params)

    respond_to do |format|
      if @nanny.save
        format.html { redirect_to @nanny, notice: 'Nanny was successfully created.' }
        format.json { render :show, status: :created, location: @nanny }
      else
        format.html { render :new }
        format.json { render json: @nanny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nannies/1
  # PATCH/PUT /nannies/1.json
  def update
    respond_to do |format|
      if @nanny.update(nanny_params)
        format.html { redirect_to @nanny, notice: 'Nanny was successfully updated.' }
        format.json { render :show, status: :ok, location: @nanny }
      else
        format.html { render :edit }
        format.json { render json: @nanny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nannies/1
  # DELETE /nannies/1.json
  def destroy
    @nanny.destroy
    respond_to do |format|
      format.html { redirect_to nannies_url, notice: 'Nanny was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nanny
      @nanny = Nanny.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nanny_params
      params.fetch(:nanny, {})
    end

end
