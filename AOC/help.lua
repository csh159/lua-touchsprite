







function help_other()
	if active(app,10)then
	elseif UI('换服','在地图上')then
	elseif UI('新手','战斗界面中',false,1)then
		if UI('新手','战斗准备',false,1)then
			
			预设位置={{1045,162,0x0a0c04},{1220,166,0x0d0e08},{1041,257,0x060c07},
				{1220,252,0xffffff},{1048,350,0xdbdbdb},{1227,348,0x090c08},{1044,442,0x0d0f05},{1222,443,0x111609},}
			--values.yiji_arm 预设编号(0,1,2,3)设置1,设置2,设置3,全上
			if tonumber(values.yiji_arm) == 8 then
				if c_p(aoc['新手']['超出队伍'],'超出队伍',false)then
					click(178,31)		--撤回
					click(1238,673)		--攻击
					delay(2)
				else
					上兵统计 = 上兵统计 + 1
					if 上兵统计 >= 15 then
						click(1238,673)		--攻击
						delay(2)
					else
						if UI_pic('战斗','受伤英雄',false)then
							return true
						else
							click(1086,663) 	--点英雄
						end
					end
				end
			else
				if UI('other','预设未展开',true,1)then
				elseif UI('other','预设展开',false,1)then
					click(预设位置[tonumber(values.yiji_arm)+1][1],预设位置[tonumber(values.yiji_arm)+1][2])
					UI('other','可以战斗',true,1)
				end
			end
			
		elseif UI_pic('新手','寻找英雄',false)then
			if x < 700 and y > 250 then
				log('英雄位置正常')
				if UI_pic('战斗','英勇跳跃',true) or UI_pic('战斗','箭雨',true) then
					UI_pic('战斗','攻击目标',true)
					UI_pic('战斗','取消',true)
				end
				
			end
			if x > 700 then
				moveTo(450,300,300,300,20,20)
			end
			delay(0.5)
			if y < 250 then
				moveTo(300,300,300,450,20,20)
			end
		else
			moveTo(500,600,400,600,20,20)
		end
	elseif UI('新手','招到英雄',true,1)then
	elseif UI('新手','招英雄确定',true,1)then
	elseif UI('新手','英雄升级',true,1)then
	elseif UI('新手','英雄结算画面',true,1)then

	elseif setting[4] and UI('新手','战斗胜利',true,1)then
	elseif UI('新手','战斗胜利',false,1)then
		vibrator()
		delay(5)
	elseif UI('other','恢复药',true,1)then
	elseif UI('other','体力药',true,1)then
	elseif UI('新手','招兵确定',true,1)then
	elseif UI('other','运送矿点',true,1)then
	elseif UI('other','拦劫',true,1)then
	elseif UI('other','成功抢车',true,1)then
	elseif UI('other','取消战斗',true,1)then
		delay(3)
	elseif UI('other','被点确认',true,1)then
		delay(60*math.random(1,2))
	elseif UI('other','误点水泉',true,1)then
	elseif UI('other','误攻城堡',false,1)then
		click(40,40)
	elseif UI('other','公会信息',false,1)then
		click(40,40)
	elseif UI('other','顶号',false,1)then
		delay(60*5)
		UI('other','顶号',true,1)
	elseif UI('other','聊天退出',true,1)then
	elseif UI('other','暂停界面',true,2)then
	elseif UI('other','选择国家界面')then
		国家选择 = tonumber(values.world)+1
		click(aoc['国家位置'][国家选择][1],aoc['国家位置'][国家选择][2])
		UI('other','选国界面',true,1)
	elseif UI('other','开始旅程',false,2)then
		英雄选择 = tonumber(values.hero)+1
		click(aoc['英雄位置'][英雄选择][1],aoc['英雄位置'][英雄选择][2])
		UI('other','开始旅程',true,1)
		delay(10)
	else
		return true
	end
	
end

function help()
	help_other()
	mSleep(1000)
end


function ad()
	out_time = os.time()
	doing = 0
	发送ad = false
	
	while (os.time()-out_time < 60*3) do
		if active(app,10)then
		elseif UI('聊天','聊天界面')or UI('聊天','聊天界面2')then
			if UI_pic('聊天','聊天界面_世界频道',true)then
			elseif UI('聊天','聊天界面_世界频道_界面')then
				if UI_pic('聊天','聊天界面_世界频道_界面_发送',true)then
					delay(30)
					return true
				elseif UI_pic('聊天','聊天界面_世界频道_界面_发言位置')then
					click(x+200,y)
					input(values.ad)
					click(675,712)
				end
			end
		elseif UI('在地图中','在地图界面')then
			log("准备发广告")
			UI_pic('换服','聊天按钮',true)
		else
			if  UI('返回','返回图标',true,1)then 
			else
				other()
			end
		end
		mSleep(1000)
	end
	
end

--[[
function change()
	out_time = os.time()
	doing = 0
	
	while (os.time()-out_time < 90) do
		if active(app,10)then
		elseif UI('换服','在地图上')then
			if UI_pic('地图','王国',true)then
			elseif UI('地图','侧边',true,1)then
			end
		elseif UI('返回','返回图标',false,1)then
			
			
	--		if UI('返回','纯白之帆利萨姆')then
			if UI('返回','银翼之国桑多瑞')then
				if UI_pic('地图','移民按钮',true)then
				else
					return true
				end
			elseif UI('返回','转国界面')then
				click(1236,39)
				--纯白之帆利萨姆 click(1174,115)
				click(1184,446)
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('other','移民按钮',true,1)then
			doing = doing + 1
			if doing == 2 then
				return true
			end
		else
			other()
		end
		mSleep(1000)
	end
	
end
--]]








