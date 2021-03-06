--
-- Defines which actions can be taken within the context of location
--
local SAY = {}
local scripts = require 'scripts.helpers.scripts'

SAY.say = {
    name = "say",
    validator = scripts.onlyHuman,
    call = function(l, _, player, _, _)
        local d = DATA.getAllData("Player")
        for k, v in pairs(d) do
            if (v.location == player.location and k ~= player.id) then
                if (k >= 0) then
                    TELEGRAM.sendMessage(k, player.name .. ": " .. l[2])
                end
            end
        end
    end
}

return SAY