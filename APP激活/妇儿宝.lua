require("TSLib")
require("tsp")
require("阿波罗")
require("ALZ")



nLog(frontAppBid() )

init('0',0);

appbid = 'com.yuleedu.fuerbao'
zh_path = '/User/Media/TouchSprite/lua/妇儿宝.txt';

ALZ()
id = 69333

p={}
p['妇儿宝']={}


function reg()
	计时 = os.time()
	超时 = 60 * 2
	手机号 = true
	验证码 = true

	p['妇儿宝']['登录界面']={{346,68,0x090909},{343,71,0xffffff},{352,81,0x010101},{153,706,0xff6174},}	--4
	p['妇儿宝']['注册界面']={{348,68,0x000000},{353,80,0xf3f3f3},{353,81,0x000000},{18,83,0x000000},}
		p['妇儿宝']['手机号']={ 0xc7c7cd, "0|-10|0xc7c7cd,0|-15|0xffffff,0|-26|0xc7c7cd", 90, 311, 422, 446, 473}	--(319,157)
		p['妇儿宝']['获取验证码']={ 0xffffff, "-3|-3|0xff6174,11|-12|0xff6174", 90, 520, 495, 546, 537}
		p['妇儿宝']['短信验证码']={ 0xc7c7cd, "6|-14|0xc7c7cd,6|-21|0xffffff,2|-26|0xc7c7cd", 90, 171, 491, 313, 540}
		p['妇儿宝']['输入密码']={ 0xc7c7cd, "-1|-24|0xffffff,-1|-28|0xc7c7cd", 90, 147, 558, 390, 612}
		p['妇儿宝']['确定']={ 0xffffff, "4|-5|0xff6174,4|-8|0xfff6f7,4|-21|0xff6174", 90, 261, 669, 375, 733}
		p['妇儿宝']['登录成功']={{384,68,0xff6174},{334,62,0xffffff},{334,63,0xff6174},{295,65,0xff6174},}

	while (os.time()-计时<超时) do
		if active(appbid,5) then
		elseif done(p['妇儿宝']['登录成功'],'登录成功',false,4)then
			toast('注册成功',1)
			return true
		elseif done(p['妇儿宝']['注册界面'],'注册界面',false,4)then
			
			if 手机号 then
				if GET_Phone(id,token)then
					if c_pic(p['妇儿宝']['手机号'],'手机号',true)then
						input(phone)
						mSleep(1000)
						click(w/2,150)
						手机号 = false
					end
				end
			end
			
			if 手机号 == false then
				if c_pic(p['妇儿宝']['输入密码'],'输入密码',true)then
					password = myRand(4,math.random(6,10))
					input(password)
					click(w/2,150)
				end
				if c_pic(p['妇儿宝']['获取验证码'],'获取验证码',true)then
					delay(3)
					out_time = os.time()
					while (true) do
						if getMessage(id,phone,token)then
							if c_pic(p['妇儿宝']['短信验证码'],'短信验证码',true)then
								input(dxyzm)
								click(w/2,150)
								break
							end
						end
						if os.time()-out_time > 65 then
							addBlacklist(id,phone,token)
							return false
						end
					end
				end
				mSleep(1000* 3)
				if c_pic(p['妇儿宝']['确定'],'提交确定',true)then
					writeFile(zh_path,'妇儿宝'..'----'..phone..'----'..password)
					closeX(appbid)
					mSleep(1000*2)
				end
			end
			
		elseif done(p['妇儿宝']['登录界面'],'登录界面',true,4)then
		end
		mSleep(500)
	end
end
reg()






























