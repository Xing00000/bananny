class APIController < ActionController::Base
  before_action :authenticate_user_from_token!

   def authenticate_user_from_token!
    if params[:ios_token].present?
      user = User.find_by_authentication_token( params[:ios_token] )

      sign_in(user, store: false) if user
    end
  end

  def work_time_interval(params)
    (params[:end_date].to_time-params[:start_date].to_time)/1800
  end

  def nannies_search(params)
    nannies_available = Schedule.where("start_date>=? and start_date < ?",params[:start_date].to_time(:utc), params[:end_date].to_time(:utc)).where(:case_id => nil).group(:nanny_id).count.select {|k,v| v >= work_time_interval(params)}.keys
    Nanny.find(nannies_available)
  end


end
