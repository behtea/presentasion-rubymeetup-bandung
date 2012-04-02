// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	setTimeout(updateConversation, 10000);
});

function updateConversation() {
	$.ajax({
	  url: check_msg_path,
	  success: function(data) {
			data = JSON.parse(data);
			for(i=0;i<=data.length-1;i++) {
				blockquote_class = (current_user_id == data[i].current_user_id ? "current_user" : "");
				html_conversations = '<li class="comment"> <div class="comment-meta"> <img src="'+data[i].avatar+'" class="avatar" alt="avatar-chat"> <h4>' + data[i].username + '</h4> <span>'+ data[i].time_msg +'</span> </div> <blockquote class="'+ blockquote_class +'"> <p>'+ data[i].msg +'</p> </blockquote> </li>';
				$("#conversations").append(html_conversations);
			}
			$("#chat-room").animate({ scrollTop: $(document).height() }, "slow");
		}
	});
	setTimeout(updateConversation, 10000); // you could choose not to continue on failure...
}
