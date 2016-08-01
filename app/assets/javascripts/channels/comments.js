var cases;

cases = document.location.pathname.split('/')[1];

if (cases === cases) {


App.comments = App.cable.subscriptions.create({
  channel: 'CommentsChannel',
  case_id: document.location.pathname.split("/")[2]
}, {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    $('#comments').prepend(data.comment);
    return $('#comment_comment').val("");
  }
});


}