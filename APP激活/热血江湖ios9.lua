require("tsp")
require("ALZ")
require("AWZ")
require("阿波罗")

init('0',1)
url = 'http://ad.longtugame.com/apimob/ad?_c=19600'
app_bid = 'com.longtugame.rxjh'


--awzNew()
nLog(frontAppBid())

p={}
p['热血江湖']={}
p['热血江湖']['登录主菜单']={{674,173,0xf44336},{672,282,0x009688},{673,393,0xeb9500},}	--游客,注册,登录
p['热血江湖']['警告']={{574,412,0x007aff},{585,226,0x000000},}
p['热血江湖']['协议确定']={{568,520,0x1cb898},}
p['热血江湖']['登录游戏']={{899,319,0xf44336},{895,427,0xeb9500},}
p['热血江湖']['进入江湖']={{1100,27,0xfeeebf},{798,121,0xe41814},{817,110,0xe31715},}
p['热血江湖']['正在更新']={{41,591,0x0079fd},{1092,590,0xb6b6b6},{777,108,0xe01916},}

p['热血江湖']['进入游戏']={{1291,30,0xfdf2cc},{961,130,0xe31715},{704,82,0xebe078},}
p['热血江湖']['创建角色']={{142,1,0xdcaf3e},{135,13,0xd7af3f},{131,5,0x63330e},}


p['热血江湖']['确定弹窗']={ 0x1db898, "-4|1|0x2c6b55,17|10|0xffffff", 90, 539, 517, 789, 666}
p['热血江湖']['任意继续']={{1067,470,0xb6a876},{1065,470,0xb6a876},{1050,464,0x9f8064},}
p['热血江湖']['领取奖励']={{991,557,0xfdb22b},{990,586,0xffd53c},}
p['热血江湖']['接受任务']={{991,554,0x30c5a6},{992,585,0x33f5bf},}
p['热血江湖']['解锁确定']={{570,444,0x2cceaa},{569,436,0x1eb798},{569,430,0x28ba9b},}

--tips
p['热血江湖']['提示1']={{421,52,0xd87897},{412,60,0xfce25b},}
p['热血江湖']['提示2']={{507,53,0xf375a3},{497,61,0xf0d368},}
p['热血江湖']['提示3']={{848,320,0xf686b0},{872,338,0xf8e05c},}
p['热血江湖']['右提示']={ 0xe07bab, "-3|-1|0xefd16a", 90, 725, 0, 748, 640}--1077,308
p['热血江湖']['左竖排']={ 0xdf76af, "4|0|0xebca6b", 90, 418, 0, 480, 640}--125
p['热血江湖']['中竖排']={ 0xf0d264, "-4|0|0xf18dc9", 90, 511, 0, 567, 640}--208
p['热血江湖']['召唤']={ 0x22c29e, "0|9|0x32e1b3", 90, 828, 543, 918, 600}
p['热血江湖']['出战']={ 0xf9a61d, "3|0|0xb76627,5|0|0xffffff", 90, 506, 555, 564, 588}
p['热血江湖']['右上角x']={ 0xeabb7e, "0|-8|0x834135,7|-3|0xa54b3b", 90, 1037, 68, 1068, 91}
p['热血江湖']['后退']={ 0xf0c843, "0|1|0xeaac26,0|7|0xfc6963", 90, 70, 11, 107, 54}
p['热血江湖']['后下解锁']={ 0xfc9f1a, "0|5|0xf5a21a", 90, 842, 536, 876, 567}
p['热血江湖']['领取奖励2']={{916,513,0x34e6b7},{920,487,0x35c9aa},{1025,107,0x3c1e13},}
p['热血江湖']['奖励任意']={{552,399,0xffffff},{550,207,0xffffb8},}
p['热血江湖']['等级不够']={{1026,107,0x3e2016},{915,513,0xbcbcbc},{1026,118,0xa0ba36},}
p['热血江湖']['空白区域']={{563,458,0xffffff},{556,152,0xfeffb1},}
p['热血江湖']['签到x']={{1032,102,0x7f463c},{676,136,0xd2231e},{413,139,0xcd1c16},}
p['热血江湖']['挑战开战']={{928,422,0xd86845},{990,99,0x814336},{992,116,0xefc684},}


p['热血江湖']['游戏中']={{297,58,0xebcd93},{289,59,0xeac98e},}
p['热血江湖']['采集']={ 0xfec054, "3|0|0x925321", 90, 796, 454, 825, 482}
p['热血江湖']['主线红']={ 0xff0000, "", 90, 90, 205, 221, 239}
p['热血江湖']['主线绿']={ 0x0ce105, "", 90, 90, 205, 221, 239}
p['热血江湖']['解锁技能1']={ 0xffff8a, "7|5|0xffffff", 90, 1039, 355, 1097, 410}
p['热血江湖']['解锁技能2']={ 0xffff8b, "0|13|0xffffff", 90, 917, 555, 977, 617}

