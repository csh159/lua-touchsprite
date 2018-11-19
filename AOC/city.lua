


----------------------------------------------------开宝箱---------------------------
function box()
	local time_line = os.time()
	local out_time = 60*2
	
	while (os.time()-time_line < out_time) do
		if active(app,10)then
		elseif UI('在地图中','在地图界面',false,2)then
			UI_pic('宝箱','未展开',true)
		elseif UI_pic('宝箱','展开',false)then
			UI_pic('宝箱','宝库',true)
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','宝库界面',false,1)then
				if (UI('返回','宝库界面_宝箱')) then
					if not(UI_pic('宝箱','宝库_无物品'))then
						return true
					end
					click(167,252)
					if UI_pic('宝箱','开启10次',true) or UI_pic('宝箱','开启1次',true)then end
				else
					click(771,91)
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('宝箱','领取',true,1)then
		end
		mSleep(1000)
	end
end


function 商店购买()
	if UI_pic('返回','金币可以购买',false)then
		金币不足 = {0xff4b4b,"",90,x+29,y-3,x+136,y+35}
		希有位置 = {19,-178,127,-69}
		稀有合集 = {}
		if setting[12] then
			稀有合集['水晶稀有'] = { 0xbb6fee, "14|-2|0x662bc6,29|-12|0xe9ccf5,55|37|0xf1bcff", 90, x+19, y-178, x+127, y-69}
			稀有合集['血钻稀有'] = { 0x9a1824, "4|-8|0xffffff,24|-4|0xff2533,5|37|0xee1a2b", 90, x+19, y-178, x+127, y-69}
			稀有合集['密银稀有'] = { 0x44f1ed, "-17|22|0x22bbb2,-5|48|0x22bbaa,12|59|0x25d863", 90, x+19, y-178, x+127, y-69}
		end
		if setting[18] then
			稀有合集['木材'] = { 0xc8a373, "23|-10|0x997646,25|2|0x281611,35|35|0xf5c273", 90, x+19, y-178, x+127, y-69}
		end
		if c_p(金币不足,'金币不足',false) then
			return false
		else
			for k,v in pairs(稀有合集)do
				if c_pic(v,k,true)then
					return true
				end
			end
		end
	end
	
	if UI_pic('返回','金币可以购买2',false)then
		金币不足 = {0xff4b4b,"",90,x+29,y-3,x+136,y+35}
		希有位置 = {19,-178,127,-69}
		稀有合集 = {}
		if setting[12] then
			稀有合集['水晶稀有'] = { 0xbb6fee, "14|-2|0x662bc6,29|-12|0xe9ccf5,55|37|0xf1bcff", 90, x+19, y-178, x+127, y-69}
			稀有合集['血钻稀有'] = { 0x9a1824, "4|-8|0xffffff,24|-4|0xff2533,5|37|0xee1a2b", 90, x+19, y-178, x+127, y-69}
			稀有合集['密银稀有'] = { 0x44f1ed, "-17|22|0x22bbb2,-5|48|0x22bbaa,12|59|0x25d863", 90, x+19, y-178, x+127, y-69}
		end
		if setting[18] then
			稀有合集['木材'] = { 0xc8a373, "23|-10|0x997646,25|2|0x281611,35|35|0xf5c273", 90, x+19, y-178, x+127, y-69}
		end
		if c_p(金币不足,'金币不足',false) then
			return false
		else
			for k,v in pairs(稀有合集)do
				if c_pic(v,k,true)then
					return true
				end
			end
		end
	end

end



