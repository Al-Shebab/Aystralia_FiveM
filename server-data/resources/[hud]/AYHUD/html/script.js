var blackmoney = false;


$(document).ready(function () {
	$('#microphone-alt-solid').attr("src", 'https://cdn.discordapp.com/attachments/812841412626087956/835908384183025694/14.png');
	$('#broadcast-tower-solid_1').attr("src", 'https://cdn.discordapp.com/attachments/788240573382787114/835908258714615848/13.png');
	$('.schwarzmoney').hide();
	$('#Ebene_3').hide();
	$('#money-bill-solid').hide();
    window.addEventListener("message", function (event) {
        if (event.data.action == "setMoney") {
          setAnzahl(event.data.money);
		    $(".money").show();
  $("money").show();
        };
        if (event.data.action == "setBlackMoney") {
			blackmoney = true;
          setAnzahle(event.data.black);
  $(".schwarzmoney").show();
  $("schwarzmoney").show();


        };
		if (event.data.action == "show") {
					if(!blackmoney) {
  $(".funkeblack").hide();
						  $(".funkblack").hide();

  $(".funk").show();
  $(".funke").hide();
					} else {
						  $(".funkblack").show();
  $(".funkeblack").hide();
  
    $(".funk").hide();
  $(".funke").hide();
					}

        };
		if (event.data.action == "hide") {
							
					if(!blackmoney) {
						  $(".funkblack").hide();
  $(".funkeblack").hide();
  $(".funk").hide();
  $(".funke").show();
					} else {
						  $(".funkblack").hide();
  $(".funkeblack").show();
  
    $(".funk").hide();
  $(".funke").hide();
					}

        };
		if (event.data.action == "weg") {
  $(".funk").hide();
  $(".funke").hide();
  $(".funkblack").hide();
  $(".funkeblack").hide();

        };
        if (event.data.action == "hideBlackMoney") {
  $(".schwarzmoney").hide();
  $("schwarzmoney").hide();
  blackmoney = false;
					  $(".voice1black").hide();
					  $(".voice2black").hide();
					  $(".voice3black").hide();
					  $(".voice4black").hide();
					  $(".voicemutedblack").hide();
                      $(".voice" + event.data.level).show();

	};
    });
});

function setAnzahl(anzahl) {
    document.getElementById("content").innerHTML = "$" + new Intl.NumberFormat('ja-JP').format(anzahl);

}
function setAnzahle(anzahl) {
	if (anzahl < -1) {
		$('.schwarzmoney').show();
		$('#Ebene_3').show();
		return;
	} else {
		$('.schwarzmoney').show();
		$('#Ebene_3').show();
	}
    document.getElementById("content2").innerHTML = "$" + new Intl.NumberFormat('ja-JP').format(anzahl);

}
