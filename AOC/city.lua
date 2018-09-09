弹出经验卡 = { 0xfefefd, "-109|1|0xfefefd,-55|-55|0xfdfdcd,-54|54|0xcac999", 90, 538, 38, 791, 251 }
function box()
	time_line = os.time()
	out_time = 60*5
	local click_times = 0
	click_true = true
	
	while (os.time()-time_line < out_time) do
		if active(app,10)then
			启动画面 = 0
		elseif UI('在地图中','在地图界面',false,2)then
			UI_pic('宝箱','未展开',true)
		elseif UI_pic('宝箱','展开',false)then
			UI_pic('宝箱','宝库',true)
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','宝库界面',false,1)then
				width = 142
				height = 181
				left_box ={160,196}
				if click_true then
					click( left_box[1]+4*width,left_box[2])
					delay(2)
				end
				
				资源卡 = {}
				资源卡.金={ 0xe6e770, "19|18|0xeddf69,15|18|0xd59227", 90, 117, 359, 324, 447}
				资源卡.木={ 0xdfb67e, "4|-5|0xe2ca8d,11|-9|0xc19259", 90, 122, 361, 264, 450}
				资源卡.水={ 0x84f5f8, "10|-4|0x00c7de,5|-9|0x0b3b48", 90, 122, 361, 264, 450}
				资源卡.银={ 0x43f6ed, "16|-4|0xb2fea9,20|7|0xb9fea3", 90, 124, 361, 276, 446}
				资源卡.钻={ 0xff3d43, "-8|5|0xd00d15,-9|16|0xf2172e", 90, 124, 361, 276, 446}
				资源卡.晶={ 0xe73ede, "-3|-9|0x7e42fc,-7|-9|0x643cde", 90, 124, 361, 276, 446}
				首具卡 = { 0xf4d765, "0|1|0x1b2b2b,0|3|0xf0d363,0|12|0xf4d765", 90, 142, 297, 520, 342}
				判断是否为资源 = false
				if c_pic(首具卡,'首具卡',false)then
					for k,v in pairs(资源卡)do
						if c_pic(v,k,false)then
							判断是否为资源 = true
						end
					end
					if 判断是否为资源 then
						if UI_pic('宝箱','开启10次',true) or UI_pic('宝箱','开启1次',true)then
							click_true = false
						elseif UI('宝箱','领取',true,1)then
						else
							click_true = true
						end
					else				--如果不是资源卡需要退出
						return true
					end
				else
					if UI_pic('宝箱','开启10次',true) or UI_pic('宝箱','开启1次',true)then
						click_true = false
					else
						click_true = true
					end
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('宝箱','领取',true,1)then
		elseif c_pic(弹出经验卡,'弹出经验卡',false)then
			return true
		else
		end
	end
	mSleep(1000)
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
	计时 = os.time()
	超时 = 60*3
	优先主城 = setting[13]
	不造仓库的轮回 = 0
	开箱一次 = true
	活动星星打开一次 = true
	local 采集信息 = true
	local 上传信息 = true
	--local 技能bug = true
	show = {}
	城市中的爵位 = true
	
	
	while (os.time()-计时<超时) do
		if active(app,10)then
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','挑战赛界面')then
				if UI_pic('返回','可以领奖',true)then
					mSleep(1000)
				elseif UI('返回','活动中心可以抽奖',true)then
				elseif UI_pic('返回','活动右侧例表',true)then
				else
					moveTo(1181,500,1181,300,20)
					click(1185,225)
					if not UI_pic('返回','活动右侧例表',true) then
						UI('返回','返回图标',true,1)
					end
				end
			elseif setting[0] and UI('返回','邮件界面')then
				if UI_pic('返回','礼包红点',true)then
					log('滑动一次')
					if UI_pic('返回','奖励确定',true)then
					else
						moveTo(450,600,450,250,20)
						delay(2)
					end
