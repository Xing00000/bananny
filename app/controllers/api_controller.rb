class APIController < ActionController::Base
  before_action :authenticate_user_from_token!

  def authenticat_user_from_token!
    if params[:ios_token].present?
      user = User.find_by_authentication_token( params[:ios_token] )

      sign_in(user, store: false) if user
    end
  end
end
