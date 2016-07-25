class UsersController < ApplicationController
	layout "index"

	def index
		if params[:start_date] != nil && params[:end_date] != nil
			session[:search_nanny] = params
			# cookies[:search_nanny] = params
      @search_nanny = search_nanny(params)
      @start_date = start_date(params)
    end
	end
end
