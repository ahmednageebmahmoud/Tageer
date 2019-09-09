/*global $, jQuery */
$(document).ready(function() {

    'use strict';

    /* ======= Preloader ======= */
    $(window).load(function() {
        $('.loader').delay(500).fadeOut('slow');
    });

    /* ======= Dropdown Hover ======= */
    $('ul.nav li.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
    }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
    });

    /* ======= Profile user in navbar ======= */
    $('.dropdown').on('show.bs.dropdown', function() {
      $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
    });
    // Add slideUp animation to Bootstrap dropdown when collapsing.
    $('.dropdown').on('hide.bs.dropdown', function() {
      $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
    });

    /* ======= Forget Password ======= */
    $('a.forget-password').on('click', function(){
      $('#client-area').modal('hide');
      $('#forget-password').modal('show');
    });

    /* ======= View post type ======= */

    $('.sort-posts .post-view-types a.list-view, .sort-posts .post-view-types a.th-view, .sort-posts .post-view-types .map-view').on('click',function(){
      $('.sort-posts .post-view-types a').removeClass('active');
      $(this).toggleClass('active');
    });

    $('.sort-posts .post-view-types a.list-view').on('click',function(){
      $('.main-content .post-main-tab.post-show').removeClass('col-sm-4 post-second').addClass('col-sm-12');
      $('.main-content .post-main-tab.post-show .post-img').removeClass('col-sm-12').addClass('col-sm-3');
      $('.main-content .post-main-tab.post-show .post-body').removeClass('col-sm-12').addClass('col-sm-9');
      $('.main-content .post-main-tab.post-show').addClass('post-width');
      $('.post.post-show').show();
      $('.more-posts-display').show();
        $('.sidebar.col-sm-3').show();
        $('.all-posts').removeClass('col-sm-12').addClass('col-sm-9');
      $('.map-display').hide();
        $('.second-main-content').show();
    });

    $('.sort-posts .post-view-types a.th-view').on('click',function(){
      $('.main-content .post-main-tab.post-show').removeClass('col-sm-12').addClass('col-sm-4 post-second');
      $('.main-content .post-main-tab.post-show .post-img').removeClass('col-sm-3').addClass('col-sm-12');
      $('.main-content .post-main-tab.post-show .post-body').removeClass('col-sm-9').addClass('col-sm-12');
      $('.main-content .post-main-tab.post-show').removeClass('post-width');
      $('.post.post-show').show();
      $('.more-posts-display').show();
        $('.sidebar.col-sm-3').show();
        $('.all-posts').removeClass('col-sm-12').addClass('col-sm-9');
      $('.map-display').hide();
        $('.second-main-content').show();
    });

    $('.sort-posts .post-view-types a.map-view').on('click',function(){
      $('.post.post-show').hide();
      $('.more-posts-display').hide();
      $('.sidebar.col-sm-3').hide();
      $('.all-posts').removeClass('col-sm-9').addClass('col-sm-12');
        $('.second-main-content').hide();
      $('.map-display').show();
    });

    /* ======= Post Slider Img ======= */
    $('.carousel').carousel({
        interval: false
    });

    /* ======= More and less button function in blog page ======= */
    var size_li = $(".post-show").size();
    var x = 6;
    $('.post-show:lt(' + x + ')').show();
    $('.more-posts').on('click', function() {
        x = (x + 2 <= size_li) ? x + 2 : size_li;
        $('.post-show:lt(' + x + ')').show();
        if ($(".post-show:hidden").length == 0) {
            $(".more-posts").hide();
        }
    });

    /* ======= Like Post ======= */
    $(".post-like").click(function(){
      $(this).find('.icon').toggleClass('far fa active');
      var likepost = $(this).attr('data-like');
      if(likepost==="false"){
        var lke = $(this).find("span"),
        value = parseInt(lke.html()) || 0;
        lke.html(value + 1);
        $(this).attr('data-like','true');
      }
      else{
        var lke = $(this).find("span"),
        value = parseInt(lke.html()) || 0;
        lke.html(value - 1);
        $(this).attr('data-like','false');
      }
    });

    /* ======= Sidebar Filter Fixed ======= */
  	var summaries = $('.filter-sidebarr');
  	summaries.each(function(i) {
  		var summary = $(summaries[i]);
  		var next = summaries[i + 1];

  		summary.scrollToFixed({
  			// marginTop : $('header').outerHeight(true) + 10,
        marginTop : 80,
  			limit : function() {
  				var limit = 0;
  				if (next) {
  					limit = $(next).offset().top - $(this).outerHeight(true) - 10;
  				} else {
  					limit = $('footer').offset().top - $(this).outerHeight(true) - 10;
  				}
  				return limit;
  			},
  			zIndex : 8
  		});
  	});


    /* ======= Add ads tabs ======= */
    $("#btn1").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(2)').addClass('active');
    });

    $("#btn2").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(3)').addClass('active');
    });

    $("#btn3").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(1)').addClass('active');
    });

    $("#btn4").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(4)').addClass('active');
    });

    $("#btn5").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(2)').addClass('active');
    });

    $("#btn6").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(3)').addClass('active');
    });

    $("#btn7").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(5)').addClass('active');
    });

    $("#btn8").click(function() {
        $('.add-ads .nav.nav-tabs li').removeClass('active');
        $('.add-ads .nav.nav-tabs li').addClass('disabled');
        $('.add-ads .nav-tabs li:nth-child(4)').addClass('active');
    });


    $('.add-ads-page-content .choose-category a').click(function() {
        $('.add-ads-page-content .choose-category a').removeClass('active');
        $(this).addClass('active');
    });

});






