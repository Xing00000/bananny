
App.comments = App.cable.subscriptions.create
  channel: 'CommentsChannel',
  case_id: document.location.pathname.split("/")[2];
,
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#comments').prepend data.comment
    $('#comment_comment').val("")