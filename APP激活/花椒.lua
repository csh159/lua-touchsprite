require("TSLib")
require("tsp")
require("ALZ")
require("阿波罗")



nLog(frontAppBid())


init('0',0);
appbid = 'com.huajiao.seeding'
id = 7435		---花椒
token = "20801571-3b8c-4fcb-be16-5da3d5633c60"




page={}


键盘={{113,754,0x000000},{317,752,0x000000},{544,750,0xffffff},{114,861,0x000000},{314,859,0xffffff},
	{537,862,0xffffff},{107,962,0xdadada},{317,962,0xffffff},{536,963,0x000000},
	[0]={320,1083,0xffffff},}

function input_phone(mun)
	for i =1,string.len(mun) do
		nLog(string.sub(mun,i,i))
		phone_mun_input = tonumber(string.sub(mun,i,i))
		click(键盘[phone_mun_input][1],键盘[phone_mun_input][2],0.3)
	end
end
input_phone("18478351823")
lua_exit()
	
function reg()
	计时 = os.time()
	超时 = 60 * 3
	
	手机号 = true
	取短信 = false
	
	头像下载 = true
	---------------------
	
	page['花椒']={}
	page['花椒']['home']={{436,992,0xf8a140},{323,996,0xf6666b},{221,992,0x4d9fff},}--1手机
	page['花椒']['注册']={{601,82,0xff53a0},{417,623,0xe5e5e5},{45,83,0x8a8a8a},}--1
	page['花椒']['注册界面']={{57,71,0x8a8a8a},{50,89,0x8a8a8a},{416,619,0xe5e5e5},}
		page['花椒']['发验证码']={ 0xfb68b4, "0|9|0xffffff,0|11|0xfb67b2", 90, 432, 314, 476, 343}
		page['花椒']['输入验证码']={ 0xb0b0b0, "0|-9|0xb0b0b0,5|-15|0xffffff", 90, 182, 317, 294, 361}
		page['花椒']['输入密码']={ 0xb0b0b0, "-1|-4|0xffffff,-3|-7|0xb0b0b0", 90, 260, 443, 396, 489}
		page['花椒']['注册提交']={ 0xffffff, "11|5|0xfb68b3,19|-2|0xffffff", 90, 251, 587, 383, 650}
	page['花椒']['成功界面']={{320,1116,0xfee32a},{325,1090,0x161418},}
	
	page['花椒']['错误']={{165,648,0x007aff},{405,642,0x007aff},{347,2,0x999999},}


	while (os.time()-计时 < 超时) do
		if active(appbid,3)then
		elseif done(page['花椒']['错误'],'错误',true,1) then
			closeX(appbid)
			mSleep(1000)
			return false
		elseif done(page['花椒']['成功界面'],'成功界面',false,1) then
			return true
		elseif done(page['花椒']['注册'],'注册',true,1) then
		elseif done(page['花椒']['注册界面'],'注册界面',false,1) then

			if 手机号 and GET_Phone(id,token)then
				--input2(phone)
				input_phone(phone)
				取号 = false
				取短信 = true
			end
			
			if 取短信 then
				if c_pic(page['花椒']['发验证码'],'发验证码',true)then
					mSleep(1000*5)
					if c_pic(page['花椒']['发验证码'],'发验证码',false)then
						nLog('没有点成功')
					else
						out_time = os.time()
						while (true) do
							if getMessage(id,phone,token)then
								if c_pic(page['花椒']['输入验证码'],'输入验证码',true)then
									input_phone(dxyzm)
									mSleep(1000)
									break
								end
							end
							if os.time()-out_time > 65 then
								addBlacklist(id,phone,token)
								return false
							end
						end
					end
				end
				
				if c_pic(page['花椒']['输入密码'],'输入密码',true)then
					password = myRand(4,math.random(8,10))
					input2(password)
				end
				
				if c_pic(page['花椒']['注册提交'],'注册提交',true)then
					mSleep(1000*5)
				end
				
			end
		
		elseif done(page['花椒']['home'],'home',true,1) then
	
		else
			log(' :) ')
		end
		mSleep(1000)
	end
end

function GPS()
	lx = math.random(246070616203,403130801431)/10000000000
	ly = math.random(1008544837397,1189599971282)/10000000000
	tab = {}
	tab[appbid] = { lat = lx, lon = ly }
	fakeGPS(tab)
	return true
end

--abl()
--abl_backup(appbid)

for i =1,5 do
	if reg()then
		break
	end
end









































