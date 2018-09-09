require("tsp")
require("阿波罗")
local sz = require("sz")

	
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


function upidfa(bid_get)
	
	if abl()then
		get_idfa(bid_app)
		
		if VPN()then
			mSleep(1000)
			ip_address = ip()
			--ip_address = '255.255.255.255'
			toast(ip_address,1)
			
			if ip_address then
				if GetTask(bid_get,adid,idfa)then
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


function reg()
	计时 = os.time()
	超时 = math.random(120,150)

	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		else
		
			moveTo(500,500,500,100,50)
			delay(1)
			moveTo(500,500,100,100,50)
			click(math.random(1,1135),math.random(1,640))
			
		end
		mSleep(1000*1)
	end
end

--ALZ()

init('0',0)
app_name = '映客'
bid_app = 'com.meelive.ingkee'
adid = '10116'


token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php'
ATM_jh_URL = 'http://apiyoumi.kdatm.com/show/query/click_check.php'
app_url = 'https://itunes.apple.com/cn/app/id994339518?mt=8'

--[[
回调任务：
http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php?
bid=yingke&idfa=DD4AD0C4-91F2-4106-BF7C-5AC563DDC2C2&source=sz&adid=10116&ip=192.168.5.6

映客https://itunes.apple.com/cn/app/id978985106
--]]

if xz(bid_app)then
	while (true) do
		if upidfa('yingke')then
			mSleep(1000* math.random(3,5))
			reg()
			--up_active(bid_app,adid,idfa)
		end
		close_VPN()
		delay(2)
	end
end





