require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")



key_word={
	{113,751,0x000000},{314,759,0x000000},{539,760,0x000000},
	{117,860,0x000000},{324,858,0xffffff},{551,868,0xffffff},
	{112,964,0xf8f8f8},{319,967,0xffffff},{540,962,0x000000},
	[0]={331,1078,0x000000},}

	
function input_phone(txt)
	for i =1,string.len(txt) do
		nLog(string.sub(txt,i,i))
		phone_mun_input = tonumber(string.sub(txt,i,i))
		click(key_word[phone_mun_input][1],key_word[phone_mun_input][2],0.25)
	end
end

function up_my_self()
	up ={}
	up.mail = idfa
	up.fristname = key
	up.lastname = bid_app
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = "password"
	up.map = key_mun
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
aoc['home']={{76,1277,0xfa1f41},{226,1280,0xffffff},{524,1279,0xffffff},{676,1273,0x9197a3},}--4我
aoc['手机']={ 0xffffff, "0|-6|0x28be7d,-1|-46|0x48c586,-16|-31|0x48c586", 90, 30, 78, 710, 305}
aoc['登录界面']={{510,1216,0xe42429},{374,1218,0xf9ae08},{216,1223,0x48d851},}
	aoc['手机号']={ 0xbfc3ca, "0|-25|0xbfc3ca,0|-20|0xbdc1c9", 90, 104, 323, 199, 389}
	aoc['发送验证码']={ 0x505050, "3|-12|0x505050,2|-23|0x505050", 90, 505, 502, 608, 551}
	aoc['验证码']={ 0xbdc1c9, "-4|-14|0xbdc1c9,1|-26|0xbdc1c9", 90, 106, 495, 209, 561}
	aoc['进入西瓜视频']={ 0xffffff, "-3|0|0xfa1f41,-6|-26|0xfa1f41", 90, 252, 643, 504, 720}
	--(505,178) 点击取消位置
aoc['验证码错误']={ 0x007aff, "244|-1|0x1b84fc,325|-5|0x007aff", 90, 138, 655, 607, 763}

aoc['在线答题']={{370,1267,0x9426a6},{421,1267,0xffd017},}
aoc['填写邀请码']={{618,1130,0xfc316c},{437,1128,0xfc316c},{173,1133,0xfc316c},}
aoc['填写邀请码2']={{639,1058,0xfc316c},{161,1054,0xffffff},{175,1054,0xfc316c},{390,1050,0xfc316c},}
aoc['填写码']={ 0xfc316c, "136|23|0xfc316c,-54|59|0xfc316c", 90, 365, 986, 710, 1301}

aoc['输入回车']={ 0xffffff, "-25|-26|0x734df2,10|26|0x734df2", 90, 597, 565, 742, 915}
aoc['成功复活']={{297,1130,0xffffff},{299,1129,0x4b4369},{297,1144,0xffffff},{297,1146,0x4b4369},}
aoc['成功复活2']={{297,1059,0xffffff},{299,1059,0x4b4369},{293,1059,0x4b4369},{296,1071,0xffffff},}

aoc['自动进入']={{38,44,0xffffff},{133,33,0xadbdcd},{588,40,0xfc316c},}
aoc['正在直播']={{38,43,0xffffff},{131,33,0xfc316c},{129,44,0xffffff},}
aoc['正在直播2']={{38,43,0xffffff},{131,35,0xadbdcd},{131,42,0xffffff},}
aoc['提现界面']={{39,83,0xffffff},{99,649,0xfc316c},{419,641,0xfc316c},}
aoc['提现帮助']={{38,83,0x2f3d48},{49,82,0xffffff},{50,70,0x2f3d48},}
aoc['百万答题']={{447,1080,0xfc316c},{69,1089,0xfc316c},{575,169,0xffd22a},}
aoc['该号做废']={{608,1202,0xffce00},{455,1196,0xf9ae08},{281,1202,0x35c020},{118,1185,0xff7612},}
aoc['登录失败']={{238,861,0x06b773},{375,849,0xe53935},{375,843,0xf9ae08},{514,844,0xe53935},}


