	

function arm()
	local 计时 = os.time()
	local 超时 = 60*1
	local 研究一次 = false

	if setting[10] then
		while (os.time()-计时< 超时) do
			if 研究一次 then
				return true
			end
			
			if active(app,5)then
			elseif UI('在地图中','在地图界面',true,2)then	
			elseif UI('返回','返回图标',false,1)then
				if UI('城堡','在城堡中',false,1)then
					---研究开始
					if UI_pic('返回','研究完成',true)then
						click(656,506)
						delay(4)
					end
					click(研究院位置[1],研究院位置[2])
					delay(2)
					-----只研究一次
					if UI_pic('返回','研究院界面')then
						if tonumber(values.keji_setting) == 5 then  --研究车子
							moveTo(900,400,500,400,50)
						end
						delay(2)
						click(科技位置[tonumber(values.keji_setting)][1],科技位置[tonumber(values.keji_setting)][2])
						if UI_pic('返回','研究空',true)or UI_pic('返回','研究蓝',true)then
							if UI_pic('返回','研究按钮_研究',true,1)then
							elseif UI('返回','加入研究院',true,1)then
							end
						end
						研究一次 = true
					end
				else
					UI('返回','返回图标',true,1)
				end
			else
				other()
			end
			mSleep(1000)
		end
	end
end