function city()
	local 计时 = os.time()
	local 超时 = 60*3
	优先主城 = setting[13]
	不造仓库的轮回 = 0
	开箱一次 = true
	活动星星打开一次 = true
	local 采集信息 = true
	local 上传信息 = true
	--local 技能bug = true
	show = {}
	城市中的爵位 = true
	修墙一次 = true
	
	
	while (os.time()-计时<超时) do
		if active(app,5)then
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','挑战赛界面')then
				if not(UI_pic('返回','跨服公会战')) and UI_pic('返回','可以领奖',true)then
					mSleep(1000)
				elseif UI('返回','活动中心可以抽奖',true)then
				elseif UI_pic('返回','活动右侧例表',true)then
					right_red_tips = right_red_tips or 1
					right_red_tips = right_red_tips + 1
					if right_red_tips % 5 == 0 then
						click(1185,225)
					end
				else
					moveTo(1181,500,1181,300,20)
					moveTo(1181,500,1181,300,20)
					moveTo(1181,500,1181,300,20)
					click(1185,225)
					if not UI_pic('返回','活动右侧例表',true) then
						UI('返回','返回图标',true,1)
					end
				end
			elseif setting[0] and UI('返回','邮件界面')then
				if UI_pic('返回','邮件界面_一键',true)then
				else
					UI('返回','返回图标',true,1)
				end
			elseif setting[1] and UI('返回','商城界面',false,1)then
				if UI('返回','宝箱翻页',true,1)then
				elseif UI('返回','宝箱界面')and UI_pic('返回','免费宝箱',false)then
					click(564,680)
				elseif UI_pic('返回','宝箱红点',true)then
				elseif UI('返回','商城')then
					if 商店购买() then
					elseif UI_pic('返回','最右端',false)then
						toast('购买完成',1)
						UI('返回','返回图标',true,1)
					else
						moveTo(600,375,400,375,10)
					end
				else
					UI('返回','返回图标',true,1)
				end
			elseif setting[3] and 城市中的爵位 and UI('城堡','技能提示',true)then
			elseif 城市中的爵位 and UI('城堡','技能提示_爵位展开',false,1)then
				if UI_pic('城堡','英雄技能',true) then
					
				else
					城市中的爵位 = false
				end
			
			elseif UI('返回','爵位',false,1)then
				if UI_pic('返回','晋升',true)then
				else
					UI('返回','返回图标',true,1)
					click(250,371)
				end

				--点击城堡-----------------------------------------
			elseif UI('城堡','在城堡中',false,1)then
				if 主线 == 4 and 修墙一次 then
					墙list={{11,371,0x1fa893}, {54,371,0xccc27d}, {592,252,0xe5fff7}, {987,527,0x36bcbd}, }
					for i,v in ipairs(墙list) do
						click(v[1],v[2],2)
					end
					修墙一次= false
				end
				
				if 上传信息 and values.oneormore ~= '1' then
					get_info(aoc_zy['city'])
					click(622,75,2)
					keepScreen(true)
					get_info(aoc_zy['资源'])
					show['iphonename']= iphonename
					show['imei']=imei
					show['idfa']=idfa
					show['awz']= awz_mun
					show['who']= values.who
					
					for k,v in pairs(show) do
						log(k..":"..v)
					end
					keepScreen(false)
					upAoc(show)
					upAoc_wenfree(show)
					上传信息 = false
				else
					delay(1.5)
					if kuang_setting[5]==false and UI_pic('城堡','木材',true)then	end
					if kuang_setting[4]==false and UI_pic('城堡','金币',true)then	end
					if kuang_setting[3]==false and UI_pic('城堡','泉水',true)then	end
					
					if UI_pic('城堡','主城升级中',false)or UI_pic('城堡','主城等待中',false)then
						return true
					else
						if UI_pic('城堡','点击城堡',true)then
						elseif UI_pic('城堡','点击城堡2',true)then
						else
							log('点击城堡')
							click(689,165,2)
						end
					end
					---------------------------------------------------
					if UI_pic('城堡','进入主城',false)then
						click(642,123)
						return true
					else
						log('主城无状态')
					end
					
				end
				
			elseif UI('城堡','建筑展开',false,1)then

				if UI('城堡','主城升级提示')or UI_pic('城堡','主城升提示',false) then
					if c_p(aoc['城堡']['繁荣不足'],'繁荣不足',false)then
						click(498,543)
						优先主城 = false
					elseif c_p(aoc['城堡']['木材不足'],'木材不足',false)then	--直接结束攒木头
						click(498,543)
						return false
					else
						click(813,544)
						return true
					end
				elseif UI_pic('城堡','建筑提示',false)and UI_pic('城堡','建造',true)then
					click(689,165)
					优先主城 = true
				elseif UI_pic('城堡','建筑提示',false)and UI_pic('城堡','建造资源不足',false)then
					delay(1)
					return false
				else
					delay(1)
					if 优先主城 and UI_pic('城堡','主城建筑',true)then
					elseif UI_pic('城堡','非主城建筑',true)then		--非主城
					elseif UI_pic('城堡','主城建筑',true)then
					end
				end

			else
				UI('返回','返回图标',true,1)
			end

		elseif UI('在地图中','在地图界面',false,2)then
			if 采集信息 then
				click(40,40,2.5)
				if UI('返回','设置',false,1)then
					keepScreen(true)
					country_table = {}
					country_table['绿']={{954,287,0x6bc611},}
					country_table['紫']={{954,288,0x692de0},}
					country_table['黄']={{954,287,0xfff81d},}
					country_table['青']={{954,288,0x27b9ff},}
					country_table['橙']={{954,287,0xff8d06},}
					country_table['蓝']={{955,288,0x5052ff},}
					
					for k,v in pairs(country_table)do
						if done(v,k)then
							show['country'] = k
						end
					end
					get_info(aoc_zy['set'])
					采集信息 = false
					keepScreen(false)
				end
			elseif setting[22] and UI_pic('在地图中','活动奖励',true)then					--活动中心
			elseif setting[0] and UI_pic('城堡','邮件提醒',true,1)then		--邮件提示
			elseif setting[1] and UI('城堡','商城红点',true,1)then		--商城提示
			elseif 开箱一次 and setting[19] then
				box()
				开箱一次 = false
			end
			UI('在地图中','在地图界面',true,2)
		elseif UI('城堡','成功为会员',true,2)then
			return true
		
		else
			log('tip')
			other()
		end
		delay(0.5)
	end
end





