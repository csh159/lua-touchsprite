require("TSLib")
local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
MyTable = {
    ["style"]        = "default",
    ["rettype"]      = "table",
    ["width"]        = w,
    ["height"]       = h,
    ["config"]       = "aoc.dat",
    ["timer"]        = 99,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["title"]        = "微信阅读",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
    pages            =
    {

		{
            {
                ["type"] = "Label",
                ["text"] = "归属者(填后台帐号)",
                ["size"] = 16,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
            {
                ["id"] = "whos",
                ["type"] = "Edit",
                ["prompt"] = "归属谁的",
                ["text"] = "admin",
                ["kbtype"] = "default",
				["width"] = 475,
            },
		}
    }   
}

local MyJsonString = json.encode(MyTable);
UIret,UIvalues = showUI(MyJsonString)
if UIret == 1 then
	log("whos..->"..UIvalues.whos)
else
	lua_exit()
end

