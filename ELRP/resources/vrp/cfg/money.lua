local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 20000
cfg.open_bank = 20000

cfg.display_css = [[
.div_money{
  position: absolute;
  bottom: 46px;
  left: 305px;
  display: block;
  box-sizing: border-box;
  font-size: 30px;
  background: rgba(24, 27, 32, 0.534);
  font-family: Microsoft Sans Serif;
  font-weight:bold;
  color: #FFFFFF;
  text-shadow: rgb(0, 0, 0) 1px 0px 0px, rgb(0, 0, 0) 0.533333px 0.833333px 0px, rgb(0, 0, 0) -0.416667px 0.916667px 0px, rgb(0, 0, 0) -0.983333px 0.133333px 0px, rgb(0, 0, 0) -0.65px -0.75px 0px, rgb(0, 0, 0) 0.283333px -0.966667px 0px, rgb(0, 0, 0) 0.966667px -0.283333px 0px;
}

.div_bmoney{
  position: absolute;
  bottom: 10px;
  left: 305px;
  display: block;
  box-sizing: border-box;
  font-size: 30px;
  background: rgba(24, 27, 32, 0.534);
  font-family: Microsoft Sans Serif;
  font-weight:bold;
  color: #FFFFFF;
  text-shadow: rgb(0, 0, 0) 1px 0px 0px, rgb(0, 0, 0) 0.533333px 0.833333px 0px, rgb(0, 0, 0) -0.416667px 0.916667px 0px, rgb(0, 0, 0) -0.983333px 0.133333px 0px, rgb(0, 0, 0) -0.65px -0.75px 0px, rgb(0, 0, 0) 0.283333px -0.966667px 0px, rgb(0, 0, 0) 0.966667px -0.283333px 0px;
}

.div_money .symbol{

  content: url('https://i.imgur.com/JUz1njC.png'); 
 
}

.div_bmoney .symbol{
  content: url('https://i.imgur.com/ZP4cv71.png');
  
}
]]

return cfg
