var myApp = myApp || {};

myApp.setup = function() {
  myApp.profileSearchTokenInput();
  myApp.searchResortsAutocomplete();
}

  myApp.profileSearchTokenInput = function() {
    $("#profile_resort_ids").tokenInput("/resorts/search_resorts", {
      crossDomain: false,
      prePopulate: $("#profile_resorts").data("pre"),
      theme: "facebook"
    });
  };

  myApp.searchResortsAutocomplete = function() {
    $("#resort_name").autocomplete({
      source: function(request, response) {
        $.getJSON("/resorts/search_resorts", { q: request.term })
          .success(function( data ) {
            response( $.map( data, function( item ) {
              return {
                  label: item.name,
                  value: item.name
                }
              }
            ))
            }
          );
      }
    });
  }



$(myApp.setup);