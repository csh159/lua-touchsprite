require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")



key_b={
	{113,751,0x000000},{314,759,0x000000},{539,760,0x000000},
	{117,860,0x000000},{324,858,0xffffff},{551,868,0xffffff},
	{112,964,0xf8f8f8},{319,967,0xffffff},{540,962,0x000000},
	[0]={331,1078,0x000000},}

	
function input_phone(txt)
	for i =1,string.len(txt) do
		nLog(string.sub(txt,i,i))
		phone_mun_input = tonumber(string.sub(txt,i,i))
		click(key_b[phone_mun_input][1],key_b[phone_mun_input][2],0.25)
	end
end

function GetTask(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid..'&ip='..ip_address
	ALL_url = ATM_jfq_URL.."?"..data_url
	log(ALL_url)
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

function upidfa()
	
	if abl()then
		if get_idfa(bid_app)then

		
			if vpn_key or VPN()then
				mSleep(1000)
				ip_address = ip()
				toast(ip_address,1)
				if ip_address then
					if GetTask("wjmt",adid,idfa)then
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
	
end

function up_my_self(password)
	up ={}
	up.mail = idfa
	up.fristname = app_name
	up.lastname = bid_app
	--up.phone = math.random(10000000000,99999999999)
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = password
	up.map = adid
	upFacebook(up)
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
	log(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	log(body_resp)
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

aoc={}
aoc['lls']={}
aoc['lls']['进入方式']={{145,578,0x4dbeff},{322,572,0xf0af15},{492,579,0x19d286},}
aoc['lls']['进入游戏']={{306,943,0xfddb62},{396,348,0xdc0000},{233,344,0xdc0000},}
aoc['lls']['进入游戏2']={{267,125,0x65e3fd},{190,66,0xffe33a},{181,228,0xc9ff5d},}
aoc['lls']['创建英雄']={{471,927,0xfcab2d},{280,1026,0xeca81c},{468,93,0x666877},}


function reg()
	计时 = os.time()
	超时 = math.random(180,200)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
			
		elseif done(aoc['lls']['创建英雄'],'创建英雄',true,1)then
			done(aoc['lls']['创建英雄'],'创建英雄',true,2)
		elseif done(aoc['lls']['进入游戏2'],'进入游戏2',false,1)then
			click(331,1014)
		elseif done(aoc['lls']['进入方式'],'进入方式',true,1)then
		else
			click(math.random(50,500),math.random(80,900))
			moveTo(315,921,315,625,10,20)
			delay(math.random(2,4))
			--return true
		end
		mSleep(1000*1)
	end
	
	return true
end


function upload_idfa()
  local sz = require("sz")
  local cjson = sz.json
  local http = sz.i82.http
  headers = {}
  headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
  headers['Referer'] = post_url
  headers_send = cjson.encode(headers)
    
  post = {}
  post['username'] = 'admin'
  post['pass'] = '1234qwer'
  post['ad_id'] = bid_app
  post['appid'] = number_bundler_id
  post['idfa'] = idfa
  post['platform']='people'
  post_send = cjson.encode(post)
  post_escaped = http.build_request(post_send)
  status_resp, headers_resp, body_resp = http.post("http://muser.safoo.com.cn/api/upload_dian_joy_record", 3, headers_send, post_escaped)
  delay(1)
end
--ALZ()

init(0,"0")

app_name = '我叫MT'
bid_app = 'com.yytop.mtby'
adid = '10110'
id = 16649
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
url = 'http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php'
---?bid=hlyy&idfa=DD4AD0C4-91F2-4106-BF7C-5AC563DDC1C9&source=sz&adid=10109&ip=192.168.5.6

ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php'
app_url = 'https://itunes.apple.com/cn/app/id1159563916?mt=8'

vpn_key = false

--[[
回调任务：
http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php?bid=wjmt&idfa=DD4AD0C4-91F2-4106-BF7C-5AC563DDC2C3&source=sz&adid=10110&ip=192.168.5.6
我叫mt：
https://itunes.apple.com/cn/app/id1159563916?mt=8 
--]]


if xz(bid_app)then

	while (true) do

		if upidfa()then
			
			if reg()then
				up_my_self('试完3分钟')
			end
			
		end
		close_VPN()
		delay(2)
	end

end




 





