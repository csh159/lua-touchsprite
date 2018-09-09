require("TSLib")
require("tsp")
require("阿波罗")
require("ALZ")






init('0',0);
appbid = 'com.yuanmusic.YuanMusicApp';

--爱乐赞id 取手机号用
id = 70740
ALZ()
account_path = '/User/Media/TouchSprite/res/元音乐.txt';

page={}
page['元音乐']={}

--注册往返
function reg()
	计时 = os.time()
	超时 = 60 * 3
	取号 = true
	取短信 = true
	--------
	头像 = true
	昵称 = true
	生日 = true
	简介 = true
	提交 = false
	
	page['元音乐']['我的']={{399,1081,0x666666},{399,1068,0x000000},{399,1056,0x666666},}	--1
	page['元音乐']['注册']={{578,85,0xffffff},{343,71,0x606265},{33,81,0xfcfcfc},}			--1
	page['元音乐']['注册界面']={{340,68,0xe7e7e7},{340,67,0x626165},{33,81,0xfcfcfc},}		--不需点击
		page['元音乐']['手机号']={ 0xaeb0b8, "0|-6|0xaeb1ba,-9|-18|0xaeb0b9", 90, 49, 218, 171, 273}
		page['元音乐']['密码']={ 0xc1c2c5, "-13|7|0xc2c3c5,-21|-16|0xc0c2c5", 90, 47, 338, 159, 397}
		page['元音乐']['获取验证码']={ 0xffffff, "0|-30|0xffffff,41|28|0xfefefe", 90, 331, 435, 608, 519}
		page['元音乐']['验证码']={ 0xb2b4b9, "-25|-19|0xb5b8bd,-53|6|0xbbbdc0", 90, 40, 457, 173, 516}
		page['元音乐']['注册提交']={ 0xef544c, "-29|-4|0xef544c", 90, 272, 651, 373, 706}
		
	page['元音乐']['个人信息填写']={{230,81,0xffffff},{229,76,0x000000},{420,71,0x000000},{422,69,0xffffff},}
		page['元音乐']['头像']={ 0xc7c7cc, "-8|0|0xffffff,-8|9|0xc7c7cc", 90, 578, 149, 623, 209}
			page['元音乐']['相册']={ 0x007aff, "-11|-6|0x007aff,-33|-10|0x007aff", 90, 272, 908, 377, 964}
			page['元音乐']['时刻']={ 0xc7c7cc, "-11|0|0xffffff,-5|7|0xc7c7cc", 90, 564, 173, 627, 266}
			page['元音乐']['时刻界面']={{350,69,0xffffff},{350,67,0x000000},{310,78,0x000000},}
			
		page['元音乐']['昵称']={ 0xc7c7cd, "-5|-11|0xc7c7cd,-3|-22|0xc7c7cd", 90, 203, 250, 628, 317}
		page['元音乐']['性别']={{422,381,0xf0665f},{541,382,0x050505},}
		page['元音乐']['生日']={ 0xc7c7cc, "-11|4|0xffffff,-6|8|0xc7c7cc", 90, 582, 456, 616, 506}
		page['元音乐']['简介']={ 0xc7c7cc, "-11|-1|0xffffff,-9|8|0xc7c7cc", 90, 579, 549, 621, 605}
	page['元音乐']['编辑简介']={{580,85,0xffffff},{574,87,0x000000},{380,79,0xffffff},{380,77,0x000000},}	--1完成
		

	while os.time()-计时<超时 do
		if active(appbid,3)then
		elseif done(page['元音乐']['我的'],'我的',true,1)then
		elseif done(page['元音乐']['注册'],'注册',true,1)then
	elseif done(page['元音乐']['个人信息填写'],'个人信息填写',false,1)then
		
			if 提交 then
				click(589,83)
				return true
			end
			
			if 昵称 then
				if c_pic(page['元音乐']['昵称'],'昵称',true)then
					nickname = myRand(7,math.random(5,9))
					input(nickname)
					mSleep(1000)
					昵称 = false
				end
			end
			
			if 性别 then
				sex = math.random(1,2)
				click(page['元音乐']['性别'][sex][1],page['元音乐']['性别'][sex][2])
				性别 = false
			end
		
			if 生日 then
				if c_pic(page['元音乐']['生日'],'生日',true)then
					moveTo(156,824,156,1023,50,math.random(20,50))
					mSleep(1000* 3)
					click(585,659)	--点确定
					性别 = false
				end
			end
			
			if 头像 then
				clearAllPhotos()	--清空相册
				delay(1)
				local_pic = '/User/Media/TouchSprite/res/music.png'
				web_pic = 'http://lorempixel.com/300/300/'
				downFile(web_pic,local_pic)
				saveImageToAlbum('music.png')
				delay(3)
				
				if c_pic(page['元音乐']['头像'],'头像',true)then
					outTime = os.time()
					while (os.time()-outTime < 30) do
						if c_pic(page['元音乐']['头像'],'头像',true)then
						elseif c_pic(page['元音乐']['相册'],'相册',true)then
						elseif c_pic(page['元音乐']['时刻'],'时刻',true)then
						elseif done(page['元音乐']['时刻界面'],'时刻界面',false,0)then
							click(81,327)
							click(584,1063)
							break
						end
					end
					头像 = false
				end
			end

			if 简介 then
				if c_pic(page['元音乐']['简介'],'简介',true)then
					简介 = false
				end
			end
			
		elseif done(page['元音乐']['编辑简介'],'编辑简介',false,1)then
			input(myRand(7,math.random(20,45)))
			done(page['元音乐']['编辑简介'],'编辑简介',true,1)
			提交 = true
			--简介完成
		elseif done(page['元音乐']['注册界面'],'注册界面',false,1)then
			if 取号 and c_pic(page['元音乐']['手机号'],'手机号',true)then
				if GET_Phone(id,token)then
					取号 = false
					input(phone)
					click(319,1081)
				end
			else
				if 取号 == false then
					if c_pic(page['元音乐']['密码'],'密码',true)then
						password = myRand(4,math.random(6,10))
						input(password)
						--click(318,1091)
						--click(602,982)
						click(33,591)
					end
					if c_pic(page['元音乐']['获取验证码'],'获取验证码',true)then
						delay(3)
						out_time = os.time()
						while (true) do
							if getMessage(id,phone,token)then
								if c_pic(page['元音乐']['验证码'],'验证码',true)then
									input(dxyzm)
									click(320,1080,0.1)
									click(540,1085)
									click(33,591)
									break
								end
							end
							if os.time()-out_time > 65 then
								addBlacklist(id,phone,token)
								return false
							end
						end
					end
					mSleep(1000* 3)
					if c_pic(page['元音乐']['注册提交'],'注册提交',true)then
						writeFile(account_path,'元音乐'..'	'..phone..'	'..password)
					end
				end
			end
		else
			log('-:)')
		end
		delay(1)
	end
end

abl()
reg()














