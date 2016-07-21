class APIController < ActionController::Base


  def authenticat_user_from_token!
    if params[:auth_token].present?
      user = User.find_by_authentication_token( params[:authentication_token] )

      sign_in(user, store: false) if user
    end
  end
end
