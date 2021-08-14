$(document).ready(function(){
  // LUA listener
  window.addEventListener('message', function( event ) {
    if (event.data.action == 'open') {
      $('#icemallow-badge').show();
	  $('#icemallow-badge').css('background', 'url(badges/lspd_badge.png)');
    } else if (event.data.action == 'close') {
      $('#icemallow-badge').hide();
    }
  });
});
