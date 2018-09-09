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

function up_active(bid,adid,idfa)
	data_url = 'bid=hssq&idfa='..idfa..'&source=sz&adid='..adid..'&ip='..ip_address
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

aoc={}
aoc['lls']={}
aoc['lls']['马上进入']={ 0x24b383, "34|-7|0x24b383,85|2|0xffffff", 90, 264, 1203, 485, 1266}
aoc['lls']['喜欢的类型']={{386,1179,0x7c7c7d},{378,1213,0xd3d4d6},{382,1142,0xd3d4d6},}
aoc['lls']['喜欢位置']={{193,450,0xc781df},{190,631,0xfa92bd},{195,808,0x97b5de},{188,987,0xffb677},
					{509,446,0x9fc8b7},{506,633,0xfe9089},{511,804,0x7ba5c6},{506,978,0x9ea2a8},}
aoc['lls']['立即进入']={{641,70,0xaaabae},{648,99,0xfafafa},{668,71,0x9a9a9e},}
aoc['lls']['进入首页']={{276,1276,0x23b394},{96,1286,0x414248},{472,1253,0x44454b},{654,1288,0x414248},}


function reg()
	计时 = os.time()
	超时 = math.random(30,50)
	取号 = true
	获取 = false

	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif done(aoc['lls']['进入首页'],'进入首页',false,1)then
			mSleep(math.random(12,15)*1000)
			return true
		elseif done(aoc['lls']['立即进入'],'立即进入',true,1)then
		elseif done(aoc['lls']['喜欢的类型'],'喜欢的类型',false,1)then
			weizi = math.random(1,8)
			click(aoc['lls']['喜欢位置'][weizi][1],aoc['lls']['喜欢位置'][weizi][2])
			done(aoc['lls']['喜欢的类型'],'喜欢的类型',true,1)
		elseif c_pic(aoc['lls']['马上进入'],'马上进入',true)then
		else
			moveTo(500,400,200,400,50)
		end
		mSleep(1000*1)
	end
end

--ALZ()

init(0,"0")
app_name = '书旗小说'
bid_app = 'com.shuqicenter.reader'
adid = '10105'
id = 1057
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'

ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php'
app_url = 'https://itunes.apple.com/cn/app/id733689509?mt=8'


if xz(bid_app) then

	while (true) do
		if upidfa()then
			mSleep(1000* math.random(3,5))
			reg()
			--up_active(bid,adid,idfa)
		end
		close_VPN()
		delay(2)
	end


end




