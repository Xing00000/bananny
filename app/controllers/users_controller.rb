class UsersController < ApplicationController
	def index
		if params[:date] != nil && params[:start_time] != nil
			session["search_nanny"] = params
      @search_nanny = search_nanny(params)
    end
	end
end
