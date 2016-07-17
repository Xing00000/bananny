# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CommentsChannel < ApplicationCable::Channel
  def self.broadcast(comment)
  	broadcast_to comment.case, comment:
  		CommentsController.render(:partial => "shared/comment_left",:locals => { comment: comment})
  end
  def subscribed
    Case.all.each do |a|
      stream_for a
    end
    # stream_for Case.last
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


end
