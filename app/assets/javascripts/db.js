// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var globalElt;

$(document).ready(function() {
	reload();
	globalElt = $(".connections")[0].lastChild;
});

function reload() {
	$('.icon-remove').click(function() {
		$(this).parent().remove();
	});
	$('.add-position').click(function() {
		$(globalElt).clone().appendTo('.connections');
		$(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({allow_single_deselect:true});
		$('.icon-remove').click(function() {
			$(this).parent().remove();
		});
	});
}