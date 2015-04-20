/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var refreshCalendar = function() {
    var width = $('.calendar').width() / 8;
    $(".calendar-event").css("width", width);
}

$(function () {
    refreshCalendar();
    $(window).resize(function () {
	refreshCalendar();
    });
});