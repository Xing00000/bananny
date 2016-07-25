class APIV1::NanniesController < APIController
  before_action :authenticate_user!


  def search
    if params[:start_date] != nil && params[:end_date] != nil
      @nannies_found = nannies_search(params)
    else
      render :json => {:message => "dates can't be empty"}, :status => 401
    end
  end

end
