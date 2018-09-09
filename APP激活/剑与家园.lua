require("TSLib")
require("tsp")
require("阿波罗")

toast('--',1)



init('0',1);--横屏
app = 'com.lilithgame.sgame'
--1:深蓝(桑多瑞),2:橙色(葛雷),3:蓝色(利萨姆),4:黄色(达姆斯),5:紫色(莉维塔),6:绿色(夏亚)
国家坐标 = {{142,233,0xcf2b20},{243,172,0xd12e1e},{452,201,0xd6321c},{622,392,0xd22f1e},{310,367,0xcc2922},{154,286,0xcf2a20},}
国家 = 1
初始英雄 = {{622,197,0x341913},{811,201,0x94614a},{993,203,0xf7babb},}
英雄 = 2

aoc = {}
aoc['lls']={}
aoc['lls']['选择您的国家']={{897,542,0x249dbb},{656,14,0xffe200},{646,16,0x080c12},}
aoc['lls']['选择您的国家2']={{177,19,0xffffff},{176,19,0x23282f},{34,21,0xf6f693},{36,15,0x193f47},}
	aoc['lls']['进入国家']={ 0x12505e, "-2|0|0xffffff", 90, 859, 528, 929, 564}
aoc['lls']['开始游戏']={{795,518,0x7be940},{986,51,0xffd800},{982,53,0x030610},}

--城堡中
aoc['lls']['城堡中']={{105,13,0xf4ee94},{28,25,0xf4f393},{1079,587,0x174a53},}
	aoc['lls']['资源位置']={{953,128,0xb48f5b},{401,269,0xbd8126},{444,602,0x497f9a}}--1:木,2:金币,3:圣水,
	aoc['lls']['有奖励可领']={ 0xc9ff07, "27|-7|0xbe1c2b", 90, 17, 544, 71, 569}
	aoc['lls']['有奖励可领2']={ 0xceff0c, "25|-10|0xbe1b2c", 90, 14, 528, 114, 622}
	aoc['lls']['主城升级中']={{600,224,0xbbc892},{600,226,0x38887b},{600,225,0x71a17e},}
	aoc['lls']['主城升级']={{638,102,0xbaff00},}
	aoc['lls']['主城升级-木材不足']={ 0xff4b4b, "", 90, 334, 369, 756, 408}--(417,461)
	aoc['lls']['主城升级-确定']={ 0x4dd23b, "2|0|0x26681d,4|0|0xf8f8f8", 90, 656, 429, 785, 495}
	
--城堡提示
aoc['lls']['升级建筑']={{105,14,0xefec94},{32,25,0xeceb8f},{38,13,0x306b7b},}
	aoc['lls']['新!']={ 0xefd363, "-2|0|0x125e29", 90, 122, 469, 985, 492}
	aoc['lls']['文字颜色']={ 0xf4d765, "",  90, 443, 64, 652, 129}
	aoc['lls']['建筑建造']={ 0x68e23d, "3|-2|0x316f1d", 90, 455, 373, 683, 436}
	aoc['lls']['选择建筑']={ 0xffffff, "-3|0|0x6d6551,-5|-2|0xffffff", 90, 44, 575, 1050, 599}
	
	
--地图上
aoc['lls']['游戏地图中']={{303,13,0xe8e676},{475,29,0x9ff9fa},{835,25,0xfbe22d},{1031,29,0x9a5000},}
aoc['lls']['地图上的怪']={ 0xff4715, "-56|0|0xff4715,-56|1|0xff4715", 90, 90, 62, 1127, 548}
aoc['lls']['地图上的兵']={ 0xa7f675, "-57|0|0x71d167,-57|2|0x72d367", 90, 90, 62, 1127, 548}
aoc['lls']['任务']={{54,571,0xccff0a},}
aoc['lls']['身边怪']={ 0xfd582b, "1|1|0xeb5a36", 90, 454, 202, 695, 429}
aoc['lls']['身边怪2']={ 0xfd582b, "0|1|0xfd582b", 90, 281, 156, 777, 467}
aoc['lls']['最右城堡']={ 0xad5d44, "-1|0|0xca7149", 90, 834, 175, 1130, 270}
aoc['lls']['红色民兵']={ 0xff0b2d, "1|0|0xff0b2d", 90, 229, 93, 995, 498}

aoc['lls']['已有城堡']={{261,572,0x415ead},{255,591,0xf6efde},{252,589,0x5f818c},}
	

