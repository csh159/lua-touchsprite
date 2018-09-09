require("tsp")
require("阿波罗")
require("ALZ")
require("AWZ")
local sz = require("sz")

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

function up_my_self(password,bid_app)
	up ={}
	up.mail = phone
	up.fristname = app_name
	up.lastname = bid_app
	--up.phone = math.random(10000000000,99999999999)
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = password
	up.map = adid
	upFacebook(up)
end


cy={}
cy['登录界面']={ 0xddbc7f, "1|-38|0xddbc7f,73|-47|0xffffff,96|-62|0xddbc7f,184|-36|0xddbc7f", 90, 102, 221, 705, 594}
	cy['注册按钮']={ 0x666666, "0|-11|0x666666,0|10|0x666666,-14|9|0x676767", 90, 624, 100, 746, 370}
	
cy['注册界面']={ 0x666666, "655|40|0x666666", 90, 7, 137, 741, 250}	
	cy['手机号']={ 0xc1c1c1, "0|-29|0xc1c1c1", 90, 64, 403, 177, 469}
	cy['获取验证码']={ 0xd3b669, "1|-20|0xd4b86d,1|-30|0xd3b669", 90, 506, 502, 710, 601}
	cy['验证码']={ 0xc1c1c1, "-2|-27|0xc1c1c1", 90, 59, 540, 159, 601}
	cy['密码']={ 0xc1c1c1, "0|-7|0xc1c1c1,0|-27|0xc1c1c1,24|-27|0xc1c1c1", 90, 62, 660, 279, 888}
	cy['注册']={ 0xffffff, "-1|-7|0xd3b669,-1|-11|0xffffff", 90, 278, 1001, 495, 1083}
	cy['完成']={ 0x007aff, "0|-2|0xf0f1f2,0|-5|0x007aff", 90, 643, 652, 747, 934}
cy['注册成功']={ 0xca0d0e, "2|-6|0xd10c0d", 90, 20, 526, 725, 820}


function reg()
	计时 = os.time()
	超时 = 120
	取号 = true
	获取验证 = false
	获取 = false
	提交 = false
	cy_password =  'aa11223344'    --myRand(4,math.random(8,10))  --
	
	while (os.time()-计时<超时) do
		if c_pic(cy['注册成功'],'注册成功',false)then
			up_my_self(cy_password,'验证成功')
			return true
		elseif c_pic(cy['注册界面'],'注册界面',false)then
			delay(3)
			
			if 取号 then
				if GET_Phone(id,token)then
					if c_pic(cy['手机号'],'手机号',true)then
						input(phone)
						c_pic(cy['完成'],'完成',true)
						取号 = false
						获取验证 = true
					end
				end
			end
			
			if 获取验证 then
				if c_pic(cy['获取验证码'],'获取验证码',true)then
					获取验证 = false
					获取 = true
				end
			end
			
			if c_pic(cy['密码'],'密码',true)then
				input(cy_password)
				c_pic(cy['完成'],'完成',true)
			end
			
			if c_pic(cy['密码'],'密码',true)then
				input(cy_password)
				c_pic(cy['完成'],'完成',true)
			end
			
			if 获取 then
				mSleep(1000*3)
				local out_time = os.time()
				while (true) do
					if getMessage(id,phone,token)then
						if c_pic(cy['验证码'],'验证码',true)then
							input(dxyzm)
							c_pic(cy['完成'],'完成',true)
							break
						end
					end
					if os.time()-out_time > 50 then
						return false
					end
				end
				获取 = false
				提交 = true
			end
			
			if 提交 and c_pic(cy['注册'],'注册',true)then
				up_my_self(cy_password,'first')
			end
			
		elseif c_pic(cy['登录界面'],'登录界面',false)then
			c_pic(cy['注册按钮'],'注册',true)
		else
			log('tips')
		end
		mSleep(1000*1)
	end
end



url1 = 'https://m.changyoyo.com/auth/loginbysms.html?channel_source=02001793'
url2 = 'https://m.changyoyo.com/auth/loginbysms.html?channel_source=02001792'

id = 64525
app_name = '畅由'
adid = 64525
bid_app = '浏览器'
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'



while (true) do
	if true or VPN()then
		if awzNew()then
			openURL(url1)
			reg()
		end
		close_VPN()
		delay(2)
	end
end












