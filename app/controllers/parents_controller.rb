class ParentsController < ApplicationController
	before_action :set_parent, only: [:show,:edit,:update]
  before_action :user_should_be_registered ,:except=>[:new,:create]
	def new
    @parent = current_user.build_parent
  end

  def create
    @parent = current_user.build_parent(parent_params)

    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, notice: 'Nanny was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if current_user.parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Nanny was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_parent
      @parent = Parent.find(params[:id])
    end
  def parent_params
      params.require(:parent).permit(:last_name,:first_name,:nickname,:gender,:birthdate,:mobile_phone,:phone,:city,:district,:address,:image)
    end
end
