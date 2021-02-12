--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

-- Change key on client.lua, default key is PAGE UP

cfg = {
  { -- Talking
    distance = 7.001,
    text = "Normal", 
    css = [[
	  .div_voice_icon{
        position: absolute;
        content: url(https://i.imgur.com/FgzmFcw.png);
        height: 50px;
        width: 50px;
	    bottom: 18px;
        left: 304px;
      }
    ]]
  },
  { -- Yelling
    distance = 16.001,
    text = "Loud",
    css = [[
	  .div_voice_icon{
        position: absolute;
        content: url(https://i.imgur.com/W8EMhpF.png);
        height: 50px;
        width: 50px;
	    bottom: 18px;
        left: 304px;
      }
    ]]
  },
  { -- Whisper
    distance = 3.001,
    text = "Whisper",
    css = [[
	  .div_voice_icon{
        position: absolute;
        content: url(https://i.imgur.com/HJQmUe1.png);
        height: 50px;
        width: 50px;
	    bottom: 18px;
        left: 304px;
      }
    ]]
  }
}

return cfg