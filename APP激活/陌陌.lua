require("TSLib")
require("tsp")
require("ALZ")
require("阿波罗")



nLog(frontAppBid())


init('0',0);
appbid = 'com.wemomo.momoappdemo1'
url = 'https://app.appsflyer.com/id448165862?pid=9ads&c=test-7'


id = 1217		---陌陌
token = "20801571-3b8c-4fcb-be16-5da3d5633c60"
--[[
if not(ALZ()) then --登录一次
	dialog('登录失败\n请重新开始', 5)
	lua_exit()
end
--]]

page={}
page['momo']={}

键盘={{113,754,0x000000},{317,752,0x000000},{544,750,0xffffff},{114,861,0x000000},{314,859,0xffffff},
	{537,862,0xffffff},{107,962,0xdadada},{317,962,0xffffff},{536,963,0x000000},
	[0]={320,1083,0xffffff},}

function input_phone(mun)
	for i =1,string.len(mun) do
		nLog(string.sub(mun,i,i))
		phone_mun_input = tonumber(string.sub(mun,i,i))
		click(键盘[phone_mun_input][1],键盘[phone_mun_input][2],0.5)
	end
end
--openURL(url)
	
	
function reg()
	计时 = os.time()
	超时 = 60 * 3
	手机号 = true
	验证码 = true
	头像下载 = true
	---------------------
	取号 = true
	取短信 = false
	
	page['momo']['home']={{204,830,0x3462ff},{460,824,0x3462ff},{347,964,0x3e3e3d},{345,962,0xffffff},}	--3,4为注册,其它为辅助点
	page['momo']['填写昵称']={{404,171,0x202020},{404,172,0xffffff},{35,84,0xaaaaaa},{156,380,0xc7c7cd},}	--3点击,4后退
		page['momo']['下一步']={ 0xebefff, "5|-7|0x3462ff", 90, 235, 495, 403, 560}
	page['momo']['添加头像']={{335,300,0x1052ff},{317,271,0xc5c5f4},{36,85,0xaaaaaa},}	--界面
		page['momo']['选择生日']={ 0xaaaaaa, "0|-7|0xffffff,0|-12|0xaaaaaa", 90, 99, 567, 268, 620}
		page['momo']['选择性别']={ 0xaaaaaa, "0|-7|0xffffff,-2|-11|0xaaaaaa", 90, 101, 653, 188, 699}
		page['momo']['sex']={{321,812,0x007aff},{315,920,0x007aff},}
		page['momo']['确定']={ 0x007aff, "-3|-14|0xf8f8f8,-3|-15|0x0f82ff", 90, 277, 604, 361, 651}
		
		page['momo']['头像']={ 0x1052ff, "-8|-5|0xc5c5f4", 90, 319, 288, 349, 310}
			page['momo']['相册']={ 0x007aff, "-16|3|0xf9f9f9,-20|7|0x007aff", 90, 272, 788, 358, 840}
			page['momo']['照片']={{348,77,0x000000},{341,77,0x000000},{343,75,0xf9f9f9},}
			page['momo']['时刻']={{337,72,0x000000},{346,75,0xf9f9f9},{348,75,0x000000},}		--(71,320) 选取(590,1065)
			page['momo']['相册下一步']={ 0xffffff, "-5|0|0x3462ff,-21|-1|0xffffff", 90, 249, 924, 374, 972}
	page['momo']['输入你的手机号']={{463,164,0x2e2e2e},{468,167,0xf1f1f1},{468,174,0x1e1e1e},{36,83,0xaaaaaa},}
		page['momo']['输入手机号']={ 0xc7c7cd, "9|-24|0xc7c7cd", 90, 109, 393, 247, 439}
		page['momo']['输入密码']={ 0xc9c9cf, "0|-2|0xffffff,1|-18|0xc7c7cd", 90, 112, 479, 183, 524}
		page['momo']['手机号下一步']={ 0xffffff, "0|-5|0x3462ff,-22|-12|0xffffff", 90, 257, 614, 373, 666}
		page['momo']['确认手机号']={ 0x007aff, "6|0|0xd1e2f9,12|-1|0x007aff", 90, 411, 630, 500, 671}
	page['momo']['验证手机']={ {394,165,0x1e1e1e},{398,168,0xf1f1f1},{399,168,0x1e1e1e},{35,84,0xaaaaaa},}
		page['momo']['填空']={ 0xa8a8a8, "2|-35|0x3462ff,-34|0|0x3462ff,38|2|0x3462ff", 90, 15, 325, 125, 430}
		page['momo']['完成注册']={ 0xffffff, "6|-8|0x3462ff,6|-21|0xeef2ff", 90, 235, 489, 391, 546}
		page['momo']['已经注册过']={{156,667,0x007aff},{437,686,0x007aff},{330,5,0x999999},}
		
	while (os.time()-计时 < 超时) do
		if active(appbid,3)then
		elseif done(page['momo']['验证手机'],'验证手机',false,1) then
			if c_pic(page['momo']['填空'],'填空',true)then
				out_time = os.time()
				while (true) do
					if getMessage(id,phone,token)then
						input_phone(dxyzm)
						if c_pic(page['momo']['完成注册'],'完成注册',true)then
							mSleep(1000*3)
							if done(page['momo']['已经注册过'],'已经注册过',true)then
								addBlacklist(id,phone,token)
								return false
							end
							break
						end
					end
					if os.time()-out_time > 65 then
						addBlacklist(id,phone,token)
						return false
					end
				end
			end
		elseif done(page['momo']['输入你的手机号'],'输入你的手机号',false,1) then
		
			if 取号 and GET_Phone(id,token)then
				if c_pic(page['momo']['输入手机号'],'输入手机号',true)then
					input2(phone)
				end
				取号 = false
				取短信 = true
			end
			
			if c_pic(page['momo']['输入密码'],'输入密码',true)then
				password = myRand(4,math.random(6,10))
				input2(password)
			end
			
			if c_pic(page['momo']['手机号下一步'],'手机号下一步',true)then
				mSleep(1000)
			end
			
			if c_pic(page['momo']['确认手机号'],'确认手机号',true)then
				mSleep(1000)
			end
			
		elseif done(page['momo']['添加头像'],'添加头像',false,1) then
			if c_pic(page['momo']['选择生日'],'选择生日',true)then
				mSleep(1000*1)
				moveTo(166,836,166,1010,math.random(10,50),20)
				moveTo(308,836,308,1010,math.random(10,50),20)
				moveTo(470,836,470,1010,math.random(10,50),20)
				mSleep(1000*2)
				click(w/2,100)
			end
			if c_pic(page['momo']['选择性别'],'选择性别',true)then
				mSleep(1000*2)
				six_click = math.random(1,2)
				click(page['momo']['sex'][six_click][1],page['momo']['sex'][six_click][2])
				mSleep(1000*2)
				c_pic(page['momo']['确定'],'确定',true)
			end
			
			if 头像下载 then
				clearAllPhotos()	--清空相册
				delay(1)
				local_pic = '/User/Media/TouchSprite/res/music.png'
				local pic_name = math.random(1,2000)..'.jpg'
				web_pic = 'http://onlyonelife.online/img/china_woman/'..pic_name
				downFile(web_pic,local_pic)
				saveImageToAlbum('music.png')
				delay(1)
				头像下载 = false
			end
			
			outLine = os.time()
			while (os.time()-outLine < 60) do
				if active(appbid,3)then
				elseif done(page['momo']['时刻'],'时刻',false,1)then
					click(71,320)
					click(590,1065)
					mSleep(1000*3)
					break
				elseif done(page['momo']['照片'],'照片',false,1)then
					click(604,217)
				elseif c_pic(page['momo']['相册'],'相册',true)then
				elseif c_pic(page['momo']['头像'],'头像',true)then
				end
				mSleep(1000)
			end
			if c_pic(page['momo']['相册下一步'],'相册下一步',true)then
				mSleep(1000)
			end
			
		elseif done(page['momo']['填写昵称'],'填写昵称',true,4) then
			nikename = myRand(7,math.random(3,6))
			input(nikename)
			if c_pic(page['momo']['下一步'],'下一步',true)then
				mSleep(1000*2)
			end
		elseif done(page['momo']['home'],'home',true,3) then
	
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

reg()











































