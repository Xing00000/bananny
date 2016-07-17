class CommentsController < ApplicationController
	def create
		@case = Case.find_by(:id => params[:case_id])

		if current_user == @case.parent.user || current_user == @case.nanny.user
			@case.comments.create(:comment => comment_params[:comment],
														:user_id => current_user.id	)
		end
		redirect_to :back
	end

	private
		def comment_params
			params.require(:comment).permit(:comment)
		end


end
