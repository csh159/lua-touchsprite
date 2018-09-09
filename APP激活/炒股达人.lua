require("TSLib")
require("ALZ")
--require("haoi23")
require("tsp")


id = 57586
ALZ()

function beforeUserExit()
	close_VPN()
end

function ms(n)
	mSleep(1000* n)
end

--//输入私人库

page = {}
page['首页']={}
page['首页']['异常']={{59,74,0xfe2c2b},{588,109,0xaaef08},}
page['首页']['开始页面']={{539,49,0xe11f1e},{772,308,0xf9a55f},{688,456,0xffef38},{466,434,0x068cfb},}
page['首页']['注册界面']={{541,44,0xd21d1c},{411,219,0xdaefff},{412,354,0xdcf0ff},{412,356,0x0e578f},}
	page['首页']['手机号']={ 0x575e63, "0|2|0x021929,0|3|0x686c6f", 90, 522, 209, 669, 247}
	page['首页']['登录密码']={ 0x5d6367, "0|3|0x6b6f71", 90, 592, 282, 715, 318}
		page['首页']['获取验证码']={ 0xffe318, "6|-8|0xdb6005", 90, 711, 340, 830, 390}
		page['首页']['验证码成功']={ 0xdc6611, "0|14|0xfef132,13|14|0xfef132", 90, 526, 376, 610, 427}
	page['首页']['输入验证码']={ 0x5f676b, "5|-6|0x747778", 90, 478, 350, 637, 387}
	page['首页']['确定']={ 0xdf6705, "0|9|0xffea23,10|10|0xfff137", 90, 630, 420, 730, 471}
page['首页']['注册成功']={{132,322,0xfb4319},{580,550,0xffe45a},{938,95,0x0e6bc9},}

page['游戏']={}
page['游戏']['领取奖励']={{93,81,0xffffff},{103,84,0x696ac2},{573,545,0xffd105},}
page['游戏']['弹窗广告']={{324,63,0xf8f70a},{807,45,0xfff7d9},{977,39,0xffffff},}
page['游戏']['游戏主界面']={{5,12,0x54c5ff},{567,34,0x79e900},{843,39,0x0c3402},}
page['游戏']['PK大战']={ 0xffd927, "7|3|0x080908,20|2|0xffd927", 90, 129, 228, 315, 409}
page['游戏']['匹配中']={{478,144,0xb5f800},{551,149,0xb5f800},{577,147,0xb5f800},}
page['游戏']['PK中']={{9,45,0x279cec},{1071,39,0xf5f8fc},{1012,603,0x013b7c},}
page['游戏']['买入']={ 0xb10000, "", 90, 89, 576, 182, 619}
page['游戏']['卖出']={ 0x9f01aa, "", 90, 97, 568, 173, 616}
page['游戏']['PK结果']={{124,61,0xdee9ef},{124,63,0x4e4bb5},{574,549,0xd95206},{1025,56,0xffffff},}


function playGame()
	init('0',1)
	app = 'com.jujing.stocks'
	计时 = os.time()
	超时 = 60 * 8  --8分钟超时
	
	while (os.time() - 计时 < 超时) do
		if active(app)then
			ms(5)
		elseif done(page['游戏']['PK中'],'PK中',3,false)then
			if done(page['游戏']['PK中'],'PK中',3,true)then
				delay(1)
				mai = math.random(1,100)
				log(mai)
				if mai > 70 then
					c_p(page['游戏']['卖出'],'卖出',true)
				elseif mai > 50 then
					c_p(page['游戏']['买入'],'买入',true)
				end
			end
			
		elseif done(page['游戏']['游戏主界面'],'游戏主界面',false)then
			if done(page['游戏']['匹配中'],'匹配中',false)then
			elseif c_pic(page['游戏']['PK大战'],'PK大战',true)then
			else
				click(666,419)
			end
			delay(1)
		elseif done(page['首页']['开始页面'],'开始页面',3,true)then
		elseif done(page['游戏']['领取奖励'],'领取奖励',3,true)then
		elseif done(page['游戏']['弹窗广告'],'弹窗广告',3,true)then
		elseif done(page['游戏']['PK结果'],'PK结果',3,false)then
			pk = math.random(1,100)
			if pk > 80 then
				if done(page['游戏']['PK结果'],'PK结果',3,true)then
					mSleep( 1000* 5)
				end
			else
				closeX(app)
				return true
			end
		elseif done(page['首页']['异常'],'异常')then
			pressHomeKey(0)
			pressHomeKey(1)
			delay(2)
		else
			mSleep(1500)
		end
		delay(0.2)
	end
