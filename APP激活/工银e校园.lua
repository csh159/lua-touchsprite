--require("TSLib")
require("tsp")
require("阿波罗")
require("SH")

nLog(frontAppBid())


init('0',0);
appbid = 'com.icbc.university';

--爱乐赞id 取手机号用
id = 18446
ItemId = 2838
app_name = '工银e校园'

path = {
	[1] = '/User/Media/TouchSprite/lua/'..app_name..'.txt',
	}

page={}
page['e']={}

--注册往返
function reg()
	Time_line = os.time()
	Time_out = 60 * 3
	get_Phone = true
	get_Message = false
	登录 = false
	e_username = myRand(4,math.random(8,12))
	e_password = myRand(4,math.random(9,12))
	e_mail = myRand(5,math.random(8,10),2)

	--------
	page['e']['screen']={ 0xfa0200, "-8|0|0xfa0200,8|0|0xfa0200,-1|-8|0xfa0200", 90, 259, 941, 379, 977}
	
	page['e']['登录界面']={{463,1082,0x63aaf5},{527,471,0xfe7d7e},{340,81,0xf53645},}--1:自助注册,2:登录,3:辅助
	page['e']['自助界面']={{536,820,0x66ccff},{120,184,0x9fd367},{251,911,0xff7b7b},}--1:此处
	page['e']['填写信息界面']={{355,90,0x607483},{358,90,0xffffff},{390,85,0x607483},}
		page['e']['右下完成']={ 0x007aff, "6|7|0xf0f1f2,9|8|0x027bff,22|4|0x007aff", 90, 532, 449, 631, 829}
		
		page['e']['用户名']={ 0xc0cbcb, "3|-19|0xffffff,3|-23|0xc1cccc,19|-1|0xc0cbcb", 90, 385, 168, 594, 226}
		page['e']['密码1']={ 0xc9d2d2, "2|-2|0xffffff,7|-20|0xc0cbcb,19|-2|0xc0cbcb", 90, 275, 275, 436, 319}
		page['e']['密码2']={ 0xc9d2d2, "2|-2|0xffffff,7|-20|0xc0cbcb,19|-2|0xc0cbcb", 90, 303, 360, 476, 427}
		page['e']['邮箱']={ 0xc0cbcb, "0|-20|0xc3cdcd,2|-18|0xffffff,10|-9|0xc0cbcb", 90, 519, 455, 631, 524}
		page['e']['选择']={ 0x4b95cb, "2|-6|0x4b95cb,2|-4|0xffffff", 90, 526, 560, 629, 612}
		page['e']['选择2']={ 0x4b95cb, "0|2|0xffffff,0|-9|0x4b95cb", 90, 531, 652, 628, 704}
		page['e']['手机号']={ 0xc0cbcb, "1|-20|0xc3cdcd,1|-18|0xffffff,17|-8|0xc0cbcb", 90, 530, 755, 630, 805}
		page['e']['获取']={ 0xff7b7b, "34|1|0xff7b7b,47|-2|0xff7b7b", 90, 524, 841, 623, 911}
		page['e']['发送确定']={ 0xff7b7b, "-5|7|0xff7b7b", 90, 270, 626, 370, 685}
		page['e']['动态密码']={ 0xc2cdcd, "-5|-12|0xffffff,-12|-21|0xc0cbcb", 90, 391, 843, 617, 904}

		page['e']['下一步']={ 0x607483, "-21|-12|0x607483,-32|-3|0x607483", 90, 516, 64, 634, 122}

	page['e']['该号已经被注册']={ 0xffcd52, "0|25|0xffce54,-40|-17|0xffce55,0|-17|0xffffff", 90, 130, 171, 489, 296}


	while os.time()-Time_line<Time_out do
		if active(appbid,3)then
		elseif c_pic(page['e']['该号已经被注册'],'该号已经被注册',false,1)then
			return false
		elseif done(page['e']['填写信息界面'],'填写信息界面',false,1)then
			if c_pic(page['e']['用户名'],'用户名',true)then
				input(e_username)
				c_pic(page['e']['右下完成'],'右下完成',true)
			end
			
			if c_pic(page['e']['密码1'],'密码1',true)then
				inputword(e_password)
				c_pic(page['e']['右下完成'],'右下完成',true)
			end
			if c_pic(page['e']['密码2'],'密码2',true)then
				inputword(e_password)
				c_pic(page['e']['右下完成'],'右下完成',true)
			end
			if c_pic(page['e']['邮箱'],'邮箱',true)then
				input(e_mail)
				c_pic(page['e']['右下完成'],'右下完成',true)
			end
			
			if c_pic(page['e']['选择'],'选择',true)then
				mSleep(1000*2)
				sheng = math.random(1,10)
				for i=1,sheng do
					moveTo(w/2,987,w/2,857)
					mSleep(1000)
				end
				c_pic(page['e']['右下完成'],'右下完成',true)
			end
			
			if get_Phone then
				if sh_GetPhone(ItemId)then
					get_Phone = false
				end
			end
			if get_Phone == false then
				if c_pic(page['e']['手机号'],'手机号',true)then
					inputword(phone)
					c_pic(page['e']['右下完成'],'右下完成',true)
				end
			end
			
			if c_pic(page['e']['获取'],'获取',true)then
				mSleep(1000*5)
				if c_pic(page['e']['发送确定'],'发送确定',true)then
					out_time = os.time()
					while (true) do
						if sh_GMessage(ItemId)then
							if c_pic(page['e']['动态密码'],'动态密码',true)then
								mSleep(1000)
								inputword(dxyzm)
								c_pic(page['e']['右下完成'],'右下完成',true)
								break
							end
						else
							mSleep(1000*5)
						end
						if os.time()-out_time > 60 then
							return false
						end
					end
				end
			end
			if c_pic(page['e']['下一步'],'下一步',true)then
				mSleep(1000*10)
			end
			
		elseif done(page['e']['自助界面'],'自助界面',true,1)then
		elseif done(page['e']['登录界面'],'登录界面',true,1)then
		elseif c_pic(page['e']['screen'],'screen',false,1)then
			moveTo(600,h/2,200,h/2,50,20)
			mSleep(1000*2)
		else
			log('-:)')
		end
		delay(1)
	end
end


for i=1,20 do
	abl()
	reg()
end













