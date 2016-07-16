class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @nanny = Nanny.find(params[:nanny_id])


    # input = count_input_times(schedule_params)

    # input.times do |s|
    #   @nanny.schedules.create()
    # end


    # redirect_to @nanny, notice: 'Schedule was successfully created.'



  end

  def db_action
    @nanny = Nanny.find(params[:nanny_id])
    mode = params["!nativeeditor_status"]
    id = params["id"]
    start_date = params["start_date"]
    end_date = params["end_date"]
    text = params["text"]

    case mode
      when "inserted"
        schedule = @nanny.schedules.create :start_date => start_date, :end_date => end_date, :text => text
        tid = schedule.id

      when "deleted"
        Schedule.find(id).destroy
        tid = id

      when "updated"
        schedule = Schedule.find(id)
        schedule.start_date = start_date
        schedule.end_date = end_date
        schedule.text = text
        schedule.save
        tid = id
    end

   render :json => {
              :type => mode,
              :sid => id,
              :tid => tid,
          }
 end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:start_at,:end_at)
    end




end
# search schedule return nanny_id but can not lock
# Schedule.where("date = '2016-07-10'").where(:helfhour => 16..20).group("nanny_id").count.select {|k,v| v >= 5}.keys

# Schedule.where("date = '2016-07-10'").where(:helfhour => 16..20).group("nanny_id").having("count(helfhour) >= ?",5)