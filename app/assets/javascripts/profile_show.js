$(function() {
  $("#profile_resort_ids").tokenInput("/resorts/search_resorts", {
    crossDomain: false,
    prePopulate: $("#profile_resorts").data("pre"),
    theme: "facebook"
  });
});