// Ignore signed out pages
if (!/(^|\b)marcom/.test($('body').attr('class'))) {
  // Fit within smaller windows
  $('body, #controlPanel').css({'min-width': '650px', 'overflow': 'visible'});

  // I don't need no stinkin' header
  $('h1').hide();

  // ... just a streamlined nav bar
  $('#header .navigation_area').css({'float': 'none', 'margin': '0'})
  $('#header .navigation_area .welcome_message').css({'float': 'left', 'margin-top': '4px'})
  $('#header').animate({"height": "22"})

  // ... and a streamlined control panel
  $('#controlPanel #velocity').animate({'float': 'left', 'margin-left': '10px'})
  $('#controlPanel #controls_search_velocity_row > div.right').css({'position': 'absolute'}).animate({'right': '20px', 'margin-top': '-30px'})
}

