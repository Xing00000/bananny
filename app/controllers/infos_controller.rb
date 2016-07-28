class InfosController < ApplicationController

  before_action :set_nanny, only: [:edit]

	def edit
		unless @nanny.info
			@info = @nanny.build_info
		else
			@info = @nanny.info
		end
	end

	def create

    #還沒驗證

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

  def update
    @info = current_user.nanny.info
    respond_to do |format|
      if @info.update(info_params)
        format.html { redirect_to current_user.nanny, notice: 'info was successfully updated.' }
        format.json { render :show, status: :ok, location: @nanny }
      else
        format.html { render :edit }
        format.json { render json: @nanny.errors, status: :unprocessable_entity }
      end
    end
  end

	private
    def set_nanny
      @nanny = Nanny.find(params[:id])
    end

    def info_params
      params.require(:info).permit( :weekday_charge,:holiday_charge,:special_charge,
                                    :min_hour,:def_special,:special,:introduction,
                                    :since, :age_0_to_1_cases_done, :age_1_to_5_cases_done,
                                    :lind_id, :qualification,:license_number)
    end
end
