var cases;
var case_id;
cases_html = document.location.pathname.split('/')[1];
case_id = document.location.pathname.split("/")[2]
console.log(cases_html);console.log(case_id);
if (cases_html === "cases" && case_id != null) {


App.comments = App.cable.subscriptions.create({
  channel: 'CommentsChannel',
  case_id: case_id
}, {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    $('#comments').prepend(data.comment);
    return $('#comment_comment').val("");
  }
});


}