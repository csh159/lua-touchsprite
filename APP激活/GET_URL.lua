

local sz = require("sz")
xlh = sz.system.serialnumber()



function robotGetUrl()
	url = "http://m.yqhelper.me/api.php?c=Eleven&a=robotGetUrl&uwx="..xlh
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		if data.success then
			nLog('成功数据-->'..#data.data)
			-- data.data
			return true
		end
	end
end
--robotGetUrl()



