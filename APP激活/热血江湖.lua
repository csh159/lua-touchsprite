require("tsp")
require("ALZ")
require("AWZ")

init('0',1)
url = 'http://ad.longtugame.com/apimob/ad?_c=19600'
app_bid = 'com.longtugame.rxjh'


--awzNew()
nLog(frontAppBid())

p={}
p['热血江湖']={}
p['热血江湖']['登录主菜单']={{880,222,0xf44336},{876,332,0x009688},{876,443,0xeb9500},}	--游客,注册,登录
p['热血江湖']['警告']={{675,466,0x007aff},{658,477,0x007aff},{684,286,0x000000},}
p['热血江湖']['协议确定']={{666,625,0x31deb1},}
p['热血江湖']['登录游戏']={{899,319,0xf44336},{895,427,0xeb9500},}
p['热血江湖']['进入江湖']={{1317,222,0x440506},{1309,222,0x8b4508},{1247,230,0x85574b},}
p['热血江湖']['正在更新']={{40,691,0x0078fb},{1288,692,0xb7b7b7},}

p['热血江湖']['进入游戏']={{1291,30,0xfdf2cc},{961,130,0xe31715},{704,82,0xebe078},}
p['热血江湖']['创建角色']={{157,9,0xfee16d},{1281,545,0xdb0006},{1283,559,0xe3e1e0},}


p['热血江湖']['确定弹窗']={ 0x1db898, "-4|1|0x2c6b55,17|10|0xffffff", 90, 539, 517, 789, 666}
p['热血江湖']['任意继续']={{1252,551,0xb6a876},{1255,551,0xb6a876},}
p['热血江湖']['领取奖励']={{1188,667,0xf5a21a},{1177,673,0xffffff},}
p['热血江湖']['接受任务']={{1164,654,0x20b497},{1163,685,0x36f1bd},}
p['热血江湖']['解锁确定']={{668,518,0x28c4a2},{668,505,0x25b899},}
p['热血江湖']['跳过动画']={{1295,42,0x874d15},{1307,42,0xfefcdb},{1217,38,0xf7e4b5},}

p['热血江湖']['提示1']={{544,227,0xfbe259},{561,227,0xe05f99},}
p['热血江湖']['提示2']={{507,53,0xf375a3},{497,61,0xf0d368},}
p['热血江湖']['提示3']={{848,320,0xf686b0},{872,338,0xf8e05c},}
p['热血江湖']['提示4']={{869,117,0xf1da61},{859,105,0xf68dc5},}
p['热血江湖']['右提示']={ 0xf2d771, "5|0|0xee87c2", 90, 855, 0, 863, 750}--1250
p['热血江湖']['左竖排']={ 0xec85c0, "4|0|0xefcd63", 90, 652, 0, 660, 750}--250
p['热血江湖']['召唤']={ 0x32f4be, "-3|-17|0x1dbc9a,0|-18|0x2a6953", 90, 1009, 656, 1048, 691}
p['热血江湖']['出战']={ 0xf6a31b, "0|7|0xfaaa21,7|5|0xffffff", 90, 600, 648, 658, 693}
p['热血江湖']['挑战']={ 0x1bb293, "0|5|0x1cb998,6|5|0x296d57", 90, 1081, 658, 1123, 684}
p['热血江湖']['右上角x']={ 0x7f4234, "0|8|0xf5bd91,3|3|0x8b4338", 90, 1224, 78, 1258, 105}
p['热血江湖']['后退']={ 0xfb695e, "1|-10|0xf3cf50", 90, 85, 17, 123, 56}
p['热血江湖']['开战']={{1094,490,0xdb724f},{1161,117,0x814135},{1160,134,0xeec483},}
p['热血江湖']['后下解锁']={ 0xf5a019, "1|-8|0xfaa621,11|3|0xfbf6f3", 90, 989, 631, 1031, 670}
p['热血江湖']['10级大礼']={{1079,574,0x27bc9c},{1133,586,0x1db898},{1206,125,0x402218},}
p['热血江湖']['级别不够']={{1206,125,0x402218},{1037,573,0x9e9e9e},{1107,571,0xa8a8a8},}--1
p['热血江湖']['空白区域']={{658,538,0xffffff},{666,528,0xc4b250},{670,536,0xffffff},}
p['热血江湖']['福利x']={{1209,120,0x7d4639},{796,156,0xd2241d},{485,162,0xcd1c16},}

p['热血江湖']['游戏中']={{204,182,0xfef1cc},{1325,36,0xe0c09e},}
p['热血江湖']['采集']={ 0xfcbc4d, "-2|5|0xf3ece6,6|3|0x90501d", 90, 915, 535, 977, 564}
p['热血江湖']['主线红']={ 0xff0000, "", 90, 88, 239, 189, 283}
p['热血江湖']['主线绿']={ 0x0ce105, "", 90, 106, 240, 259, 281}
p['热血江湖']['技能解锁1']={ 0xffffff, "4|-3|0xffff7c", 90, 1219, 423, 1268, 484}
p['热血江湖']['技能解锁2']={ 0xffff3c, "5|3|0xffffdf", 90, 1078, 651, 1133, 713}

p['url']={}
p['url']['ok']={{333,549,0xfe0005},{324,544,0xfcffee},{317,536,0xf70003},}
p['url']['打开']={ 0x007aff, "0|-6|0x007aff", 90, 751, 408, 847, 462}


function jietu()
	current_time = os.date("%Y-%m-%d", os.time());
	snapshot(current_time..".png", 0, 0, 639, 1135); --以时间戳命名进行截图
end