--任务界面
aoc['lls']['任务界面']={{32,24,0xeeee91},{139,27,0xffffff},{39,45,0x3e9c73},}
aoc['lls']['领取']={ 0x83ec42, "3|-8|0x316e1d,7|-13|0xffffff", 90, 877, 88, 1056, 600}
aoc['lls']['找到目标']={ 0x9ba3a3, "0|17|0x152635,28|15|0x99a081", 90, 877, 88, 1056, 600}
aoc['lls']['找到目标2']={ 0xf7f7f1, "1|31|0xf7f7b9,32|17|0xffffdd", 90, 909, 81, 1061, 611}

--世界地图
aoc['lls']['世界地图界面']={{1096,579,0xeeee92},{35,24,0xf6f694},{1079,586,0x154e56},}--1发言,2后退,3辅助
aoc['lls']['前往目标']={ 0x72e53f, "4|-8|0x2b6a1e,6|-10|0xffffff", 90, 309, 157, 829, 494}

--战斗中
aoc['lls']['战斗画面']={{790,19,0x991631},{417,19,0x185ab5},}
aoc['lls']['超出例队']={ 0xfd4e4a, "", 90, 1045, 468, 1108, 493}

--tips
aoc['lls']['攻击']={{764,488,0xc86435},{471,488,0x2195b8},{774,136,0x861400},}
aoc['lls']['打怪确定']={{728,583,0x4ac642},{455,584,0x1c88b5},}
aoc['lls']['英雄确定']={{547,585,0x249cbd},{634,591,0x1c8bb6},}
aoc['lls']['招兵确定']={{593,438,0x239bbb},{554,438,0x27a2bd},}
aoc['lls']['中间蓝色确定']={ 0x19545c, "3|0|0xffffff,3|14|0x3dc6b9", 90, 451, 409, 683, 469}
aoc['lls']['英雄升级']={{810,558,0xd87f1b},{742,561,0xd17821},}
aoc['lls']['获得英雄']={{559,543,0xccca99},{574,91,0xfefecd},{658,305,0xf3cc81},{478,346,0xaf924c},}
aoc['lls']['获得英雄确认']={{762,557,0x2195b7},{705,556,0x289bbc},}
aoc['lls']['登录失效']={{525,395,0x299cbb},{612,396,0x1e91b6},}
aoc['lls']['招募']={{794,464,0x63dd3d},{330,461,0x2caec1},}
aoc['lls']['招募取消']={{821,459,0x3c4955},{405,454,0x1d86ad},{404,454,0x0f475a},}
--提示
aoc['lls']['充值会员']={{782,393,0x165720},{778,393,0xfdfdfd},{468,395,0x10475a},{469,394,0xffffff},}

--领礼包
aoc['lls']['设置界面']={{180,21,0x0b121c},{181,23,0xffffff},{33,22,0xf3f394},}
	aoc['lls']['帐号管理']={{660,480,0x2ca9c1},{653,356,0x2ba2c0},{629,248,0xfe2d59},}--1018,221
	aoc['lls']['兑换界面']={{532,366,0x3ec2bd},{532,329,0x2193b5},{495,245,0x3d3e3f},}--3--542,233--
	aoc['lls']['兑换确定']={ 0x2db3c0, "10|-3|0x14565e,12|-3|0xffffff", 90, 518, 322, 609, 372}
	aoc['lls']['兑换成功']={ 0x2aadbf, "2|0|0x2bafc0,5|0|0x19555c", 90, 511, 466, 647, 524}
	
function get_wood()
	local out_time = os.time()
	local 填入 = false
	while os.time()-out_time< 30 do
		if active(app,5)then
			
		elseif done(aoc['lls']['设置界面'],'设置界面',false,1)then
			if done(aoc['lls']['帐号管理'],'帐号管理',true,1)then
				if done(aoc['lls']['兑换界面'],'兑换界面',true,3)then
					input('43baupwdxr')
					click(1025,607)
				end
			else
				click(1018,221)
			end
		elseif 填入 and c_pic(aoc['lls']['兑换确定'],'兑换确定',true) then
			click(543,93)--取消输入
			return true
		elseif c_pic(aoc['lls']['兑换确定'],'兑换确定',true)then
			填入 = true
		elseif c_pic(aoc['lls']['兑换成功'],'兑换成功',true)then
			return true
		end
		mSleep(1000*2)
	end
end
	

function tips()
	if done(aoc['lls']['打怪确定'],'打怪确定',true,1)then
	elseif done(aoc['lls']['英雄升级'],'英雄升级',true,1)then
	elseif done(aoc['lls']['招兵确定'],'招兵确定',true,1)then
	elseif done(aoc['lls']['英雄确定'],'英雄确定',true,1)then
	elseif done(aoc['lls']['攻击'],'攻击',true,1)then
	elseif done(aoc['lls']['获得英雄'],'获得英雄',true,1)then
	elseif done(aoc['lls']['获得英雄确认'],'获得英雄确认',true,1)then	
	elseif done(aoc['lls']['登录失效'],'登录失效',true,1)then	
	elseif done(aoc['lls']['招募'],'招募',true,1)or done(aoc['lls']['招募取消'],'招募取消',true,2)then
		民兵 = false
	else
		return true
	end
