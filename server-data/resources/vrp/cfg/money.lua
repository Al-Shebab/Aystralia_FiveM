local cfg = {}

-- start wallet/bank values
local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 1000
cfg.open_bank = 20000


cfg.display_css = [[
.div_money .symbol{

content: url('https://i.imgur.com/PVNqzUP.png');
position: absolute;
bottom: -46px;
left: -37px;
 
}

.div_bmoney .symbol{
  content: url('https://i.imgur.com/nYSPbnW.png');
  position: absolute;
  bottom: -46px;
  left: -37px;
  
}
.div_money{
  position: absolute;
  bottom: 63px;
  left: 341px;
  color: white;
  max-width: 170px;
  font-family: "Arial Bold";
  font-size: 20px;
  font-weight: normal;
  color: #FFFFFF;
  text-shadow: rgb(0, 0, 0) 1px 0px 0px, rgb(0, 0, 0) 0.533333px 0.833333px 0px, rgb(0, 0, 0) -0.416667px 0.916667px 0px, rgb(0, 0, 0) -0.983333px 0.133333px 0px, rgb(0, 0, 0) -0.65px -0.75px 0px, rgb(0, 0, 0) 0.283333px -0.966667px 0px, rgb(0, 0, 0) 0.966667px -0.283333px 0px;
}
.div_bmoney{
  position: absolute;
  bottom: 31px;
  left: 341px;
  max-width: 170px;
  font-family: "Arial Bold";
  font-size: 20px;
  font-weight: normal;
  color: #FFFFFF;
  text-shadow: rgb(0, 0, 0) 1px 0px 0px, rgb(0, 0, 0) 0.533333px 0.833333px 0px, rgb(0, 0, 0) -0.416667px 0.916667px 0px, rgb(0, 0, 0) -0.983333px 0.133333px 0px, rgb(0, 0, 0) -0.65px -0.75px 0px, rgb(0, 0, 0) 0.283333px -0.966667px 0px, rgb(0, 0, 0) 0.966667px -0.283333px 0px;
}
]]

return cfg
