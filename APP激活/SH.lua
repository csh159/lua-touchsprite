--神话
require("tsp")
url = 'http://api.shjmpt.com:9002'
sh_username = 'ouwen000'
sh_passwrod = 'wenhong'
ItemId = 2838

function sh_login()
	get_url = url..'/pubApi/uLogin?uName='..sh_username..'&pWord='..sh_passwrod..'&Developer=TKqVyhFCQnRcWYXTcMVrRg%3d%3d'
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_url);
	nLog(res)
	sh_list = split(res,"&")
	if #sh_list>2then
		token = sh_list[1]
		nLog(token)
		dialog('神话余额'..sh_list[2]..'\n token='..token, 2)
		mSleep(1000)
		return true
	end
end

--http://api.shjmpt.com:9002/pubApi/GetPhone?ItemId=项目ID&token=登陆token
function sh_GetPhone(ItemId)
	if token == nil then
		sh_login()
	end
	get_url = url..'/pubApi/GetPhone?ItemId='..ItemId..'&token='..token
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_url);
	nLog(res)
	sh_phone_list = split(res,";")
	if #sh_list>1then
		phone = sh_phone_list[1]
		nLog(phone)
		dialog('手机号:'..phone, 1)
		mSleep(1000)
		return true
	end
end
function sh_GMessage(ItemId)
	get_url = url..'/pubApi/GMessage?ItemId='..ItemId..'&token='..token..'&Phone='..phone
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_url);
	nLog(res)
	a,b = string.find(res,'False')
	if a and b then
		return false
	else
		SMS = split(res,"&")
		local i,j = string.find(SMS[4],"%d+")
		dxyzm =string.sub(SMS[4],i,j)
		nLog(dxyzm)
		if dxyzm then
			return true
		end
	end
end
nLog('神话接码平台OK')

