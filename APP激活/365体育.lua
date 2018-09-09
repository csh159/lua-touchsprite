require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")


initLog("jfq", 1);

function initlogs(txt)
	wLog("jfq",txt);
end


手机键盘={
	{113,751,0x000000},{314,759,0x000000},{539,760,0x000000},
	{117,860,0x000000},{324,858,0xffffff},{551,868,0xffffff},
	{112,964,0xf8f8f8},{319,967,0xffffff},{540,962,0x000000},
	[0]={331,1078,0x000000},}

	
function input_phone(txt)
	for i =1,string.len(txt) do
		nLog(string.sub(txt,i,i))
		phone_mun_input = tonumber(string.sub(txt,i,i))
		click(手机键盘[phone_mun_input][1],手机键盘[phone_mun_input][2],0.25)
	end
end

function GetTask(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jfq_URL.."?"..data_url
	nLog(ALL_url)
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	nLog(res)
	--dialog(res,0)
	nLog('code'..code)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa],0)
		toast(data[idfa],1)
		if tonumber(data[idfa]) == 0 then
			nLog('idfa可用')
			return true
		end
	end
end

function up_active(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jh_URL.."?"..data_url
	nLog(ALL_url)
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	nLog(res)
	--dialog(res,0)
	nLog('code'..code)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa],0)
		toast(data[idfa],1)
		if tonumber(data[idfa]) == 0 then
			nLog('idfa激活成功')
			
			up ={}
			up.mail = idfa
			up.fristname = app_name
			up.lastname = bid_app
			up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
			up.password = ip_address
			up.phone = phone
			up.brithday = '激活成功'
			up.map = adid
			upFacebook(up)
					
			return true
		end
	end
end


function upidfa()
	
	if abl()then
		get_idfa(bid_app)
		
		if VPN()then
			mSleep(1000)
			ip_address = ip()
			toast(ip_address,1)
			if ip_address then
				if GetTask(bid_app,adid,idfa)then
					toast('排重成功',1)
					up ={}
					up.mail = idfa
					up.fristname = app_name
					up.lastname = bid_app
					up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
					up.password = ip_address
					up.map = adid
					upFacebook(up)
					mSleep(1000)
					openURL(app_url)
					return true
				else
					toast('排重失败',1)
				end
			else
				toast('ip-false',1)
			end
		end
	end
	
end