function other()
	if active(app_bid,5)then
	elseif done(p['热血江湖']['进入游戏'],'进入游戏',false,1)then
		click(656,557)
	elseif done(p['热血江湖']['协议确定'],'协议确定',true,1)then
	elseif done(p['热血江湖']['警告'],'警告',true,1)then
	elseif done(p['热血江湖']['登录主菜单'],'登录主菜单',true,1)then	
	elseif done(p['热血江湖']['登录游戏'],'登录游戏',true,1)then	
	elseif done(p['热血江湖']['进入江湖'],'进入江湖',false,1)then
		click(1137,669)
	else
		if c_pic(p['热血江湖']['确定弹窗'],'确定弹窗',true)then
		elseif done(p['热血江湖']['创建角色'],'创建角色',false,1)then
			k = {}
			k['角色位置']={{56,159,0x58140d},{71,256,0x457880},{73,350,0x38244d},{77,435,0x56a97f},{73,535,0x8c5d66},{57,628,0x1f1836},}
			k['男女']={{1097,446,0xfbf7f3},{1245,443,0xea9ab7},}
			k['时装']={{358,658,0xf8d5b4},{525,657,0xfcf07e},{698,657,0xd57c1a},{869,655,0xcd7218},}
			
			for i,v in pairs(k)do
				click_mun = math.random(1,#v)
				click(v[click_mun][1],v[click_mun][2])
			end
			
			click(1171,655)
		else
			return true
		end
	end
end

function tips()
	if done(p['热血江湖']['领取奖励'],'领取奖励',true,1)then
	elseif done(p['热血江湖']['接受任务'],'接受任务',true,1)then
	elseif done(p['热血江湖']['任意继续'],'任意继续',true,1)then
	elseif done(p['热血江湖']['提示1'],'提示1',false,0)then
		click(144,252)
	elseif done(p['热血江湖']['提示2'],'提示2',false,0)then
		click(85,93)	
	elseif done(p['热血江湖']['提示3'],'提示3',false,0)then
		click(1268,361)
	elseif done(p['热血江湖']['提示4'],'提示4',false,0)then
		click(1268,139)
	elseif done(p['热血江湖']['解锁确定'],'解锁确定',true,1)then
	elseif c_pic(p['热血江湖']['右提示'],'右提示',false)then
		click(1250,y)
	elseif c_pic(p['热血江湖']['左竖排'],'左竖排',false)then
		click(250,y)
	elseif c_pic(p['热血江湖']['召唤'],'召唤',true)then	
	elseif c_pic(p['热血江湖']['出战'],'出战',true)then		
	elseif c_pic(p['热血江湖']['挑战'],'挑战',true)then
	elseif c_pic(p['热血江湖']['右上角x'],'右上角x',true)then	
	elseif c_pic(p['热血江湖']['后退'],'后退',true)then
	elseif c_pic(p['热血江湖']['后下解锁'],'后下解锁',true)then
	elseif done(p['热血江湖']['跳过动画'],'跳过动画',true,1)then
	elseif done(p['热血江湖']['开战'],'开战',true,1)then	
	elseif done(p['热血江湖']['10级大礼'],'10级大礼',true,1)then	
		click(672,51)
	elseif done(p['热血江湖']['级别不够'],'级别不够',true,1)then
	elseif done(p['热血江湖']['空白区域'],'级别不够',true,1)then	
	elseif done(p['热血江湖']['福利x'],'福利x',true,1)then
	elseif done(p['热血江湖']['正在更新'],'正在更新',false,0)then
		timeLine = os.time()
	else
		return true
	end
end

function game()
	timeLine = os.time()
	local mastTime = os.time()
	local timeOut = 60 * 12 + math.random(1,200)
	while (os.time()-timeLine < timeOut) do
		nLog('时间='..os.time()-timeLine)
		if active(app_bid,5)then
		else
			if done(p['热血江湖']['游戏中'],'游戏中',false,1)then
				
				if c_pic(p['热血江湖']['技能解锁1'],'技能解锁1',true)then
				elseif c_pic(p['热血江湖']['技能解锁2'],'技能解锁2',true)then
				end
				
				if c_pic(p['热血江湖']['采集'],'采集',true)then
					mSleep(1000*3)
				elseif c_pic(p['热血江湖']['主线红'],'主线红',true)then
				elseif c_pic(p['热血江湖']['主线绿'],'主线绿',true)then
				else
					click(226,248)
				end
			else
				if tips()then
					if other()then
						other_mun = other_mun or 0
						other_mun = other_mun + 1
						if other_mun > 25 then
							click(h/2,w/2)
							other_mun = 0
						end
					else
						other_mun = 0
					end
				end
			end
		end
		mSleep(200*1)
		if os.time()-mastTime> 60*25 then
			jietu()
			return false
		end
	end
	jietu()
end


--game()
--lua_exit()

--[[]]
function url_to(url)
	openURL(url)
	local timeOut = os.time()
	while (os.time()-timeOut<30) do
		if done(p['url']['ok'],'ok',false,1)then
			return true
		else
			c_pic(p['url']['打开'],'打开',true)
		end
		mSleep(1000)
	end
end

function lesstime(times)
	local lineTime = os.time()
	while (os.time()-lineTime < times) do
		toast(times..'-->'..os.time()-lineTime ,1)
		mSleep(2000)
	end
end

while (true) do
	if awzNew()then
		if VPN()then
			if url_to(url)then
				lesstime(math.random(100,150))
				game()
			end
			--reName('热血')
			close_VPN()
		end
	end
end


--]]
--[[
for var= 1, 3 do
	if VPN()then
		game()
	end
	awz_next()
	close_VPN()
end
]]














