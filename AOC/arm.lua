	
function 收兵()
	for i,v in ipairs(aoc['造兵']['收兵位置'])do
		aoc['造兵']['兵好']={ 0xffff83, "0|3|0xffff82,2|3|0xb6ff4f", 90, v[1], v[2], v[3], v[4]}
		if UI_pic('造兵','兵好',true)then
			delay(2)
		end
		if UI('城堡','在城堡中',false,1)then
		else
			UI('返回','返回图标',true,1)
		end
	end
end

function arm()
	计时 = os.time()
	超时 = 60*1
	造兵一次 = false
	研究一次 = false
	if setting[11] == false and setting[10] == false and setting[17] == false then
		return false
	end
	
	while (os.time()-计时< 超时) do
		if active(app,10)then
		elseif UI('在地图中','在地图界面',true,2)then	
		elseif UI('返回','返回图标',false,1)then
			if UI('城堡','在城堡中',false,1)then
				if setting[11] or setting[17] or setting[5] then
					收兵()
					for i = 5,9 do
						if setting[i] then
							if UI('城堡','在城堡中',false,1)then
								click(兵营位置[i][1],兵营位置[i][2])
								delay(2)
								if i == 5 then
									if UI('返回','医院',false,1)then
										while UI('返回','医院空') ~= true and c_p(aoc['返回']['医院满队'],'医院满队',false)~= true do
											click(258,236,0.2)
										end
										UI('返回','返回图标',true,1)
										delay(2)
									end
								else
									
									if UI('返回','兵营界面',false,1)then
										if setting[17] then
											local updata_time = os.time()
											local updata_line = 60*5
											while (os.time()-updata_time < updata_line ) do
												if UI('返回','军队升级按钮',true,1)then
												elseif UI('返回','兵营界面',false,1)then
													if UI_pic('返回','军队可升级',true)then
														click(269,285)
													else
														break
													end
												else
													if UI('返回','返回图标',false,1)then
														click(1184,240)
													else
														break
													end
												end
											end
										end
										
										if setting[11] then
											for k = 1,60 do
												if c_p(aoc['返回']['兵营满队'],'兵营满队',false)or c_p(aoc['返回']['军队已满'],'军队已满',false)then
													break
												else
													click(278,223,0.2)
												end
											end
											delay(2)
										end
										
										UI('返回','返回图标',true,1)
										delay(2)
									else
										click(661,258)
									end
								end
							end
						end
					end
					
				end
				
				---研究开始
				if setting[10] then
					if UI_pic('返回','研究完成',true)then
						click(656,506)
						delay(4)
					end
					click(研究院位置[1],研究院位置[2])
					delay(2)
					-----只研究一次
					if UI('返回','研究院')then
						if tonumber(values.keji_setting) == 5 then  --研究车子
							moveTo(900,400,500,400,50)
						end
						
						delay(2)
						click(科技位置[tonumber(values.keji_setting)][1],科技位置[tonumber(values.keji_setting)][2])
						if UI_pic('返回','研究空',true)or UI_pic('返回','研究蓝',true)then
							if UI('返回','研究',true,1)then
							elseif UI('返回','加入研究院',true,1)then
							end
						end
						return true
					end
				else
					return false
				end
			else
				UI('返回','返回图标',true,1)
			end
		else
			log('tip')
			other()
		end
		mSleep(1000)
	end
	
end