Facebook_url = 'http://onlyonelife.online/Public/facebook/?service=Facebook.add'
function upFacebook(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = Facebook_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	initlogs(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	initlogs(body_resp)
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

aoc={}
aoc['lls']={}
aoc['lls']['左滑']={ 0xe6454a, "-4|0|0xe6454a,0|-4|0xe6454a,0|5|0xe6454a", 90, 294, 1061, 345, 1074}
	aoc['lls']['立即体验']={ 0xda4548, "-18|-28|0xda4548,33|44|0xda4548", 90, 152, 918, 478, 1021}
aoc['lls']['菜单界面']={{561,1089,0xcccccc},{391,1087,0xcccccc},{232,1071,0xcccccc},{88,1075,0xe6454a},}
aoc['lls']['使用手机号登录']={ 0xff0000, "0|-41|0xff0000,-1|45|0xff0000", 90, 226, 115, 434, 273}
aoc['lls']['登录58速运']={{400,68,0x333333},{36,83,0xe6454a},{52,480,0xe6454a},}
	aoc['lls']['11位手机号']={ 0xcdcdd3, "-20|3|0xc8c8ce", 90, 169, 378, 367, 447}
	aoc['lls']['下一步']={ 0xffffff, "-3|0|0xe6454a,-11|-7|0xe6454a", 90, 224, 552, 398, 616}
aoc['lls']['登录58速运2']={{51,326,0xe6454a},{227,67,0x333333},{36,83,0xe6454a},}
	aoc['lls']['11位手机号2']={ 0xcdcdd3, "18|-2|0xc7c7cd", 90, 181, 225, 381, 288}
	aoc['lls']['下一步2']={ 0xffffff, "-2|-1|0xeb696d,-3|-24|0xe6454a", 90, 226, 399, 407, 464}
aoc['lls']['右上角x']={ 0x656565, "-9|-9|0x7c7c7c,9|8|0x656565,1|4|0xffffff", 90, 571, 65, 612, 102}
aoc['lls']['请输入验证码']={{421,68,0x333333},{413,68,0xf1f1f1},{36,83,0xe6454a},}
	aoc['lls']['登录按钮']={ 0xfef7f8, "-10|-2|0xe6454a,-13|-26|0xe6454a", 90, 176, 636, 462, 737}
	
aoc['lls']['注册成功']={{559,1066,0xe6454a},{319,146,0xe5454a},{318,205,0xe5454a},{375,153,0xffffff},}


function reg()
	计时 = os.time()
	超时 = math.random(150,200)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif done(aoc['lls']['注册成功'],'注册成功',false,1)then
			toast('注册成功',2)
			delay(10,20)
			return true
		elseif done(aoc['lls']['请输入验证码'],'请输入验证码',false,1)then
			delay(3)
			if 获取 then
				out_time = os.time()
				while (true) do
					if getMessage(id,phone,token)then
						click(369,410)
						input(dxyzm)
						click(443,307)
						获取 = false
						break
					end
					if os.time()-out_time > 60 then
						addBlacklist(id,phone,token)
						return false
					end
				end
			end
			aoc['lls']['用车位置']={{112,587,0xb3b3b3},{316,586,0xe5e5e5},{506,588,0x858585},}
			c_wz = math.random(1,3)
			click(aoc['lls']['用车位置'][c_wz][1],aoc['lls']['用车位置'][c_wz][2])
			if c_pic(aoc['lls']['登录按钮'],'登录按钮',true)then
				delay(2)
				up ={}
				up.mail = idfa
				up.fristname = app_name
				up.lastname = bid_app
				up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
				up.password = ip_address
				up.phone = phone
				up.map = adid
				upFacebook(up)
				delay(2)
			end	
		elseif done(aoc['lls']['登录58速运2'],'登录58速运2',false,1)then
			return false
		elseif done(aoc['lls']['登录58速运'],'登录58速运',false,1)then
			if 取号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['lls']['11位手机号'],'11位手机号',true)then
						input(phone)
						click(443,307)
						delay(1)
						取号 = false
					end
				end
			end
			if c_pic(aoc['lls']['下一步'],'下一步',true)then
				获取 = true
				delay(5)
			end
			
		elseif c_pic(aoc['lls']['右上角x'],'右上角x',true)then
		elseif c_pic(aoc['lls']['使用手机号登录'],'使用手机号登录',true)then
		elseif done(aoc['lls']['菜单界面'],'菜单界面',true,1)then
		elseif c_pic(aoc['lls']['左滑'],'左滑',false)then
			if c_pic(aoc['lls']['立即体验'],'立即体验',true)then
			else
				moveTo(600,400,300,400,50,20)
			end
		end
		mSleep(1000*1)
	end
end

--ALZ()

init(0,"0")
app_name = '365天体育'
bid_app = 'com.fix.TY'
adid = '10104'
id = require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")


initLog("jfq", 1);

function initlogs(txt)
	wLog("jfq",txt);
end


手机键盘={
	{113,751,0x000000},{314,759,0x000000},{539,760,0x000000},
	{117,860,0x000000},{324,858,0xffffff},{551,868,0xffffff},
	{112,964,0xf8f8f8},{319,967,0xffffff},{540,962,0x000000},
	[0]={331,1078,0x000000},}

	
function input_phone(txt)
	for i =1,string.len(txt) do
		nLog(string.sub(txt,i,i))
		phone_mun_input = tonumber(string.sub(txt,i,i))
		click(手机键盘[phone_mun_input][1],手机键盘[phone_mun_input][2],0.25)
	end
end

function GetTask(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jfq_URL.."?"..data_url
	nLog(ALL_url)
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	nLog(res)
	--dialog(res,0)
	nLog('code'..code)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa],0)
		toast(data[idfa],1)
		if tonumber(data[idfa]) == 0 then
			nLog('idfa可用')
			return true
		end
	end
