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
	data_url = 'bid=hssq&idfa='..idfa..'&source=sz&adid='..adid..'&ip='..ip_address
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

function post_url(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = ATM_jfq_URL
	CLICK_TMS = os.time()

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	toast(body_resp,2)
	nLog(body_resp)
	if status_resp == 200 then
		nLog('通讯成功')
		idfadata = cjson.decode(body_resp)
		for k,v in pairs(idfadata) do
			nLog(k..'---'..v)

			if tonumber(v) == 0 then
				log('排重成功')
				return true
			else
				log('排重失败')
				return false
			end

		end

	end
end

function post_idfa(idfa)
	post={}
	post.appid=appid
	post.idfa=idfa
	if post_url(post)then
		up_my_self()
		return true
	end
end


function get_up_active()
	data_url = 'appid=480079300&idfa='..idfa..'&timestamp='..os.time()..'&adid=1'
	ALL_url = upurl..data_url
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


function up_active(bid,adid,idfa)
	data_url = 'bid=hssq&idfa='..idfa..'&appid='..appid..'&adid='..adid..'&ip='..ip_address
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
		
		if false or VPN()then
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
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

function up_my_self()
	up ={}
	up.mail = idfa
	up.fristname = app_name
	up.lastname = bid_app
	up.phone = math.random(10000000000,99999999999)
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = 'passwordss'
	up.map = ip_address
	upFacebook(up)
end



function reg()
	计时 = os.time()
	超时 = math.random(10,15)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then

		else
			click(math.random(50,500),math.random(80,900))
		end
		mSleep(1000*1)
	end
end
--ALZ()

init(0,"0")
app_name = '58同城'
bid_app = 'com.taofang.iphone'
adid = '南京肉刷'
appid = 480079300
id = 1057
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'

ATM_jfq_URL = 'http://data.zttx.net/ztuniq/api.php'
upurl = 'http://asoapi.appubang.com/api/aso_Submit/cpid/10018/?'
--[[
http://asoapi.appubang.com/api/aso_Submit/cpid/10018/?appid=480079300&idfa=__IDFA__&timestamp=__CLICK_TMS__&adid=1
app_url = 'https://itunes.apple.com/cn/app/'
--]]


if xz(bid_app) then

	while (true) do
		
		if abl()then
			if VPN() then
				ip_address = ip()
				get_idfa(bid_app)
				delay(1)
				
				if post_idfa(idfa)then
					mSleep(1000* math.random(5,6))
					reg()
					get_up_active()
				end
			end
			close_VPN()
			delay(2)
			
			
		end
		
	end


end




