class CasesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_case, only: [:show, :edit, :update]
	def index
		@cases = current_user.profile.cases.where(:status => [:build,:booking,:success]).order(updated_at: :desc)
	end

	def create
		@nanny = Nanny.find_by(:id => params[:nanny_id])

		if @nanny.cases.where(:start_date => session_start_date(session["search_nanny"])).where(:end_date => session_end_date(session["search_nanny"])).where(:status => :build).or(@nanny.cases.where(:start_date => session_start_date(session["search_nanny"])).where(:end_date => session_end_date(session["search_nanny"])).where(:status => :booking)).first == nil

			@case = @nanny.cases.create!(
				:emergency_number => current_user.profile.mobile_phone,
		    :emergency_name => current_user.profile.last_name,
		    :city	=> current_user.profile.city,
		    :district => current_user.profile.district,
		    :address => current_user.profile.address,
		    :parent_id => current_user.parent.id,
		    :start_date => session_start_date(session["search_nanny"]),
		    :end_date => session_end_date(session["search_nanny"]),
		    :status => "build",
		    :charge_per_hour => @nanny.info.weekday_charge)
			redirect_to case_path(@case)
		else
			redirect_to @nanny.cases.where(:start_date => session_start_date(session["search_nanny"])).where(:end_date => session_end_date(session["search_nanny"])).where(:status => :build).or(@nanny.cases.where(:start_date => session_start_date(session["search_nanny"])).where(:end_date => session_end_date(session["search_nanny"])).where(:status => :booking)).first
		end
	end

	def edit
		@nanny = Nanny.find_by(params[:id])
	end

	def show
		@cases = Case.find(params[:id])
		if current_user.profile.cases.find(@cases)
			@new_comment = @case.comments.new
			@comments = @cases.comments.order(created_at: :desc)
		end
	end

	def update
    respond_to do |format|
      if @case.update(case_params)
        if @case.status == "cancel"
        	format.html { redirect_to cases_path, notice: '案件已取消' }
      	else
      		format.html { redirect_to @case, notice: 'case was successfully updated.' }
      	end
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

	private
		def set_case
			@case = Case.find(params[:id])
		end
		def case_params
      params.require(:case).permit(:emergency_number, :emergency_name, :city, :district, :address,:comment,:status)
    end


end