end

function up_active(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jh_URL.."?"..data_url
	nLog(ALL_url)
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	nLog(res)
	--dialog(res,0)
	nLog('code'..code)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa],0)
		toast(data[idfa],1)
		if tonumber(data[idfa]) == 0 then
			nLog('idfa激活成功')
			
			up ={}
			up.mail = idfa
			up.fristname = app_name
			up.lastname = bid_app
			up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
			up.password = ip_address
			up.phone = phone
			up.brithday = '激活成功'
			up.map = adid
			upFacebook(up)
					
			return true
		end
	end
end


function upidfa()
	
	if abl()then
		get_idfa(bid_app)
		
		if VPN()then
			mSleep(1000)
			ip_address = ip()
			toast(ip_address,1)
			if ip_address then
				if GetTask(bid_app,adid,idfa)then
					toast('排重成功',1)
					up ={}
					up.mail = idfa
					up.fristname = app_name
					up.lastname = bid_app
					up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
					up.password = ip_address
					up.map = adid
					upFacebook(up)
					mSleep(1000)
					openURL(app_url)
					return true
				else
					toast('排重失败',1)
				end
			else
				toast('ip-false',1)
			end
		end
	end
	
end


Facebook_url = 'http://onlyonelife.online/Public/facebook/?service=Facebook.add'
function upFacebook(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = Facebook_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	initlogs(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	initlogs(body_resp)
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

aoc={}
aoc['lls']={}
aoc['lls']['左滑']={ 0xe6454a, "-4|0|0xe6454a,0|-4|0xe6454a,0|5|0xe6454a", 90, 294, 1061, 345, 1074}
	aoc['lls']['立即体验']={ 0xda4548, "-18|-28|0xda4548,33|44|0xda4548", 90, 152, 918, 478, 1021}
aoc['lls']['菜单界面']={{561,1089,0xcccccc},{391,1087,0xcccccc},{232,1071,0xcccccc},{88,1075,0xe6454a},}
aoc['lls']['使用手机号登录']={ 0xff0000, "0|-41|0xff0000,-1|45|0xff0000", 90, 226, 115, 434, 273}
aoc['lls']['登录58速运']={{400,68,0x333333},{36,83,0xe6454a},{52,480,0xe6454a},}
	aoc['lls']['11位手机号']={ 0xcdcdd3, "-20|3|0xc8c8ce", 90, 169, 378, 367, 447}
	aoc['lls']['下一步']={ 0xffffff, "-3|0|0xe6454a,-11|-7|0xe6454a", 90, 224, 552, 398, 616}
aoc['lls']['登录58速运2']={{51,326,0xe6454a},{227,67,0x333333},{36,83,0xe6454a},}
	aoc['lls']['11位手机号2']={ 0xcdcdd3, "18|-2|0xc7c7cd", 90, 181, 225, 381, 288}
	aoc['lls']['下一步2']={ 0xffffff, "-2|-1|0xeb696d,-3|-24|0xe6454a", 90, 226, 399, 407, 464}
aoc['lls']['右上角x']={ 0x656565, "-9|-9|0x7c7c7c,9|8|0x656565,1|4|0xffffff", 90, 571, 65, 612, 102}
aoc['lls']['请输入验证码']={{421,68,0x333333},{413,68,0xf1f1f1},{36,83,0xe6454a},}
	aoc['lls']['登录按钮']={ 0xfef7f8, "-10|-2|0xe6454a,-13|-26|0xe6454a", 90, 176, 636, 462, 737}
	
aoc['lls']['注册成功']={{559,1066,0xe6454a},{319,146,0xe5454a},{318,205,0xe5454a},{375,153,0xffffff},}


function reg()
	计时 = os.time()
	超时 = math.random(150,200)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif done(aoc['lls']['注册成功'],'注册成功',false,1)then
			toast('注册成功',2)
			delay(10,20)
			return true
		elseif done(aoc['lls']['请输入验证码'],'请输入验证码',false,1)then
			delay(3)
			if 获取 then
				out_time = os.time()
				while (true) do
					if getMessage(id,phone,token)then
						click(369,410)
						input(dxyzm)
						click(443,307)
						获取 = false
						break
					end
					if os.time()-out_time > 60 then
						addBlacklist(id,phone,token)
						return false
					end
				end
			end
			aoc['lls']['用车位置']={{112,587,0xb3b3b3},{316,586,0xe5e5e5},{506,588,0x858585},}
			c_wz = math.random(1,3)
			click(aoc['lls']['用车位置'][c_wz][1],aoc['lls']['用车位置'][c_wz][2])
			if c_pic(aoc['lls']['登录按钮'],'登录按钮',true)then
				delay(2)
				up ={}
				up.mail = idfa
				up.fristname = app_name
				up.lastname = bid_app
				up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
				up.password = ip_address
				up.phone = phone
				up.map = adid
				upFacebook(up)
				delay(2)
			end	
		elseif done(aoc['lls']['登录58速运2'],'登录58速运2',false,1)then
			return false
		elseif done(aoc['lls']['登录58速运'],'登录58速运',false,1)then
			if 取号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['lls']['11位手机号'],'11位手机号',true)then
						input(phone)
						click(443,307)
						delay(1)
						取号 = false
					end
				end
			end
			if c_pic(aoc['lls']['下一步'],'下一步',true)then
				获取 = true
				delay(5)
			end
			
		elseif c_pic(aoc['lls']['右上角x'],'右上角x',true)then
		elseif c_pic(aoc['lls']['使用手机号登录'],'使用手机号登录',true)then
		elseif done(aoc['lls']['菜单界面'],'菜单界面',true,1)then
		elseif c_pic(aoc['lls']['左滑'],'左滑',false)then
			if c_pic(aoc['lls']['立即体验'],'立即体验',true)then
			else
				moveTo(600,400,300,400,50,20)
			end
		end
		mSleep(1000*1)
	end
end

--ALZ()

init(0,"0")
app_name = '58速运'
bid_app = 'daojiasuyun58'
adid = '10104'
id = require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")


initLog("jfq", 1);

function initlogs(txt)
	wLog("jfq",txt);
end


手机键盘={
	{113,751,0x000000},{314,759,0x000000},{539,760,0x000000},
	{117,860,0x000000},{324,858,0xffffff},{551,868,0xffffff},
	{112,964,0xf8f8f8},{319,967,0xffffff},{540,962,0x000000},
	[0]={331,1078,0x000000},}

	
function input_phone(txt)
	for i =1,string.len(txt) do
		nLog(string.sub(txt,i,i))
		phone_mun_input = tonumber(string.sub(txt,i,i))
		click(手机键盘[phone_mun_input][1],手机键盘[phone_mun_input][2],0.25)
	end
end

function GetTask(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jfq_URL.."?"..data_url
	nLog(ALL_url)
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	nLog(res)
	--dialog(res,0)
	nLog('code'..code)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa],0)
		toast(data[idfa],1)
		if tonumber(data[idfa]) == 0 then
			nLog('idfa可用')
			return true
		end
	end
