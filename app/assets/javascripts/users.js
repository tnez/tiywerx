// wait for document to load
$(document).ready( function() {


  // make courses not offered at this location unavailable
  function displayAvailability(location_id) {
    $('.course-item').each( function () {
      if ( $.inArray(location_id,$(this).data('locations')) != -1 ) {
        $(this).removeClass("unavailable");
      }
      else {
        $(this).addClass("unavailable");
      }
    })
      }

  // toggle selected
  function toggleSelected($courseItem) {
    // if the course is currently unavailable, do nothing
    if ($courseItem.hasClass('unavailable')) {
      return
    }
    // otherwise if the course is currently selected...
    if ($courseItem.hasClass('selected')) {
      // remove selection class
      $courseItem.removeClass('selected');
      // TODO: and remove enrollment for the user
    }
    // otherwise, if the course is not currently selected...
    else {
      // add selection class
      $courseItem.addClass('selected');
      // TODO: and add enrollment for the user
    }
  }

  // initial display availability
  displayAvailability( Number($('#user_location_id').val()) );

  // update availability after change of campus
  $('#user_location_id').change( function() {
    displayAvailability( Number($('#user_location_id').val()) );
  });

  // toggle selection after click
  $('.course-item').click( function() {
    console.log("toggle selected");
    toggleSelected($(this));
  });
  
});
