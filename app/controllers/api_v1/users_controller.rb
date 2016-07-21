class APIV1::UsersController < APIController
  before_action :authenticate_user!


  # the user is always a parent
  def show
    @user = current_user
    @parent = @user.parent
  end


end