--				elseif c_p(aoc['城堡']['邮件红点'],'邮件红点',true)then
				else
					if UI_pic('返回','有邮件在',false)then
						UI('返回','返回图标',true,1)
					else
						moveTo(1058,146,1058,186,20)
						delay(1)
						moveTo(1217,146,1016,146,10)
						if UI_pic('返回','邮件不能删除',false)then
							moveTo(1058,146,1058,186,20)
							moveTo(1058,146,1058,186,20)
						elseif UI_pic('返回','邮件可以删除',true)then
							log('删除一次')
						end
					end
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
--			elseif setting[3] and UI('返回','英雄',false,1)then
--				if UI('返回','英雄界面',false,1)then
--					toast('英雄界面',1)
--					if UI('返回','有新装备提示界面')then
--						if UI_pic('返回','英雄装备',true,1)then
--							click(228,215)
--							UI_pic('返回','英雄穿戴',true,1)
--						end
--					elseif UI('返回','有装备可穿',true,1)then
--					elseif UI_pic('返回','天赋学习',true)then
--					elseif UI('返回','天赋',true,1)then
--					else
--						UI('返回','返回图标',true,1)
--					end
					
--				elseif UI_pic('返回','英雄红点',true,1)then
--				else
--					if UI('返回','英雄展开',true,1)then
--					elseif c_p(aoc['返回']['英雄未获得'],'英雄未获得',false)then
--						moveTo(600,300,400,300,10)
--					else
--						UI('返回','返回图标',true,1)
--					end
--				end
				--点击城堡-----------------------------------------
			elseif UI('城堡','在城堡中',false,1)then
				if 上传信息 and values.oneormore ~= '1' then
					get_info(aoc_zy['city'])
					click(622,75,2)
					if UI('other','资源例表')then
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
						上传信息 = false
					end
				else
					delay(1.5)
					if kuang_setting[5]==false and UI_pic('城堡','木材',true)then
					end
					if kuang_setting[4]==false and UI_pic('城堡','金币',true)then
					end
					if kuang_setting[3]==false and UI_pic('城堡','泉水',true)then
					end
					
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
--					moveTo(100,670,300,670,5)
--					log('滑动一下')
					delay(1)
					
					if 优先主城 and UI_pic('城堡','主城建筑',true)then
					elseif 造新建筑 and UI_pic('城堡','新建筑',false)then
						log(x..','..y)
						aoc['城堡']['新仓库']={ 0xe27c48, "8|-9|0xd49044,43|7|0x938045,41|-24|0xdf8c47", 90, x-74, y+13, x+45, y+122}
						if UI_pic('城堡','新仓库',false)then
							造新建筑 = false
						else
							log('非仓库')
							UI_pic('城堡','新建筑',true)
						end
					elseif UI_pic('城堡','非主城建筑',false)then		--非主城
						log(x..','..y)
						aoc['城堡']['仓库文字']={ 0x3d5765, 
							"0|-2|0xffffff,2|-5|0x3f5a66,2|-12|0x415c67,17|-5|0x405866,19|-5|0xffffff", 90, x-31, y, x+35, y+32}
						if UI_pic('城堡','仓库文字',false)then
							不造仓库的轮回 = 不造仓库的轮回 + 1
							if 不造仓库的轮回 % 2 == 1 then
								log('仓库右')
								aoc['城堡']['非主城建筑'][4]=x+80
								aoc['城堡']['非主城建筑'][6]=1200
							else
								log('仓库左')
								aoc['城堡']['非主城建筑'][4]=100
								aoc['城堡']['非主城建筑'][6]=x-70
							end
						end
						
						if UI_pic('城堡','非主城建筑',true)then
							log('找到建筑')
						end
						aoc['城堡']['非主城建筑']={ 0x81b6c4, "76|0|0x2c7482,-62|0|0x488099", 90, 0, 706, 1333, 708}
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
			elseif setting[22] and 活动星星打开一次 and UI_pic('在地图中','活动星星',true)then
				活动星星打开一次 = false
			elseif setting[22] and UI_pic('在地图中','活动奖励',true)then					--活动中心
			elseif setting[0] and UI('城堡','邮件提醒',true,1)then		--邮件提示
			elseif setting[1] and UI('城堡','商城红点',true,1)then		--商城提示
			--elseif setting[2] and UI('城堡','有任务奖励',true,1,80)then		--有任务奖励
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





