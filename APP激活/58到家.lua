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
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jfq_URL.."?"..data_url
	nLog(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	nLog(res)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
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
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	nLog(res)
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
			
			ip_address = '255.255.255.255'
			--ip_address = ip()
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
aoc['选择地址']={{466,97,0x000000},{459,78,0x000000},{456,78,0xffffff},{452,90,0x101010},{452,89,0xfafafa},}
	aoc['登录按钮']={ 0xe7474c, "-1|-16|0xe7454a,-1|-14|0xffffff", 90, 560, 452, 702, 581}
aoc['登录界面']={{396,73,0xffffff},{398,73,0x292d33},{61,84,0x3e4247},{61,77,0xffffff},}
	aoc['输入手机号']={ 0xb2b8c2, "0|13|0xb2b8c2,0|-14|0xb2b8c2", 90, 258, 289, 354, 354 }
	aoc['下一步']={ 0xfcecec, "0|-4|0xe6454a,-22|-11|0xffffff", 90, 301, 439, 441, 507 }
	aoc['登录']={ 0xffffff, "0|-4|0xe6454a,-1|-18|0xffffff", 90, 330, 561, 422, 624 }
aoc['注册成功']={{364,144,0xb9cae2},{370,144,0xb9cae2},{369,156,0xe1ecfe},{589,78,0xfc814c},}


function reg()
	计时 = os.time()
	超时 = 100
	取号 = true
	短信 = false
	登录 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif 登录 and done(aoc['选择地址'],'选择地址',false,1)then
			delay(3)
			return true
		elseif done(aoc['登录界面'],'登录界面')then
			if 取号 then
				if c_pic(aoc['输入手机号'],'输入手机号',true)then
					if GET_Phone(id,token)then
						input(phone)
						delay(1)
						取号 = false
					end
				end
			end
			
			if c_pic(aoc['下一步'],'下一步',true)then
				短信 = true
			end
			
			if 短信 then
				out_time = os.time()
				while (true) do
					if getMessage(id,phone,token)then
						input(dxyzm)
						短信 = false
						登录 = true
						break
					end
					if os.time()-out_time > 60 then
						addBlacklist(id,phone,token)
						return false
					end
				end
			end
			
			if 登录 and c_pic(aoc['登录'],'登录',true)then
				up ={}
				up.mail = idfa
				up.fristname = app_name
				up.lastname = bid_app
				up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
				up.password = ip_address
				up.phone = phone
				up.brithday = '注册成功'
				up.map = adid
				upFacebook(up)
			end
				
		elseif done(aoc['选择地址'],'选择地址')then
			c_pic(aoc['登录按钮'],'登录按钮',true)
		end
		mSleep(1000*1)
	end
end



function maps(经度,纬度)
	fakeGPS(经度, 纬度)
end

city = {}
city[1] = { 39.9190844444,116.1979293823}	--北京
city[2] = { 31.1916580039,121.4332580566}	--上海
city[3] = { 23.0986810235,113.2649230957}	--广州
city[4] = { 22.5455376640,114.0490722656}	--深圳
city[5] = { 32.0371841914,118.7992858887}	--南京

--ALZ()

init(0,"0")
app_name = '58到家'
bid_app = 'liveHelper'
adid = '10104'
id = 2102

token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_check.php'
ATM_jh_URL = 'http://apiyoumi.kdatm.com/show/query/click_check.php'
app_url = 'https://itunes.apple.com/cn/app/id897342825?mt=8'


if xz(bid_app)then
	while (true) do
		if upidfa()then
			maps_mun = math.random(1,5)
	--		maps(city[maps_mun][2]+(math.random(-5,5)/10),city[maps_mun][1]+(math.random(-5,5)/10))
			if reg()then
				up_active(bid,adid,idfa)
			end
		end
		close_VPN()
		delay(2)
	end
end






















