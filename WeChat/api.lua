require("TSLib")
require("tsp")
local sz = require("sz")

--传入数据
api={}
function api.wechat()
	local url = "http://wenfree.cn/api/Public/user/?service=User.wechat"
	local postarr = {}
	postarr.imei = sz.system.serialnumber()
	postarr.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
	postarr.whos = UIvalues.whos
	local data = post(url,postarr)
	if data ~= nil then
		print_r(data)
		return data
	end
end




