function crad()
	计时 = os.time()
	超时 = math.random(60,90)
	复活卡 = false
	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif done(aoc['该号做废'],'该号做废',false,1)then
			addBlacklist(id,phone,token)
			return false
		elseif done(aoc['登录失败'],'登录失败',false,1)then
			return false
			
		elseif 复活卡 and done(aoc['填写邀请码2'],'填写邀请码2',false,1)then
			if done(aoc['成功复活2'],'成功复活->上')then
				return true
			end
		elseif 复活卡 and done(aoc['填写邀请码'],'填写邀请码',false,1)then
			if done(aoc['成功复活'],'成功复活')then
				return true
			end

		elseif c_pic(aoc['输入回车'],'输入回车',false)then
			input(key)
			if c_pic(aoc['输入回车'],'输入回车',true)then
				复活卡 = true
			end
		
		elseif done(aoc['填写邀请码'],'填写邀请码',true,1)then
		elseif done(aoc['填写邀请码2'],'填写邀请码->上',true,1)then
		elseif c_pic(aoc['填写码'],'填写码',true)then
		elseif done(aoc['在线答题'],'在线答题',true,1)then
		elseif done(aoc['自动进入'],'自动进入',true,1)then
			click(263,747)
		elseif done(aoc['正在直播'],'正在直播',true,1)then
			click(263,747)
		elseif done(aoc['正在直播2'],'正在直播',true,1)then
			click(263,747)
		elseif done(aoc['提现界面'],'提现界面',true,1)then
			closeApp(bid_app)
			delay(1)
		elseif done(aoc['提现帮助'],'提现帮助',true,1)then
		elseif done(aoc['百万答题'],'百万答题',false,1)then
			return false		

		else
			log('other')
			click(690,59)
		end
		mSleep(1000*2)
	end
	
end


function reg()
	计时 = os.time()
	超时 = math.random(90,100)
	取号 = true
	验证码 = false
	短信 = false
	登录 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif done(aoc['登录界面'],'登录界面',false)then
			if 取号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['手机号'],'手机号',true)then
						input(phone)
						click(505,178)
						取号 = false
						验证码 = true
					end
				end
			elseif 验证码 then
				if c_pic(aoc['发送验证码'],'发送验证码',true)then
					验证码 = false
					短信 = true
					delay(5)
					click(505,178)
				end
			elseif 短信 then
				mSleep(1000*3)
				local out_time = os.time()
				while (true) do
					if getMessage(id,phone,token)then
						if c_pic(aoc['验证码'],'验证码',true)then
							input(dxyzm)
							click(505,178)
							短信 = false
							登录 = true
							break
						end
					end
					if os.time()-out_time > 60 then
						return false
					end
					log('收短信')
				end
			elseif 登录 then
				if c_pic(aoc['进入西瓜视频'],'进入西瓜视频',true)then
					delay(5)
					return true
				end
			end
			
		elseif c_pic(aoc['手机'],'手机',true)then
		elseif done(aoc['home'],'home',true,4)then
		elseif c_pic(aoc['验证码错误'],'验证码错误',true)then
			return false
		end
		mSleep(1000*1)
	end
	
end


init(0,"0")
app_name = '西瓜视频'
bid_app = 'com.ss.iphone.article.Video'
adid = '南京'
id = 59530
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
--key = key or 'ZCSPN'
get_mun = tonumber(get_mun)
get_mun = get_mun or 5




dialog("复活码: "..key.."\n复活卡张数: "..get_mun, 2)
key_mun  = 0
while (true) do
	log("开始注册")
	if key_mun < get_mun then
		if abl() then
			if get_idfa(bid_app)then
				if true or VPN()then

					if reg() then
						if crad()then
							key_mun = key_mun + 1
							up_my_self()
						end
					end

					close_VPN()
					delay(2)
				end
			end
		end
	else
		break
	end
	log("一个轮回")
end

dialog("复活码: "..key.."\n复活卡张数: "..get_mun.."\n任务完成", 10)


























