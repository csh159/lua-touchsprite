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

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	nLog(body_resp)
	if status_resp == 200 then
		nLog('通讯成功')
		local json = sz.json
		res = json.decode(body_resp)
		
		if res[idfa] == "0" then
			log('排重成功')
			return true
		else
			log('排重失败')
		end
	end
end

function post_idfa(idfa)
	post={}
	post.appid='597364850'
	post.idfa=idfa
	if post_url(post)then
		up_my_self()
		return true
	end
end

function up_active(bid,adid,idfa)
	data_url = 'bid=hssq&idfa='..idfa..'&appid=597364850&adid='..adid..'&ip='..ip_address
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
			--ip_address = '10.10.10.1'
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

function up_my_self()
	up ={}
	up.mail = idfa
	up.fristname = app_name
	up.lastname = bid_app
	--up.phone = math.random(10000000000,99999999999)
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = math.random(10000000000,99999999999)
	up.map = adid
	upFacebook(up)
end


aoc={}
aoc['lls']={}
aoc['lls']['开始学习']={{200,1053,0x4fcb19},{438,1057,0x4fcb19},}
aoc['lls']['注册界面']={{77,103,0x787878},{384,933,0x616161},{245,915,0x616161},{544,92,0xf2f2f2},}
	aoc['lls']['手机号']={ 0xcccccc, "0|-20|0xcccccc,0|-28|0xcccccc", 90, 200, 326, 450, 381}
	aoc['lls']['获取验证码']={ 0x4fcb19, "", 90, 263, 460, 375, 487}
aoc['lls']['验证码界面']={{76,103,0x787878},{381,172,0x212121},}
aoc['lls']['注册成功']={{187,822,0x4fcb19},{458,823,0x4fcb19},{328,1005,0x474747},}
aoc['lls']['APP界面']={{52,69,0x979797},{335,71,0x757575},{574,64,0x979797},}
	aoc['lls']['第一页']={{168,493,0x363535},{466,511,0x653927},}
	aoc['lls']['第二页']={{170,389,0x5c3f34},{477,381,0x5e4841},{163,633,0xaa706c},{446,664,0xf7bfad},}
	aoc['lls']['第三页']={{113,296,0xed6768},{309,293,0xfbb84d},}
	aoc['lls']['暂停']={{57,57,0x787878},{74,59,0x787878},}	--264,490
	aoc['lls']['小姐姐']={{303,923,0x4fcb19},{303,859,0x4fcb19},{90,892,0x4fcb19},{542,898,0x4fcb19},}
	
兴趣={{112,318,0xffffff},{413,311,0xffffff},{526,315,0xffffff},{180,477,0xffffff},{321,478,0xffffff},
				{521,482,0x23c4bc},{104,630,0xeb5f6f},{311,623,0xffeee0},{526,634,0xffffff},{122,797,0xb6e3d6},
				{324,798,0xffffff},{520,787,0xffffff},
				}	

function reg()
	计时 = os.time()
	超时 = math.random(60,100)
	取号 = true
	获取 = false
	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		else
			moveTo(500,300,200,300,50)
		end
		mSleep(1000*1)
	end
end
--ALZ()

init(0,"0")
app_name = '河豚直播'
bid_app = 'com.hetun.live'
adid = '淮安'
id = 1057

if xz(bid_app) then

	while (true) do
		if abl()then
			if VPN()then
				get_idfa(bid_app)
				delay(1)
				reg()
				up_my_self()
			end
		end
	end
end














