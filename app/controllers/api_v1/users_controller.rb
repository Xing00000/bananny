class APIV1::UsersController < APIController

  before_action :authenticate_user!


  # the user is always a parent
  # render parent: first_name, last_name
  # render items: avg of scores
  def show
    @user = current_user
    @user = User.find 227 # for testing purposes only
    @parent = @user.parent
    @items = @parent.items
    @items_avg = @items.average(:scored).to_f.round(2)
  end
end
