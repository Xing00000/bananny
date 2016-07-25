class APIV1::CasesController < ApplicationController
  before_action :authenticate_user!

  def new
    # check start_date and end_date
    nannies_available = Schedule.where("start_date>=? and start_date < ?", params[:start_date].to_time(:utc), params[:end_date].to_time(:utc)).where(:nanny_id => params[:nanmy_id]).where(:case_id => nil)

    @case = Case.create( :nanny_id => params[:nanmy_id],
                         :start_date => params[:start_date],
                         :end_date => params[:end_date],
                         :status => params[:status] )
    # id
    # params[:schedule_arr].each do |schedule_id|
    #   schedule = Schedule.find(schedule_id)
    #   if schedule.nanny_id == params[:nanmy_id]  && !schedule.case_id.present?
    #     # correct
    #   end
    # end
  end

  def create
    @case = Case.find(params[:id])
    @comment = Comment.create( :case_id => @case.id )
    @comments = Comment.all
  end

  def show
    @case = Case.find(params[:id])
    @case.update( :status => params[:status] )
  end

  def update
  end

  def destroy
    @case = Case.find(params[:id])
    @case.update( :status => 'canceled')
  end


end
