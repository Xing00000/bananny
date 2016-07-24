class APIV1::NanniesController < APIController
  before_action :authenticate_user!


  def search_nannies
    if params[:start_date] != nil && params[:end_date] != nil
      @nannies_found = nannies_search(params)
    end
  end

end
