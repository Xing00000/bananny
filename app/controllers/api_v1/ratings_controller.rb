class APIV1::RatingsController < APIController
  def rating
    @case = Case.find(params[:id])
    items = @case.items
    # @item = Item.create( :rating_id => ,
    #                      :name => params[:name],
    #                      :scored => params[:scored] )
    @parent = @case.parent
  end
end
