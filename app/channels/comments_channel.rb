# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CommentsChannel < ApplicationCable::Channel
  def self.broadcast(comment)
  	broadcast_to comment.case, comment:

  		CommentsController.render(:partial => "shared/comment_left",:locals => { comment: comment})
      # CommentsController.render(:json => comment.to_json )
  end
  def subscribed
    # c = Case.find(params[:case_id])
    # stream_for c

    # Case.all.each do |a|
    #   stream_for a
    # end
    # stream_for comment.case
    stream_from "comments_#{params[:case_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


end
