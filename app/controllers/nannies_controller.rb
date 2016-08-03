class NanniesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_should_be_registered ,:except=>[:new,:create]
  before_action :set_nanny, only: [:edit, :update, :destroy,:data]


  # GET /nannies
  # GET /nannies.json
  def index
    @nannies = Nanny.all
  end

  # GET /nannies/1
  # GET /nannies/1.json
  def show
    @nanny = Nanny.includes(:schedules).find(params[:id])
    @schedule = Schedule.new
    @nanny_schedule = @nanny.schedules
    # @ratings = @nanny.ratings
    # @rating = @ratings.first

  end

  def data
    schedules = @nanny.schedules.all

    render :json => schedules.map {|schedule| {
                :id => schedule.id,
                :start_date => schedule.start_date.to_formatted_s(:db),
                :end_date => schedule.end_date.to_formatted_s(:db),
                :text => schedule.text
            }}
  end

  # GET /nannies/new
  def new
    @nanny = current_user.build_nanny
  end

  # GET /nannies/1/edit
  def edit
  end

  # POST /nannies
  # POST /nannies.json
  def create
    @nanny = current_user.build_nanny(nanny_params)

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
      if current_user.nanny.update(nanny_params)
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
      params.require(:nanny).permit(:last_name,:first_name,:nickname,:gender,:birthdate,:mobile_phone,:phone,:city,:district,:address,:image)
    end

end