/* ======= Map  ======= */


jQuery(function($) {
    // Asynchronously Load the map API
    var script = document.createElement('script');
    script.src = "https://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
    document.body.appendChild(script);
});

function initialize() {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };

    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);

    // Multiple Markers
    var markers = [
        ['London Eye, London', 51.503454,-0.119562],
        ['Palace of Westminster, London', 51.499633,-0.124755]
    ];

    // Info Window Content
    var infoWindowContent = [
        ['<div class="info_content">' +
        '<h3>اسم المكان</h3>' +
        '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</p>' +        '</div>'],
        ['<div class="info_content">' +
        '<h3>اسم المكان</h3>' +
        '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص</p>' +
        '</div>']
    ];

    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;

    // Loop through our array of markers & place each one on the map
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });

        // Allow each marker to have an info window
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(14);
        google.maps.event.removeListener(boundsListener);
    });

}


/* ======= Range Input In Add ads  ======= */

var slider = document.getElementById("range-input");
var output = document.getElementById("range-value");
output.innerHTML = slider.value;

slider.oninput = function() {
  output.innerHTML = this.value;
}




//Reference:
//https://www.onextrapixel.com/2012/12/10/how-to-create-a-custom-file-input-with-jquery-css3-and-php/
;(function($) {

		  // Browser supports HTML5 multiple file?
		  var multipleSupport = typeof $('<input/>')[0].multiple !== 'undefined',
		      isIE = /msie/i.test( navigator.userAgent );

		  $.fn.customFile = function() {

		    return this.each(function() {

		      var $file = $(this).addClass('custom-file-upload-hidden'), // the original file input
		          $wrap = $('<div class="file-upload-wrapper">'),
		          $input = $('<input type="text" class="file-upload-input" readonly />'),
		          // Button that will be used in non-IE browsers
		          $button = $('<button type="button" class="file-upload-button">ارفع الصور</button>'),
		          // Hack for IE
		          $label = $('<label class="file-upload-button" for="'+ $file[0].id +'">Select a File</label>');

		      // Hide by shifting to the left so we
		      // can still trigger events
		      $file.css({
		        position: 'absolute',
		        left: '-9999px'
		      });

		      $wrap.insertAfter( $file )
		        .append( $file, $input, ( isIE ? $label : $button ) );

		      // Prevent focus
		      $file.attr('tabIndex', -1);
		      $button.attr('tabIndex', -1);

		      $button.click(function () {
		        $file.focus().click(); // Open dialog
		      });

		      $file.change(function() {

		        var files = [], fileArr, filename;

		        // If multiple is supported then extract
		        // all filenames from the file array
		        if ( multipleSupport ) {
		          fileArr = $file[0].files;
		          for ( var i = 0, len = fileArr.length; i < len; i++ ) {
		            files.push( fileArr[i].name );
		          }
		          filename = files.join(', ');

		        // If not supported then just take the value
		        // and remove the path to just show the filename
		        } else {
		          filename = $file.val().split('\\').pop();
		        }

		        $input.val( filename ) // Set the value
		          .attr('title', filename) // Show filename in title tootlip
		          .focus(); // Regain focus

		      });

		      $input.on({
		        blur: function() { $file.trigger('blur'); },
		        keydown: function( e ) {
		          if ( e.which === 13 ) { // Enter
		            if ( !isIE ) { $file.trigger('click'); }
		          } else if ( e.which === 8 || e.which === 46 ) { // Backspace & Del
		            // On some browsers the value is read-only
		            // with this trick we remove the old input and add
		            // a clean clone with all the original events attached
		            $file.replaceWith( $file = $file.clone( true ) );
		            $file.trigger('change');
		            $input.val('');
		          } else if ( e.which === 9 ){ // TAB
		            return;
		          } else { // All other keys
		            return false;
		          }
		        }
		      });

		    });

		  };

		  // Old browser fallback
		  if ( !multipleSupport ) {
		    $( document ).on('change', 'input.customfile', function() {

		      var $this = $(this),
		          // Create a unique ID so we
		          // can attach the label to the input
		          uniqId = 'customfile_'+ (new Date()).getTime(),
		          $wrap = $this.parent(),

		          // Filter empty input
		          $inputs = $wrap.siblings().find('.file-upload-input')
		            .filter(function(){ return !this.value }),

		          $file = $('<input type="file" id="'+ uniqId +'" name="'+ $this.attr('name') +'"/>');

		      // 1ms timeout so it runs after all other events
		      // that modify the value have triggered
		      setTimeout(function() {
		        // Add a new input
		        if ( $this.val() ) {
		          // Check for empty fields to prevent
		          // creating new inputs when changing files
		          if ( !$inputs.length ) {
		            $wrap.after( $file );
		            $file.customFile();
		          }
		        // Remove and reorganize inputs
		        } else {
		          $inputs.parent().remove();
		          // Move the input so it's always last on the list
		          $wrap.appendTo( $wrap.parent() );
		          $wrap.find('input').focus();
		        }
		      }, 1);

		    });
		  }

}(jQuery));

$('input[type=file]').customFile();