class UsersController < ApplicationController
	before_action :user_should_be_registered ,:except=>[:index,:registered]
	layout "index"

	def index
		if params[:start_date] != nil && params[:end_date] != nil
			session[:search_nanny] = params
			# cookies[:search_nanny] = params
      @search_nanny = search_nanny(params).select{|n| n.info }
      @start_date = start_date(params)
    end
	end

	def registered
	end
end
