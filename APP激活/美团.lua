require("tsp")
require("阿波罗")
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

ddlc={}
ddlc['开屏红点']={ 0xff6666, "5|0|0xff6666,5|5|0xff6666,10|0|0xff6666,5|-4|0xff6666", 90, 260, 1084, 380, 1106}
ddlc['立即体验']={ 0xf2a994, "-23|-29|0xf1a48f,34|31|0xf1a48f,23|-2|0xffffff", 90, 167, 977, 489, 1078}
ddlc['设置手势']={{271,197,0x919293},{300,199,0x8f8f8f},{342,202,0x8f8f8f},{424,16,0x1f1f1f},}
ddlc['红包开']={ 0xffdc66, "6|-4|0xf5a623,5|9|0xffda62", 90, 287, 676, 359, 740}

function reg()
	计时 = os.time()
	超时 = math.random(30,50)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif c_pic(ddlc['红包开'],'红包开',true)then
		elseif done(ddlc['设置手势'],'设置手势',false,1)then
			click(473,989)
		elseif c_pic(ddlc['立即体验'],'立即体验',true)then
		elseif c_pic(ddlc['开屏红点'],'开屏红点',false)then
			moveTo(500,400,200,400,50)
		end
		mSleep(1000*1)
	end
end

--ALZ()

init(0,"0")
app_name = '美团'
bid_app = 'com.meituan.imeituan'
adid = '10070'
id = 1057
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'

ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_check.php'
ATM_jh_URL = 'http://apiyoumi.kdatm.com/show/query/click_check.php'
app_url = 'https://itunes.apple.com/cn/app/id1282318910?mt=8'



if xz(bid_app) then
	while (true) do
		if upidfa()then
			mSleep(1000* math.random(3,5))
			reg()
			up_active(bid,adid,idfa)
			closeApp(bid_app)
		end
		close_VPN()
		delay(2)
	end
end





