$(function () {
	window.addEventListener('message', function (event) {

		switch (event.data.action) {
			case 'toggleAlert':
				var timerTimer = event.data.data;
				$('#alertNotifuck').fadeIn();
				$('#timangKa').text(timerTimer);
				break;

			case 'closeAlert':
				$('#alertNotifuck').fadeOut();
				break;
		}
	},false);
});
