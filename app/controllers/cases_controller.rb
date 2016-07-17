class CasesController < ApplicationController

	def create
		@nanny = Nanny.find_by(:id => params[:nanny_id])

		if @nanny.cases.where(:start_date => session["search_nanny"]["start_date"].to_time(:utc),:end_date => session["search_nanny"]["end_date"].to_time(:utc),).first == nil
			@case = @nanny.cases.create!(
				:emergency_number => current_user.profile.mobile_phone,
		    :emergency_name => current_user.profile.last_name,
		    :city	=> current_user.profile.city,
		    :district => current_user.profile.district,
		    :address => current_user.profile.address,
		    :parent_id => current_user.parent.id,
		    :start_date => session["search_nanny"]["start_date"].to_time(:utc),
		    :end_date => session["search_nanny"]["end_date"].to_time(:utc),
		    :status => "build",
		    :charge_per_hour => @nanny.info.weekday_charge)
			redirect_to case_path(@case)
		else
			redirect_to @nanny.cases.where(:start_date => session["search_nanny"]["start_date"].to_time(:utc),:end_date => session["search_nanny"]["end_date"].to_time(:utc),).first
		end
	end

	def edit
		@nanny = Nanny.find_by(params[:id])
	end

	def show
		@cases = Case.find(params[:id])

	end

	private

end
