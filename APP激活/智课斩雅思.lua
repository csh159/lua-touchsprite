require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")



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
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid..'&ip='..ip_address
	ALL_url = ATM_jfq_URL.."?"..data_url
	nLog(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
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
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid..'&ip='..ip_address
	ALL_url = ATM_jh_URL.."?"..data_url
	nLog(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
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
			up.brithday = '注册成功-激活'
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
			--ip_address = '255.255.255.255'
			toast(ip_address,1)
			
			if ip_address then
				if GetTask('myzys',adid,idfa)then
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
					--openURL(app_url)
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


Facebook_url = 'http://test1.oupag.com/Public/facebook/?service=Facebook.add'
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
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

aoc={}
aoc['选择城市']={{369,73,0x000000},{368,75,0xffffff},{59,88,0x3e4247},}
aoc['首页']={{560,1064,0x848c99},{559,1070,0xffffff},{559,1075,0x848c99},{80,1093,0xe6454a},}
aoc['立即登录']={{296,165,0xed584b},{298,165,0xffffff},{300,165,0xee5b4e},{610,81,0xfd844c},}
aoc['登录界面']={{294,70,0x292d33},{298,70,0x292d33},{302,76,0xffffff},{302,78,0x292d33},{62,83,0x3e4247},}
	aoc['输入手机号']={ 0xb2b8c2, "0|8|0xb2b8c2,0|-20|0xb2b8c2", 90, 148, 295, 329, 359}
	aoc['下一步']={ 0xe6454a, "0|-12|0xffffff", 90, 242, 441, 397, 507}
	aoc['登录']={ 0xe6454a, "3|4|0xfffcfc", 90, 268, 563, 401, 631}
aoc['注册成功']={{364,144,0xb9cae2},{370,144,0xb9cae2},{369,156,0xe1ecfe},{589,78,0xfc814c},}


function reg()
	计时 = os.time()
	超时 = math.random(100,150)

	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		else
			moveTo(500,500,500,100,50)
			click(math.random(1,1135),math.random(1,640))
		end
		mSleep(1000*1)
	end
end

--ALZ()

init('0',0)
app_name = '智课斩雅思'
bid_app = 'com.smartstudy.zhanyasi'
adid = '10111'
id = 2102

token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php'
ATM_jh_URL = 'http://apiyoumi.kdatm.com/show/query/click_check.php'
app_url = 'https://itunes.apple.com/cn/app/id897342825?mt=8'

--[[
回调任务：
http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php?bid=myzys&idfa=DD4AD0C4-91F2-4106-BF7C-5AC563DDC2C3&source=sz&adid=10111&ip=192.168.5.6
智课斩雅思
https://itunes.apple.com/cn/app/id1126218840?mt=8

--]]

if xz(bid_app)then
while (true) do
	if upidfa()then
		mSleep(1000* math.random(3,5))
		reg()
		--up_active(bid_app,adid,idfa)
	end
	close_VPN()
	delay(2)
end
end





