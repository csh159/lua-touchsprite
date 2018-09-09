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

function GetTask(bid,adid,idfa,ip_address)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid..'&ip='..ip_address
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

function upidfa()
	
	if abl()then
		get_idfa(bid_app)
		ATM_jfq_URL = 'http://api.kdatm.com/show/query/idfa_check2.php'
		app_url = 'https://itunes.apple.com/cn/app/id427457043?mt=8'
		
		if VPN()then
			mSleep(1000)
			ip_address = ip()
			toast(ip_address,1)
			if ip_address then
				if GetTask('com.yihaodian.onethestore',adid,idfa,ip_address)then
					toast('排重成功',1)
					up ={}
					up.mail = idfa
					up.fristname = app_name
					up.lastname = bid_app
					--up.phone = math.random(10000000000,99999999999)
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
aoc['lls']['地址选择']={{35,81,0xff3c25},{20,82,0xff3c25},}


function reg()
	计时 = os.time()
	超时 = math.random(100,150)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif done(aoc['lls']['地址选择'],'地址选择',true,1)then
		else
			moveTo(w/2,800,w/2,500,10,20)
			delay(math.random(5,15))
		end
		mSleep(1000*1)
	end
end

--ALZ()
init(0,"0")
app_name = '1号店'
bid_app = 'com.yihaodian.onethestore'
adid = '10005'
id = 16649
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'

while (true) do
	if upidfa()then
		mSleep(1000* math.random(10,15))
		reg()
	end
	close_VPN()
	delay(2)
end