end

function 怪()
	left_x = 90
	统计 = 0
	keepScreen(true)

	while left_x < 1127 do

		aoc['lls']['怪红色']={ 0xfd582b, "", 70, left_x, 62, 1127, 548}
		
		
		if c_p(aoc['lls']['怪红色'],'怪红色',false)then
			log(x..','..y)
			left_x = x
			统计 = 统计 + 1
			
			aoc['lls']['怪红色打点']={ 0xfd582b, "", 70, left_x+1, 62, left_x+2, 548}
			while (c_p(aoc['lls']['怪红色打点'],'怪红色打点',false)) do
				left_x = x
				统计 = 统计 + 1
				if 统计 > 15 then
					keepScreen(false)
					click(x,y)
					return true
				end
			end
		end
		
		left_x =  left_x + 1
	end
	
	
	keepScreen(false)
end



function 兵()
	left_x = 90
	统计 = 0
	keepScreen(true)

	while left_x < 1127 do
		
		aoc['lls']['兵绿色']={ 0x7ee567, "", 90, left_x, 68, 1127, 548}
		if 国家 == 5 then
			aoc['lls']['兵绿色']={ 0x5aa628, "", 80, left_x, 68, 1127, 548}
		end
		
		if c_p(aoc['lls']['兵绿色'],'兵绿色',false)then
			log(x..','..y)
			left_x = x
			统计 = 统计 + 1
			
			aoc['lls']['兵绿色打点']={ 0x7ce467, "", 80, left_x+1, 62, left_x+2, 548}
			if 国家 == 5 then
				aoc['lls']['兵绿色打点']={ 0x5aa628, "", 80, left_x+1, 62, left_x+2, 548}
			end
			while (c_p(aoc['lls']['兵绿色打点'],'兵绿色打点',false)) do
				left_x = x
				统计 = 统计 + 1
				if 统计 > 15 then
					keepScreen(false)
					click(x,y)
					return true
				end
			end
		end
		
		left_x =  left_x + 1
	end
	
	keepScreen(false)
end



--兵()
--lua_exit()

function 金()
	left_x = 90
	统计 = 0
	keepScreen(true)

	while left_x < 1127 do
		
		aoc['lls']['土地上金']={ 0xfee239, "", 90, left_x, 68, 1127, 548}
		
		
		if c_p(aoc['lls']['土地上金'],'土地上金',false)then
			log(x..','..y)
			left_x = x
			统计 = 统计 + 1
			
			aoc['lls']['土地上金打点']={ 0xfee239, "", 90, left_x+1, 62, left_x+2, 548}
			while (c_p(aoc['lls']['土地上金打点'],'土地上金打点',false)) do
				left_x = x
				统计 = 统计 + 1
				if 统计 > 12 then
					keepScreen(false)
					click(x,y)
					log('金')
					return true
				end
				aoc['lls']['土地上金打点']={ 0xfee239, "", 80, left_x+1, 62, left_x+2, 548}
			end
		end
		
		left_x =  left_x + 1
	end
	
	keepScreen(false)
end

--金()
--lua_exit()


function 武器()
	left_x = 90
	统计 = 0
	keepScreen(true)

	while left_x < 1127 do
		
		aoc['lls']['土地上武器']={ 0x0cff04, "", 90, left_x, 68, 1127, 548}
		
		
		if c_p(aoc['lls']['土地上武器'],'土地上武器',false)then
			log(x..','..y)
			left_x = x
			统计 = 统计 + 1
			
			aoc['lls']['土地上武器打点']={ 0x0cff04, "", 90, left_x+1, 62, left_x+2, 548}
			while (c_p(aoc['lls']['土地上武器打点'],'土地上武器打点',false)) do
				left_x = x
				统计 = 统计 + 1
				if 统计 > 18 then
					keepScreen(false)
					click(x,y)
					mSleep(1000*5)
					log('金')
					return true
				end
				aoc['lls']['土地上武器打点']={ 0x0cff04, "", 80, left_x+1, 62, left_x+2, 548}
			end
		end
		
		left_x =  left_x + 1
	end
	
	keepScreen(false)
end

