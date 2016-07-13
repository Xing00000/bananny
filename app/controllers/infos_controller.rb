class InfosController < ApplicationController
	def edit
		unless current_user.nanny.info
			@info = current_user.nanny.build_info
		else
			@info = current_user.nanny.info
		end
	end

	def create
    @info = current_user.nanny.build_info(info_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to current_user.nanny, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @nanny }
      else
        format.html { render :edit }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

	private
    def info_params
      params.require(:info).permit(:weekday_charge,:holiday_charge,:special_charge,:min_hour,:def_special,:special,:introduction,:since)
    end
end
