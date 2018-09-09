require("tsp")
require("阿波罗")
require("玉米对接")
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

			if VPN()then
				mSleep(1000)
				ip_address = ip()
				toast(ip_address,1)
				if ip_address then
					if GetTask("hlyy",adid,idfa)then
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

function up_my_self(text)
	up ={}
	up.mail = idfa
	up.fristname = app_name
	up.lastname = bid_app
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = password
	up.map = text
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
aoc['lls']['新手奖励界面']={{571,615,0xf79d10},{621,424,0xf8fb63},{670,45,0xf73ebf},}
aoc['lls']['注册界面']={{414,138,0xe7f2ff},{937,141,0xfd495a},{955,141,0xffffff},}
	aoc['lls']['请输入手机号']={ 0xb8b9c2, "0|9|0xbab8c2,0|-12|0xb7b8c2", 90, 631, 222, 823, 275}
	aoc['lls']['发验证码']={ 0xedfeed, "4|-5|0x6cdc25", 90, 838, 308, 887, 343}
	aoc['lls']['密码']={ 0xabafb9, "0|-10|0xaaaeba,4|-19|0xa3a5b0", 90, 844, 386, 912, 521}
	aoc['lls']['输入验证码']={ 0xc7c9cf, "-1|-10|0xacaeba,-2|12|0xb5b6c0", 90, 569, 301, 738, 356}
	aoc['lls']['注册']={ 0xfefaf1, "1|-7|0xe2820c,1|-13|0xffffff", 90, 595, 549, 729, 610}
aoc['lls']['注册弹窗']={{553,682,0xf79e10},{1259,57,0xfb465a},{469,208,0xfff700},}

aoc['lls']['游戏注册主界面']={{660,699,0xfefcca},{847,20,0x3de394},{187,91,0xc42210},}
aoc['lls']['注册成功']={{672,508,0xf69c10},{890,208,0xfb4559},{906,205,0xffffff},{534,388,0xfac305},}

aoc['tips']={}
aoc['tips']['cheakall']={{670,512,0xf79c0d},{571,501,0xf7a410},{440,198,0xf1faff},{446,198,0x0f346e},}
aoc['tips']['重试']={{794,521,0xf79e10},{541,524,0x0ba2ec},{441,193,0xfcfdff},{446,193,0x0e3473},}
aoc['tips']['正在更新']={{301,648,0x183d96},{303,648,0xfeee3d},{796,266,0xdef7ff},{652,262,0xdff7ff},}

function reg()
	计时 = os.time()
	超时 = math.random(150,200)
	取号 = true
	发验证码 = false
	短信 = false
	注册提交 = false
	
	password = myRand(4,9)
	第一次启动 = true
	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif 第一次启动 and done(aoc['lls']['新手奖励界面'],'新手奖励界面')then
			closeX(bid_app)
			第一次启动 = false
		elseif done(aoc['lls']['注册成功'],'注册成功',true,1)then
			return true
		elseif done(aoc['lls']['注册弹窗'],'注册弹窗',true,1)then
		elseif done(aoc['lls']['游戏注册主界面'],'游戏注册主界面',true,1)then
		elseif done(aoc['lls']['注册界面'],'注册界面')then
			if 取号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['lls']['请输入手机号'],'请输入手机号',true)then
						input(phone)
						click(1238,126)
						up_my_self('准备注册')
					end
					取号 = false
					发验证码 = true
				end
			end
			
			if 发验证码 then
				if c_pic(aoc['lls']['发验证码'],'发验证码',true)then
					发验证码 = false
					短信 = true
					delay(5)
				end
			end
			
			if c_pic(aoc['lls']['密码'],'密码',true)then
				input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input(password)
				click(1238,126)
			end
			
			if c_pic(aoc['lls']['密码'],'密码',true)then
				input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input(password)
				click(1238,126)
			end
			
			if 短信 then
				mSleep(1000*3)
				local out_time = os.time()
				while (true) do
					if getMessage(id,phone,token)then
						if c_pic(aoc['lls']['输入验证码'],'输入验证码',true)then
							input(SMS)
							短信 = false
							注册提交 = true
							click(1238,126)
							break
						end
					end
					if os.time()-out_time > 50 then
						return false
					end
				end
			end
			
			if 注册提交 then
				if c_pic(aoc['lls']['注册'],'注册',true)then
					up_my_self('提交注册')
					delay(1)
				end
			end
			
		
		elseif done(aoc['lls']['新手奖励界面'],'新手奖励界面',true,1)then
			
	
		else
			log('other')
			if done(aoc['tips']['cheakall'],'cheakall',true,1)then
				return false
			elseif done(aoc['tips']['重试'],'重试',true,1)then
			elseif done(aoc['tips']['正在更新'],'正在更新',true,1)then
			end
		end
		mSleep(1000*1)
	end
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


init("0",1)
app_name = '蓝洞游戏'
bid_app = 'com.ldyx.ngames'
adid = '棋牌游戏'
id = 69491
id = 10931 --玉米
--token = '20801571-3b8c-4fcb-be16-5da3d5633c60'



if xz(bid_app)then
	while (true) do
		if VPN()then
			if abl()then
				if get_idfa(bid_app)then
					if reg()then
						up_my_self('注册成功')
					end
				end
			end
		end
		close_VPN()
		delay(2)
	end
end









