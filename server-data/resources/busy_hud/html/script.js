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
  					  $(".voice1").hide();
					  $(".voice2").hide();
					  $(".voice3").hide();
					  $(".voice4").hide();
					  $(".voicemuted").hide();
					  $(".voice1black").hide();
					  $(".voice2black").hide();
					  $(".voice3black").hide();
					  $(".voice4black").hide();
					  					    $(".voice" + event.data.level + "black").show();


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
		if (event.data.action == "muted") {
					if (event.data.muted == true) {
					if(!blackmoney) {
					  $(".voice1").hide();
					  $(".voice2").hide();
					  $(".voice3").hide();
					  $(".voice4").hide();
					  $(".voicemuted").show();
					  $(".voice1black").hide();
					  $(".voice2black").hide();
					  $(".voice3black").hide();
					  $(".voice4black").hide();
					  $(".voicemutedblack").hide();
					} else {
                      $(".voice1").hide();
					  $(".voice2").hide();
					  $(".voice3").hide();
					  $(".voice4").hide();
					  $(".voicemuted").hide();
					  $(".voice1black").hide();
					  $(".voice2black").hide();
					  $(".voice3black").hide();
					  $(".voice4black").hide();
					  $(".voicemutedblack").show();
					}
						
					}
										if (event.data.muted == false) {
					  $(".voicemuted").hide();
											  $(".voicemutedblack").hide();

					}

        };
		if (event.data.action == "nomuted") {
					  $(".voicemuted").hide();
											  $(".voicemutedblack").hide();

					

        };

		if (event.data.action == "setVoiceLevel") {
				if(!blackmoney) {
					  $(".voice1").hide();
					  $(".voice2").hide();
					  $(".voice3").hide();
					  $(".voice4").hide();
					  $(".voice1black").hide();
					  $(".voice2black").hide();
					  $(".voice3black").hide();
					  $(".voice4black").hide();
  $(".voice" + event.data.level).show();
				} else {
					  $(".voice1").hide();
					  $(".voice2").hide();
					  $(".voice3").hide();
					  $(".voice4").hide();
					  $(".voice1black").hide();
					  $(".voice2black").hide();
					  $(".voice3black").hide();
					  $(".voice4black").hide();
					    $(".voice" + event.data.level + "black").show();

				}

        };
		if (event.data.action == "setVoiceTalking") {
			if (event.data.val) {
				$('#microphone-alt-solid').attr("src", 'https://cdn.discordapp.com/attachments/788240573382787114/835897308209479760/microphone-alt-solid.png');
			} else {
				$('#microphone-alt-solid').attr("src", 'https://cdn.discordapp.com/attachments/812841412626087956/835908384183025694/14.png');
			}
		};

		if (event.data.action == "setFunkTalking") {
			if (event.data.val) {
				$('#broadcast-tower-solid_1').attr("src", 'https://cdn.discordapp.com/attachments/788240573382787114/835897251531718716/broadcast-tower-solid_1.png');
			} else {
				$('#broadcast-tower-solid_1').attr("src", 'https://cdn.discordapp.com/attachments/788240573382787114/835908258714615848/13.png');
			}
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
    document.getElementById("content").innerHTML = new Intl.NumberFormat('de-DE').format(anzahl) + " $";

}
function setAnzahle(anzahl) {
	if (anzahl < 1) {
		$('.schwarzmoney').hide();
		$('#Ebene_3').hide();
		return;
	} else {
		$('.schwarzmoney').show();
		$('#Ebene_3').show();
	}
    document.getElementById("content2").innerHTML = new Intl.NumberFormat('de-DE').format(anzahl) + " $";

}
