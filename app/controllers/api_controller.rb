class APIController < ActionController::Base
  before_action :authenticate_user_from_token!

   def authenticate_user_from_token!

    if params[:ios_token].present?
      user = User.find_by_authentication_token( params[:ios_token] )

      sign_in(user, store: false) if user
    end
  end

  def start_date(params)
    if params[:date]
      (params[:date] +" "+ params[:start_date]).to_time
    else
      params[:start_date].to_time
    end
  end

  def end_date(params)
    if params[:date]
      (params[:date] +" "+ params[:end_date]).to_time
    else
      params[:end_date].to_time
    end
  end

  def work_time_interval(params)
    (end_date(params) - start_date(params))/1800
  end

  def nannies_search(params)
    # nanny_ids = Schedule.find_available_nannies(params[:start_time], params[:end_time])
    # byebug

    nannies_available = Schedule.where("start_date>=? and start_date < ?",start_date(params) ,end_date(params)).where(:case_id => nil).group(:nanny_id).count.select {|k,v| v >= work_time_interval(params)}.keys
    Nanny.find(nannies_available)

    # nannies_available = Schedule.where("start_date>=? and start_date < ?",params[:start_date].to_time(:utc), params[:end_date].to_time(:utc)).where(:case_id => nil).group(:nanny_id).count.select {|k,v| v >= work_time_interval(params)}.keys
    # Nanny.find(nannies_available)
  end


end
