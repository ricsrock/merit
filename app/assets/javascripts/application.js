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
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
//= require bootstrap
//= require jquery.purr
//= require best_in_place
//= require rails.validations


$(function(){ 
  $("#sortable_table").tablesorter();
	/* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

$(function(){
	$("#user_authorized_store_tokens").tokenInput("/admin/stores/search.json", {
		crossDomain: false,
		prePopulate: $("user_authorized_store_tokens").data("pre"),
		theme: "facebook"
	});
});

$(function(){
	$("#employment_person_name").autocomplete();
	$('#results-list').click(function(){
	   $(this).toggle();
	});
});

$(function(){
	$(".search-query").observe_field(1, function( ) {
	 	var form = $(this).parents("form");
		var url = form.attr("action");
		var formData = form.serialize();
		$.get(url, formData, function(html) {
			$("#results").html(html);
		});
	});
});

$(document).ready( function() {
   $('input.initial-focus:first').focus(); // choose first just in case
});


$(function(){
	$("#results-list").live("blur", function(){$(this).hide();
		});
});