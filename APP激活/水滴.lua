require("tsp")
require("ALZ")
require("阿波罗")




init('0',0);
appbid = 'tv.lion.shuidi';

--爱乐赞id 取手机号用
id = 29867
app_name = '水滴'		--星光直播马甲
--ALZ()
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
account_path = '/User/Media/TouchSprite/lua/'..app_name..'.txt';


aoc={}
aoc['lls']={}
aoc['lls']['启动页'] = { 0x7834b7, "20|2|0x7834b7,29|2|0xffffff,31|2|0x7834b7", 90, 315, 920, 624, 1032}
aoc['lls']['登录界面']={{537,504,0xff0071},{83,501,0xff0071},{21,83,0x333333},}
	aoc['lls']['注册']={ 0xff0071, "6|0|0xff0071", 90, 56, 581, 180, 599}
	
aoc['lls']['注册界面']={{347,72,0xff0071},{348,82,0xff0071},{345,85,0xffe8f2},{346,85,0xff0071},}
	aoc['lls']['手机号']={ 0xacacac, "0|-16|0xacacac,2|6|0xb6b6b6", 90, 350, 236, 380, 283}
	aoc['lls']['验证']={ 0xff0071, "-1|-17|0xff0071", 90, 461, 323, 574, 381}
	aoc['lls']['验证码']={ 0xaaaaaa, "0|5|0xacacac", 90, 259, 325, 304, 381}
	aoc['lls']['下一步']={ 0xff0071, "21|5|0xffffff", 90, 242, 442, 407, 496}
--
	aoc['lls']['昵称']={ 0xb6b6b6, "7|-11|0xc7c7c7", 90, 218, 232, 277, 281}
	aoc['lls']['密码']={ 0xaaaaaa, "-1|5|0xacacac", 90, 204, 327, 273, 379}
	aoc['lls']['sex']={{231,448,0xffffff},{376,451,0xffffff},}
	aoc['lls']['下一步2']={ 0xff0071, "-3|-13|0xffffff", 90, 259, 503, 375, 562}
	
aoc['lls']['不允许']={ 0x007aff, "", 90, 155, 649, 214, 698}

--注册往返
function reg()
	计时 = os.time()
	超时 = 60 * 3
	取号 = true
	验证 = true
	取短信 = true
	填资料 = true
	apppassword = myRand(4,math.random(8,12))
	--------
	while os.time()-计时<超时 do
		if active(appbid,3)then
			
		elseif 填资料 and done(aoc['lls']['注册界面'],'注册界面',false,1)then
			if c_pic(aoc['lls']['昵称'],'昵称',true)then
				input(myRand(7,math.random(2,3)))
				click(w/2,162)
			end
			if c_pic(aoc['lls']['密码'],'密码',true)then
				input(apppassword)
				click(w/2,162)
			end
			sex_c = math.random(1,2)
			click(aoc['lls']['sex'][sex_c][1],aoc['lls']['sex'][sex_c][2])
			if c_pic(aoc['lls']['下一步2'],'下一步2',true)then
				writeFile(account_path,phone.."|"..apppassword.."水滴")
				return true
			end
			
		elseif done(aoc['lls']['注册界面'],'注册界面',false,1)then
			if 取号 then
				if c_pic(aoc['lls']['手机号'],'手机号',true)then
					if GET_Phone(id,token)then
						取号 = false
						input(phone)
						click(w/2,162)
					end
				end
			elseif 验证 then
				if c_pic(aoc['lls']['验证'],'验证',true)then
					验证 = false
				end
			elseif 取短信 then
				if getMessage(id,phone,token)then
					mSleep(1000)
					if c_pic(aoc['lls']['验证码'],'验证码',true)then
						input(dxyzm)
						click(w/2,162)
						取短信 = false
					end
				else
					mSleep(1000*3)
				end
			elseif c_pic(aoc['lls']['下一步'],'下一步',true)then
				mSleep(1000*5)
				填资料 = true
			else
				mSleep(1000*3)
			end
			
			
		elseif done(aoc['lls']['登录界面'],'登录界面',false,1)then
			c_pic(aoc['lls']['注册'],'注册',true)
		elseif c_pic(aoc['lls']['启动页'],'启动页',true)then
			

		end

	end
end

					
reg()





















