p['url']={}
p['url']['ok']={{333,437,0xfc0003},{325,437,0xecfffd},{313,440,0xf20000},}
p['url']['打开']={ 0x007aff, "0|-6|0x007aff", 90, 751, 408, 847, 462}



function other()
	if active(app_bid,5)then
	elseif done(p['热血江湖']['进入游戏'],'进入游戏',false,1)then
		click(570,476)
	elseif done(p['热血江湖']['协议确定'],'协议确定',true,1)then
	elseif done(p['热血江湖']['警告'],'警告',true,1)then
	elseif done(p['热血江湖']['登录主菜单'],'登录主菜单',true,1)then	
	elseif done(p['热血江湖']['登录游戏'],'登录游戏',true,1)then	
	elseif done(p['热血江湖']['进入江湖'],'进入江湖',false,1)then
		click(568,475)
	else
		if c_pic(p['热血江湖']['确定弹窗'],'确定弹窗',true)then
		elseif done(p['热血江湖']['创建角色'],'创建角色',false,1)then
			k = {}
			k['角色位置']={{128,141,0xe5c25b},{132,222,0x9ea09f},{131,295,0x8b8c89},{132,378,0x9d9d9d},{124,461,0x171815},{120,538,0xb7b7b9},}
			k['男女']={{929,378,0x5897ae},{1060,377,0xfffdf6},}
			k['时装']={{307,559,0xd9b7a2},{446,558,0xfbde84},{595,557,0xf2b767},{738,562,0xe8a75c},}
			
			for i,v in pairs(k)do
				click_mun = math.random(1,#v)
				click(v[click_mun][1],v[click_mun][2])
			end
			
			click(997,559)
		else
			return true
		end
	end
end

function tips()
	if done(p['热血江湖']['领取奖励'],'领取奖励',true,1)then
	elseif done(p['热血江湖']['接受任务'],'接受任务',true,1)then
	elseif done(p['热血江湖']['任意继续'],'任意继续',true,1)then	
elseif done(p['热血江湖']['领取奖励2'],'领取奖励2',true,1)then
elseif done(p['热血江湖']['奖励任意'],'奖励任意',true,1)then		
elseif done(p['热血江湖']['空白区域'],'空白区域',true,1)then		
elseif done(p['热血江湖']['签到x'],'签到x',true,1)then		
	elseif done(p['热血江湖']['挑战开战'],'挑战开战',true,1)then	
	elseif done(p['热血江湖']['等级不够'],'等级不够',true,1)then
	elseif done(p['热血江湖']['提示1'],'提示1',false,0)then
		click(72,76)
	elseif done(p['热血江湖']['提示2'],'提示2',false,0)then
		click(85,93)	
	elseif done(p['热血江湖']['提示3'],'提示3',false,0)then
		click(1268,361)
	elseif done(p['热血江湖']['解锁确定'],'解锁确定',true,1)then
	elseif c_pic(p['热血江湖']['右提示'],'右提示',false)then
		click(1077,y)
	elseif c_pic(p['热血江湖']['左竖排'],'左竖排',false)then
		click(125,y)
	elseif c_pic(p['热血江湖']['中竖排'],'中竖排',false)then
		click(208,y)
	elseif c_pic(p['热血江湖']['召唤'],'召唤',true)then	
	elseif c_pic(p['热血江湖']['出战'],'出战',true)then	
	elseif c_pic(p['热血江湖']['右上角x'],'右上角x',true)then	
	elseif c_pic(p['热血江湖']['后退'],'后退',true)then
elseif c_pic(p['热血江湖']['后下解锁'],'后下解锁',true)then	
elseif c_pic(p['热血江湖']['解锁技能1'],'解锁技能1',true)then	
	elseif c_pic(p['热血江湖']['解锁技能2'],'解锁技能2',true)then
	elseif done(p['热血江湖']['正在更新'],'正在更新',false,0)then
		timeLine = os.time()
	else
		return true
	end
end

function game()
	timeLine = os.time()
	local mastTime = os.time()
	local timeOut = 60 * 14 + math.random(1,99)
	while (os.time()-timeLine < timeOut) do
		nLog('时间='..os.time()-timeLine)
		if active(app_bid,5)then
		else
			if done(p['热血江湖']['游戏中'],'游戏中',false,1)then
				c_pic(p['热血江湖']['解锁技能1'],'解锁技能1',true)
				c_pic(p['热血江湖']['解锁技能1'],'解锁技能1',true)
				
				if c_pic(p['热血江湖']['采集'],'采集',true)then
					mSleep(1000*3)
				elseif c_pic(p['热血江湖']['主线红'],'主线红',true)then
				elseif c_pic(p['热血江湖']['主线绿'],'主线绿',true)then
				else
					click(177,215)
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
			return false
		end
	end
end

--[[
game()
lua_exit()
]]
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
	if abl()then
		if VPN()then
			if url_to(url)then
				lesstime(math.random(90,180))
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














