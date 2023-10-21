local compat = require("custom.compat")

local usercmds = {
    { true, "code" },
    { not compat, "grep" },
}

for _ , usercmd in ipairs( usercmds  )  do
    if usercmd[1] then
        require("custom.neo.usercmd." .. usercmd[2])
    end
end
