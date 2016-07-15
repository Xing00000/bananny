class CasesController < ApplicationController

	def create
		@nanny = Nanny.find_by(params[:id])
		session["search_nanny"]

		@case = @nanny.cases.create!(
			:emergency_number => current_user.profile.mobile_phone,
	    :emergency_name => current_user.profile.last_name,
	    :city	=> current_user.profile.city,
	    :district => current_user.profile.district,
	    :address => current_user.profile.address,
	    :parent_id => current_user.parent.id,
	    :date => session["search_nanny"]["date"],
	    :start_time => session["search_nanny"]["start_time"],
	    :end_time => session["search_nanny"]["end_time"],
	    :status => "build")
		redirect_to case_path(@case)
	end

	def edit
		@nanny = Nanny.find_by(params[:id])
	end

	def show
		@cases = Case.find(params[:id])

	end

	private

end
