class ChildrenController < ApplicationController
	before_action :set_child, only: [:edit,:update]
	before_action :set_parent, only: [:new,:create,:edit,:update]
	def new
		@child = @parent.children.new

	end

	def create
    @child = @parent.children.new(child_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to @parent, notice: 'Nanny was successfully created.' }
      else
        format.html { render @child.errors }
     end
    end
  end

  def edit
  end
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to @parent, notice: 'Nanny was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

	private
    def set_parent
      @parent = current_user.parent
    end
    def set_child
      @child = Child.find(params[:id])
    end
    def child_params
      params.require(:child).permit(:last_name,:first_name,:nickname,:gender,:birthdate,:mobile_phone,:phone,:city,:district,:address,:image)
    end
end
