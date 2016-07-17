class UsersController < ApplicationController
	def index
		if params[:start_date] != nil && params[:end_date] != nil
			session["search_nanny"] = params
      @search_nanny = search_nanny(params)
    end
	end
end
