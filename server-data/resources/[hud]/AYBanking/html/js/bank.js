$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type === "openGeneral"){
            $('body').fadeIn(500);
        } else if(event.data.type === "balanceHUD") {
            var balance = event.data.balance;
            $('.AYBanking-creditcard-footer-cardholder').html(event.data.player);
            $('.vb-balance-balance').html("$ "+balance);
            $('.AYBanking-tarjetas-mycardcontainer-balance').html("$ "+balance);
            $('.AYBanking-tarjetas-rigthbar-balance').html("$ "+balance);
            $('.AYBanking-myaccount-balance-balance').html("$ "+balance);
            $('.AYBanking-myaccount-faq-balance').html("$ "+balance);
            if (balance.toString().length >= Number(6)) {
                document.getElementById("AYBanking-tarjetas-mycardcontainer-balance").style.fontSize = "28px"
                document.getElementById("AYBanking-tarjetas-rigthbar-balance").style.fontSize = "25px"
                document.getElementById("AYBanking-depositcontainer-balance").style.fontSize = "25px"
                document.getElementById("AYBanking-transferir-container-balance").style.fontSize = "25px"
                document.getElementById("AYBanking-transferir-myaccount-balance").style.fontSize = "25px"
            }
            var playername = event.data.player
            $('.AYBanking-creditcard-cardholder').html(playername);
            var address = event.data.address
            $('.AYBanking-myaccount-info-address').html('<i class="fal fa-map-marker-alt"></i>&nbsp;&nbsp;&nbsp;</i>Address:&nbsp;&nbsp;'+address+'</span>');
            var walletid = event.data.playerid
            $('.AYBanking-myaccount-info-walletid').html('<i class="fal fa-wallet"></i>&nbsp;&nbsp;&nbsp;</i>Wallet ID:&nbsp;&nbsp;'+walletid+'</span>');
        } else if (event.data.type === "closeAll"){
            $('body').fadeOut(500);
        }
    });
});

$(document).on('click','#inicio',function(){
    hideall();
    $(".AYBanking-container-inicio").fadeIn(500);
})

$(document).on('click','#mycards',function(){
    hideall();
    $(".AYBanking-bigcontainertarjetas").fadeIn(500);
})

$(document).on('click','#meterpastica',function(){
    hideall();
    $(".AYBanking-bigcontainerdepositar").fadeIn(500);
})

$(document).on('click','#depositar',function(){
    hideall();
    $(".AYBanking-bigcontainerdepositar").fadeIn(500);
})

$(document).on('click','#transfer',function(){
    hideall();
    $(".AYBanking-bigcontainertransfer").fadeIn(500);
})

$(document).on('click','#myaccount',function(){
    hideall();
    $(".AYBanking-bigcontainermyaccount").fadeIn(500);
})

$(document).on('click','#faq',function(){
    hideall();
    $(".AYBanking-bigcontainerfaq").fadeIn(500);
})

$(document).on('click','#closebanking',function(){
    $('body').fadeOut(500);
    $.post('http://AYBanking/NUIFocusOff', JSON.stringify({}));
})

$(document).on('click','#withdraw',function(e){
    e.preventDefault();
    $.post('http://AYBanking/withdraw', JSON.stringify({
        amountw: $("#withdrawnumber").val()
    }));
    $('body').fadeOut(500);
    $.post('http://AYBanking/NUIFocusOff', JSON.stringify({}));
})

$(document).on('click','#depositarpasta',function(e){
    e.preventDefault();
    $.post('http://AYBanking/deposit', JSON.stringify({
        amount: $("#cantidaddepositar").val()
    }));
    $('body').fadeOut(500);
    $.post('http://AYBanking/NUIFocusOff', JSON.stringify({}));
})

$(document).on('click','#transferirpasta',function(e){
    e.preventDefault();
    $.post('http://AYBanking/transfer', JSON.stringify({
        to: $("#iddestinatario").val(),
        amountt: $("#cantidadtransfer").val()
    }));
    $('body').fadeOut(500);
    $.post('http://AYBanking/NUIFocusOff', JSON.stringify({}));
})

function hideall() {
    $(".AYBanking-container-inicio").hide();
    $(".AYBanking-bigcontainertarjetas").hide();
    $(".AYBanking-bigcontainerdepositar").hide();
    $(".AYBanking-bigcontainertransfer").hide();
    $(".AYBanking-bigcontainermyaccount").hide();
    $(".AYBanking-bigcontainerfaq").hide();
}

document.onkeyup = function(data){
    if (data.which == 27){
        $('body').fadeOut(500);
        $.post('http://AYBanking/NUIFocusOff', JSON.stringify({}));
    }
}