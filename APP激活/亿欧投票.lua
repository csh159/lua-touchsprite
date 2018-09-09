require("阿波罗")
require("AWZ")
require("ALZ")
require("tsp")

url = 'https://www.iyiou.com/a/innovators2017/vote_detail/id/4858/type/29'

id = 73504
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'

aoc={}
yl = '亿欧'
aoc['lls']={}
aoc['lls']['网页正常打开']={{252,1008,0xf5b551},{175,626,0x00d675},{613,160,0x000e24},}

aoc['lls']['注册界面']={{318,138,0x59caf8},{314,224,0xffffff},{316,915,0xffffff},}
	aoc['lls']['手机号']={ 0x85cdeb, "-2|-21|0x86cdeb,0|-28|0x86ceeb", 90, 157, 494, 265, 551}
	aoc['lls']['完成']={ 0x007aff, "0|-3|0xedf1f3,0|-6|0x007aff", 90, 526, 518, 635, 699}
	aoc['lls']['获取验证码']={ 0xe7e9ed, "-2|-28|0x3ab2e4,-4|-42|0xe7e9ed", 90, 421, 590, 517, 662}
	aoc['lls']['获取验证码_可以']={ 0xeeeeee, "-68|10|0xeeeeee,77|12|0xeeeeee,8|27|0xeeeeee", 90, 380, 583, 571, 664}
	aoc['lls']['验证码']={ 0x81cae8, "6|-24|0x82cae8,-3|-25|0x82cae8", 90, 158, 595, 277, 662}
	aoc['lls']['可以登录按键']={ 0x1e9dd2, "-7|-26|0xeeeeee,-5|25|0xeeeeee", 90, 234, 713, 376, 783}
	aoc['lls']['登录按键']={ 0x31acdf, "3|0|0xeeeeee,3|41|0xe7e9ed,3|-45|0xe7e9ed", 90, 197, 689, 406, 800}
	
aoc['lls']['登录成功']={ 0x575757, "-5|-42|0x575757,-5|-44|0xeeeeee,-4|-86|0x575757", 90, 116, 191, 541, 335}
aoc['lls']['已经投过']={{249,1027,0x4c5462},{173,624,0x00d675},{608,160,0x000e24},}

aoc['lls']['设置密码界面']={{319,280,0x1d9ed2},{314,280,0xeeeeee},{314,283,0xeeeeee},{319,283,0x1d9ed2},}
	aoc['lls']['密码1']={ 0xb2b2b2, "-3|-23|0xb2b2b2,-7|-11|0xb2b2b2", 90, 156, 496, 238, 552}
	aoc['lls']['密码2']={ 0xbababa, "-5|-12|0xb2b2b2,0|-25|0xbababa", 90, 183, 571, 464, 636}
	aoc['lls']['确认密码']={ 0x575757, "9|44|0x575757,9|-42|0x575757,5|-2|0xeeeeee", 90, 156, 732, 456, 863}

aoc['lls']['返回首页']={{476,704,0xf5b551},}
aoc['lls']['投票主页']={ 0xec8928, "0|-24|0x1d9dd1", 90, 625, 753, 637, 1037}
aoc['lls']['国码深维']={ 0x00d675, "-49|18|0x0054a3,72|19|0x0054a3,0|50|0x00d675,11|98|0xfdb730", 90, 17, 87, 609, 620}

aoc['lls']['vote-ok']={{194,793,0xcccccc},{438,796,0xf1b638},{633,941,0x1d9dd1},{629,996,0xec8928},}
aoc['lls']['vote-ok2']={{110,758,0xcccccc},{366,752,0xf1b638},{613,153,0x00050e},}



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
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		nLog('上传成功')
		return true
	end
end