end

function up_active(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jh_URL.."?"..data_url
	nLog(ALL_url)
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	nLog(res)
	--dialog(res,0)
	nLog('code'..code)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa],0)
		toast(data[idfa],1)
		if tonumber(data[idfa]) == 0 then
			nLog('idfa激活成功')
			
			up ={}
			up.mail = idfa
			up.fristname = app_name
			up.lastname = bid_app
			up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
			up.password = ip_address
			up.phone = phone
			up.brithday = '激活成功'
			up.map = adid
			upFacebook(up)
					
			return true
		end
	end
end


function upidfa()
	
	if abl()then
		get_idfa(bid_app)
		
		if VPN()then
			mSleep(1000)
			ip_address = ip()
			toast(ip_address,1)
			if ip_address then
				if GetTask(bid_app,adid,idfa)then
					toast('排重成功',1)
					up ={}
					up.mail = idfa
					up.fristname = app_name
					up.lastname = bid_app
					up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
					up.password = ip_address
					up.map = adid
					upFacebook(up)
					mSleep(1000)
					openURL(app_url)
					return true
				else
					toast('排重失败',1)
				end
			else
				toast('ip-false',1)
			end
		end
	end
	
end


Facebook_url = 'http://onlyonelife.online/Public/facebook/?service=Facebook.add'
function upFacebook(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = Facebook_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	initlogs(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	initlogs(body_resp)
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

aoc={}
aoc['lls']={}
aoc['lls']['左滑']={ 0xe6454a, "-4|0|0xe6454a,0|-4|0xe6454a,0|5|0xe6454a", 90, 294, 1061, 345, 1074}
	aoc['lls']['立即体验']={ 0xda4548, "-18|-28|0xda4548,33|44|0xda4548", 90, 152, 918, 478, 1021}
aoc['lls']['菜单界面']={{561,1089,0xcccccc},{391,1087,0xcccccc},{232,1071,0xcccccc},{88,1075,0xe6454a},}
aoc['lls']['使用手机号登录']={ 0xff0000, "0|-41|0xff0000,-1|45|0xff0000", 90, 226, 115, 434, 273}
aoc['lls']['登录58速运']={{400,68,0x333333},{36,83,0xe6454a},{52,480,0xe6454a},}
	aoc['lls']['11位手机号']={ 0xcdcdd3, "-20|3|0xc8c8ce", 90, 169, 378, 367, 447}
	aoc['lls']['下一步']={ 0xffffff, "-3|0|0xe6454a,-11|-7|0xe6454a", 90, 224, 552, 398, 616}
aoc['lls']['登录58速运2']={{51,326,0xe6454a},{227,67,0x333333},{36,83,0xe6454a},}
	aoc['lls']['11位手机号2']={ 0xcdcdd3, "18|-2|0xc7c7cd", 90, 181, 225, 381, 288}
	aoc['lls']['下一步2']={ 0xffffff, "-2|-1|0xeb696d,-3|-24|0xe6454a", 90, 226, 399, 407, 464}
aoc['lls']['右上角x']={ 0x656565, "-9|-9|0x7c7c7c,9|8|0x656565,1|4|0xffffff", 90, 571, 65, 612, 102}
aoc['lls']['请输入验证码']={{421,68,0x333333},{413,68,0xf1f1f1},{36,83,0xe6454a},}
	aoc['lls']['登录按钮']={ 0xfef7f8, "-10|-2|0xe6454a,-13|-26|0xe6454a", 90, 176, 636, 462, 737}
	
aoc['lls']['注册成功']={{559,1066,0xe6454a},{319,146,0xe5454a},{318,205,0xe5454a},{375,153,0xffffff},}


function reg()
	计时 = os.time()
	超时 = math.random(20,30)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then

		end
		mSleep(1000*1)
	end
end

--ALZ()

init(0,"0")
app_name = '365天体育'
bid_app = 'com.fix.TY'
adid = '10091'
id = 1057
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'

ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_check.php'
ATM_jh_URL = 'http://apiyoumi.kdatm.com/show/query/click_check.php'
app_url = 'https://itunes.apple.com/cn/app/id1287467099?mt=8'

work = 1
while (true) do
	if upidfa()then
		mSleep(1000* math.random(3,5))
		reg()
		up_active(bid,adid,idfa)
	end
	close_VPN()
	delay(2)
end






