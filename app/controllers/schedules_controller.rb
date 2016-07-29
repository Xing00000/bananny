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
    input = count_input_times(schedule_params)
    start_date = schedule_params[:start_date].to_time

    time1 = 0
    time2 = 1800

    ActiveRecord::Base.transaction do
      input.to_i.times do |s|
        if @nanny.schedules.where(:start_date => (start_date+time1),:end_date => (start_date+time2)).first.nil?
          @nanny.schedules.create(:start_date => (start_date+time1),:end_date => (start_date+time2))
        end
        time1 += 1800
        time2 += 1800
      end
    end
    redirect_to @nanny, notice: 'Schedule was successfully created.'
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
        schedule = @nanny.schedules.create :start_date => start_date, :end_date => end_date

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

  def booking

    @case = Case.find(params[:case_id].to_i)
    if params[:confirm] == "true"

      schedules = current_user.profile.schedules.where("start_date>=? and start_date < ?",@case.start_date,@case.end_date).where(:case_id => nil)
      count = (@case.end_date - @case.start_date)/1800

      if schedules.count == count
        schedules.update_all(:text => @case.parent.nickname ,:case_id => @case.id)
        @case.update(:status => "success")
        redirect_to cases_path
      else
        redirect_to cases_path , notice: '重複預約.'
      end

    end


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
      params.require(:schedule).permit(:start_date,:end_date)
    end




end
# search schedule return nanny_id but can not lock
# Schedule.where("date = '2016-07-10'").where(:helfhour => 16..20).group("nanny_id").count.select {|k,v| v >= 5}.keys

# Schedule.where("date = '2016-07-10'").where(:helfhour => 16..20).group("nanny_id").having("count(helfhour) >= ?",5)
#20160716 give up 分段搜尋寫不出來
#Schedule.where("start_date<=? and end_date >= ?","2016-07-16 05:00:00","2016-07-16 06:00:00").group(:nanny_id).count.select {|k,v| v < 2}.keys