end

--//数据采集


function reg(ok)
	init('0',1)
	path = '/User/Media/TouchSprite/lua/炒股达人'.. os.date('%Y-%m-%d') ..'.txt'
	if file_exists(path)then
		toast('今天已经完成->'..#readFile(path),10)
		if #readFile(path) > ok then
			toast('数量完成-->'..ok,1)
			return 
		end
	end	
	
	app = 'com.jujing.stocks'
	空白点击 = {1076,603}
	计时 = os.time()
	超时 = 60 * 5
	确认 = false
	
	while os.time()-计时 < 超时 do
		if active(app)then
			ms(5)
		elseif done(page['首页']['开始页面'],'开始页面',4,true)then
		elseif done(page['首页']['注册界面'],'注册界面',4,false)then
			
			if c_pic(page['首页']['手机号'],'手机号',true)then
				if GET_Phone(id,token)then
					input(phone)
					ms(2)
				end
				click(空白点击[1],空白点击[2])
				ms(2)
			end
			if c_pic(page['首页']['登录密码'],'登录密码',true)then
				password = myRand(3,math.random(3,5))..myRand(1,math.random(3,5))
				input(password)
				ms(1)
				click(空白点击[1],空白点击[2])
				ms(2)
			end
			if c_pic(page['首页']['获取验证码'],'获取验证码',true)then
				ms(2)
				if c_pic(page['首页']['验证码成功'],'验证码成功',true)then
					ms(2)
				end
			end
			if c_pic(page['首页']['输入验证码'],'输入验证码',true)then
				if c_pic(page['首页']['输入验证码'],'输入验证码',false)~=true then
					get_message = 0
					while true do
						if getMessage(id,phone)then
							input(dxyzm)
							ms(2)
							click(空白点击[1],空白点击[2])
							确认 = true
							break
						end
						get_message = get_message + 1
						if get_message >= 30 then
							addBlacklist(id,phone)
							closeX(frontAppBid())
							return false
						end
					end
				end
			end
			if 确认 and c_pic(page['首页']['确定'],'确定',true)then
				ms(5)
			end
			if done(page['首页']['注册成功'],'注册成功',2,true)then
				toast('注册成功',5)
				ms(10)
				writeFile(path,'炒股达人|'..phone..'|'..password,a)
				return true
			end
		elseif done(page['首页']['异常'],'异常')then
			pressHomeKey(0)
			pressHomeKey(1)
		end
		ms(2)
	end
end

function awz()
	openURL("IGG://cmd/newrecord");
	mSleep(3000)
	logTxt = '/var/mobile/iggresult.txt'
	out_time = os.time()
	while os.time()-out_time <= 10 do
		if file_exists(logTxt)then
			local new = readFile(logTxt)[1]
			if new == "1" then
				toast('一键新机成功',3)
				return true
			elseif new == "3" then
				toast('IP-->重复请注意',1)
				return true
			elseif new == '2' then
				nLog('指令正在执行过程中，还未完成')
			end
			mSleep(2000)
		else
			toast('一键新机',3)
			mSleep(1000* 3)
		end
	end
end

init('0',1)
app = 'com.jujing.stocks'
if false or awz()then
	if false or reg(100)then
		playGame()
	end
end