function vote()
	url = 'https://www.iyiou.com/a/innovators2017/vote_detail/id/4858/type/29'
	openURL(url)
	mSleep(1000*3)
	
	local time_line = os.time()
	local used_time = 60 * 3
	
	while (os.time()-time_line<used_time) do
		if done(aoc['lls']['网页正常打开'],'网页正常打开',true,1)then
		elseif done(aoc['lls']['vote-ok'],'vote-ok',true,1)or done(aoc['lls']['vote-ok2'],'vote-ok2',true,1)then
			return true
		elseif c_pic(aoc['lls']['投票主页'],'投票主页',false)then
			if c_pic(aoc['lls']['国码深维'],'国码深维',false)then
				click(x-7,y+276)
			else
				moveTo(w/2,h-200,w/2,h-300,10,20)
			end
		elseif done(aoc['lls']['返回首页'],'返回首页',true,1)then
		elseif done(aoc['lls']['已经投过'],'已经投过',false,1)then
			return true
		end
		mSleep(1000)
	end
end


手机键盘={
	{113,751,0x000000},{314,759,0x000000},{539,760,0x000000},
	{117,860,0x000000},{324,858,0xffffff},{551,868,0xffffff},
	{112,964,0xf8f8f8},{319,967,0xffffff},{540,962,0x000000},
	[0]={331,1078,0x000000},}

	
function input_phone()
	for i =1,string.len(phone) do
		nLog(string.sub(phone,i,i))
		phone_mun_input = tonumber(string.sub(phone,i,i))
		click(手机键盘[phone_mun_input][1],手机键盘[phone_mun_input][2],0.25)
	end
end


function  reg()
	url = 'https://www.iyiou.com/user/login'

	openURL(url)
	mSleep(1000*3)
	取号 = true
	发送 = false
	短信 = false
	password = myRand(4,math.random(6,10))
	
	local time_line = os.time()
	local used_time = 60 * 2
	while (os.time()-time_line<used_time) do
		if done(aoc['lls']['网页正常打开'],'网页正常打开',true,1)then
		elseif c_pic(aoc['lls']['登录成功'],'登录成功',false)then
			toast("注册成功/",1)
			
			up ={}
			up.mail = phone
			up.password = password
			up.phone = phone
			local sz = require("sz")
			up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
			upFacebook(up)
			
			return true
		elseif done(aoc['lls']['已经投过'],'已经投过',false,1)then
			return true
		elseif done(aoc['lls']['设置密码界面'],'设置密码界面',false,1)then
			if c_pic(aoc['lls']['密码1'],'密码1',true)then
				inputword(password)
				c_pic(aoc['lls']['完成'],'完成',true)
			end
			if c_pic(aoc['lls']['密码2'],'密码2',true)then
				inputword(password)
				c_pic(aoc['lls']['完成'],'完成',true)
			end
			if c_pic(aoc['lls']['确认密码'],'确认密码',true)then
				delay(3)
			end
			
		elseif done(aoc['lls']['注册界面'],'注册界面',false,1)then
			
			if 取号 then
				if c_pic(aoc['lls']['手机号'],'手机号',true)then
					if GET_Phone(id,token)then
						input_phone(phone)
						取号 = false
						发送 = true
					end
					c_pic(aoc['lls']['完成'],'完成',true)
				end
			end
			
			if 发送 then
				if c_pic(aoc['lls']['获取验证码_可以'],'获取验证码_可以',true)then
					mSleep(1000*3)
					local out_time = os.time()
					while (true) do
						if getMessage(id,phone,token)then
							if c_pic(aoc['lls']['验证码'],'验证码',true)then
								inputword(dxyzm)
								c_pic(aoc['lls']['完成'],'完成',true)
								break
							end
						end
						if os.time()-out_time > 50 then
							return false
						end
					end
				end
			end
			if c_pic(aoc['lls']['登录按键'],'登录按键',true)then
				delay(1)
			end
			
		else
			nLog('other')
			toast('其它',1)
		end
		mSleep(1000)
	end
end


close_VPN()
--[[]]
while (true) do
	if awzNew()then
		mSleep(1000)
		reName('reg-ing')
		if true or VPN()then
			mSleep(1000)
			if reg()then
				mSleep(1000)
				if vote()then
					reName(phone.."-"..password)
				end
			end
			close_VPN()
		end
	end
end




--]]

for k= 1, 100 do
	if abl()then
		mSleep(1000)
		--reName('reg-ing')
		mSleep(1000)
		if reg()then
			if vote()then
				--reName(phone.."-"..password)
			end
		end
	end
end
