function other()
	if c_pic(aoc['lls']['中间蓝色确定'],'中间蓝色确定',true,1)then
	elseif done(aoc['lls']['开始游戏'],'开始游戏',false,1)then
		click(初始英雄[英雄][1],初始英雄[英雄][2])
		done(aoc['lls']['开始游戏'],'开始游戏',true,1)
	elseif done(aoc['lls']['选择您的国家'],'选择您的国家',false,1)or done(aoc['lls']['选择您的国家2'],'选择您的国家2',false,1)then
		click(国家坐标[国家][1],国家坐标[国家][2])
		--done(aoc['lls']['选择您的国家'],'选择您的国家',true,1)
		lua_exit()
		c_pic(aoc['lls']['进入国家'],'进入国家',true)
	elseif done(aoc['lls']['充值会员'],'充值会员',true,3)then
		return true
	end
end



aoc['lls']['建筑位置']={}
aoc['lls']['优先小建筑']={ 0x81b6c4, "-5|0|0xaacec1,-9|0|0x497f9a", 90, 100, 595, 1200, 607}


function play()
	local timeLine = os.time()
	local outime = 60*20
	民兵 = true
	领奖品 = true
	while (os.time()-timeLine < outime ) do
		if active(app,5)then
		elseif 领奖品 and done(aoc['lls']['游戏地图中'],'游戏地图中',false,1)then
			click(41,41)
			get_wood()
			领奖品 = false
			
		elseif done(aoc['lls']['城堡中'],'城堡中',false,1)then
			log('升级城堡')
			for i,v in pairs(aoc['lls']['资源位置']) do
				click(v[1],v[2])
			end
			if c_pic(aoc['lls']['有奖励可领'],'有奖励可领',true)then
			elseif c_pic(aoc['lls']['有奖励可领2'],'有奖励可领2',true)then
			elseif done(aoc['lls']['主城升级中'],'主城升级中',false,1)then
				return true
			else
				click(547,127)	--点击城堡
			end
		elseif done(aoc['lls']['升级建筑'],'升级建筑',false,1)then
			if c_p(aoc['lls']['文字颜色'],'文字颜色',false)and c_pic(aoc['lls']['建筑建造'],'建筑建造',true)then
				click(549,126)
				delay(10)
			elseif c_pic(aoc['lls']['新!'],'新!',true)then
				mSleep(1000*2)
			elseif c_pic(aoc['lls']['优先小建筑'],'优先小建筑',true)or c_pic(aoc['lls']['选择建筑'],'选择建筑',true) then
			elseif done(aoc['lls']['主城升级'],'主城升级',false)then
				if c_p(aoc['lls']['主城升级-木材不足'],'主城升级-木材不足',false)then
					click(417,461)
				elseif c_pic(aoc['lls']['主城升级-确定'],'主城升级-确定',true)then
				end
			end
		elseif done(aoc['lls']['战斗画面'],'战斗画面',false,1)then
			--开战 = 开战 or 0
			if c_p(aoc['lls']['超出例队'],'超出例队',false)then
				click(179,26)
				click(1054,573)
			else
				click(921,561)
			end
			log('正在战斗',true,1)
		
		elseif done(aoc['lls']['游戏地图中'],'游戏地图中',false,1)then
			
			if not(done(aoc['lls']['已有城堡'],'已有城堡',false)) then
				if 民兵 then
					if c_pic(aoc['lls']['红色民兵'],'红色民兵',true)then
						mSleep(1000*5)
					end
				end
				mun_c = mun_c or 4
				mun_c = mun_c + 1
				if mun_c%4 == 0 then
					nLog('找怪一次')
					怪()
				elseif mun_c%4 == 1 then
					nLog('找兵一次')
					兵()
				elseif mun_c%4 == 2 then
					if done(aoc['lls']['任务'],'任务',true,1)then
						mSleep(1000*2)
					end
				elseif mun_c%4 == 3 then
					if c_pic(aoc['lls']['身边怪'],'身边怪',true)then
					elseif c_pic(aoc['lls']['身边怪2'],'身边怪2',true)then
					elseif c_pic(aoc['lls']['最右城堡'],'最右城堡',true)then
					end
				end

			elseif done(aoc['lls']['已有城堡'],'已有城堡',true)then
				
			end
		elseif done(aoc['lls']['设置界面'],'设置界面',true,3)then
		elseif done(aoc['lls']['任务界面'],'任务界面',false,1)then
			if c_pic(aoc['lls']['领取'],'领取',true)then
			elseif c_pic(aoc['lls']['找到目标'],'找到目标',true)then
			elseif c_pic(aoc['lls']['找到目标2'],'找到目标2',true)then	
			end
		elseif done(aoc['lls']['世界地图界面'],'世界地图界面',false,1)then
			if c_pic(aoc['lls']['前往目标'],'前往目标',true)then
				mSleep(1000*5)
			end
		else
			if tips()then
				other()
			end
		end
		mSleep(1000)
	end
end

while (getBackupList()< 50 ) do
	if play()then
		abl_backup(app)
		abl()
	else
		abl()
	end
end


