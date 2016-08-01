class CommentsController < ApplicationController
	def create
		@case = Case.find_by(:id => params[:case_id])

		if current_user == @case.parent.user || current_user == @case.nanny.user
			@comment = @case.comments.create!(:comment => comment_params[:comment],:user_id => current_user.id	)


			html = ApplicationController.renderer.render(:partial => "shared/comment_left",:locals => { comment: @comment})
			ActionCable.server.broadcast "comments_#{@comment.case_id}", { :comment => html }
			# CommentsChannel.broadcast(@comment)
		end
		respond_to do |format|
      format.html { redirect_to @case }
      format.js { render "comment_create"}
    end
	end

	private
		def comment_params
			params.require(:comment).permit(:comment)
		end


end
