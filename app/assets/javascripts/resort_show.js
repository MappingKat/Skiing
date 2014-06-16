$(function() { 

  var $nav = $("nav");
  var $nav_links = $("nav a");

  var $nav_one = $("#nav_one");
  var $nav_two = $("#nav_two");
  var $nav_three = $("#nav_three");

  var $section_one = $("#one"); // overview
  var $section_two = $("#two"); // reviews
  var $section_three = $("#three"); // weather

    $nav_links.click( function(event) {
    $.scrollTo(
      $(this).attr("href"),
      {
        duration: 2000,
        offset: { 'left':0, 'top':0 }
      }
    );
  });

  // Updates menu styling when scrolling through the associated element.

  function removeActive() {
    $nav_links.removeClass('active');
  };

  $section_one.waypoint({
    handler: function(direction){
      if (direction == "down") {
        removeActive();
        $nav_one.addClass('active')
      }
    },
  });

  $section_one.waypoint({
    handler: function(direction){
      if (direction == "up") {
        removeActive();
        $nav_one.addClass('active')
      }
    },
    offset: function() {
      return -$(this).height();
    }
  });

  $section_two.waypoint({
    handler: function(direction){
      if (direction == "down") {
        removeActive();
        $nav_two.addClass('active')
      }
    },
  });

  $section_two.waypoint({
    handler: function(direction){
      if (direction == "up") {
        removeActive();
        $nav_two.addClass('active')
      }
    },
    offset: function() {
      return -$(this).height();
    }
  });

  $section_three.waypoint({
    handler: function(direction){
      if (direction == "down") {
        removeActive();
        $nav_three.addClass('active')
      }
    }
  });
});