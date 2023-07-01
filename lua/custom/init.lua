local compat = require("custom.compat")

require("custom.neo.base")
require("custom.neo.format")
require("custom.neo.providers")
require("custom.neo.autocmd")
require("custom.neo.usercmd")

if compat then
    require("custom.neo.compat")
end
