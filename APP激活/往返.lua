require("TSLib")
require("tsp")
require("阿波罗")
require("ALZ")



init('0',0);
appbid = 'com.amolcommute.passenger';
--爱乐赞id 取手机号用
id = 34037
ALZ()
account_path = '/User/Media/TouchSprite/lua/往返.txt'

page={}
page['往返']={}

function input_phone()
	for i =1,string.len(phone) do
		nLog(string.sub(phone,i,i))
		phone_mun_input = tonumber(string.sub(phone,i,i))
		click(page['往返']['手机输入'][phone_mun_input][1],page['往返']['手机输入'][phone_mun_input][2],0.2)
	end
end

--注册往返
function reg()
	计时 = os.time()
	超时 = 60 * 3
	取号 = true
	头像 = true
	昵称 = true

	page['往返']['下一页']={{317,1024,0xff6720},{315,994,0xff6720},{317,1054,0xff6720},}	--1
	page['往返']['开启']={{320,1025,0xff6720},{321,994,0xff6720},{318,1055,0xff6720},}		--1
	page['往返']['开启注册']={{186,903,0xff6720},{446,908,0xff6220},{334,203,0xff3331},}	--1

	page['往返']['注册界面']={{34,82,0xffffff},{322,188,0xffb913},{581,84,0xffffff},}		--1
	page['往返']['手机号']={ 0xc7c7cd, "0|-8|0xceced4,170|16|0xc7c7cd", 90, 67, 340, 347, 391}
	page['往返']['获取验证码']={ 0xff4f1a, "-54|-11|0xff5826", 90, 436, 417, 580, 473}
	page['往返']['验证码']={ 0xc7c7cd, "-32|-12|0xc7c7cd,-72|-1|0xc7c7cd", 90, 58, 418, 235, 465}
	page['往返']['设置密码']={ 0xc7c7cd, "-6|-20|0xc7c7cd,-109|-17|0xc7c7cd", 90, 55, 492, 310, 555}
	page['往返']['注册提交']={ 0xfff0ec, "-2|-8|0xff4f1a,-1|-29|0xff4f1a", 90, 230, 632, 444, 714}
	
	page['往返']['完善资料']={{380,69,0xffffff},{378,69,0xff3430},{323,70,0xfff6f6},{321,70,0xff3430},}
		page['往返']['头像']={ 0xffffff, "-2|-31|0xffffff", 90, 262, 213, 376, 295}
		page['往返']['从相册']={ 0x007aff, "0|-25|0x007aff", 90, 171, 897, 490, 967}
		page['往返']['照片']={{343,76,0x1a1919},{343,79,0xf9f9f9},{343,85,0x1a1919},}
		page['往返']['时刻']={ 0xc7c7cc, "-11|0|0xffffff,-5|7|0xc7c7cc", 90, 564, 173, 627, 266}
		page['往返']['时刻界面']={{351,72,0x1a1919},{347,75,0xf9f9f9},{344,81,0x1a1919},}
		
		page['往返']['昵称']={ 0xc7c7cd, "-26|-12|0xc7c7cd", 90, 198, 373, 379, 422}
		page['往返']['完成']={ 0xffffff, "-5|0|0xff6220,-5|-12|0xffffff", 90, 266, 704, 376, 762}
		page['往返']['注册完成']={{314,511,0xfffefe},{316,556,0xffca01},{359,543,0xffca01},{530,494,0xffffff},}
	
	page['往返']['手机输入']={
		{113,746,0x000000},{325,748,0xffffff},{541,742,0x000000},
		{115,854,0x000000},{312,850,0x000000},{542,848,0x000000},
		{112,959,0x000000},{319,958,0x000000},{538,962,0x000000},
		[0]={319,1082,0xffffff},
		}


	while os.time()-计时<超时 do
		if active(appbid,3)then
		elseif done(page['往返']['下一页'],'下一页',true,1) or done(page['往返']['开启'],'开启',true,1)then
		elseif done(page['往返']['开启注册'],'开启注册',true,1)then		
		elseif done(page['往返']['注册完成'],'注册完成',true,1)then
			return true
		elseif done(page['往返']['完善资料'],'完善资料',false,1)then
			if 头像 then
				clearAllPhotos()	--清空相册
				delay(1)
				local_pic = '/User/Media/TouchSprite/res/music.png'
				web_pic = 'http://lorempixel.com/300/300/'
				downFile(web_pic,local_pic)
				saveImageToAlbum('music.png')
				delay(3)
				
				if c_pic(page['往返']['头像'],'头像',true)then
					outTime = os.time()
					while (os.time()-outTime < 30) do
						if c_pic(page['往返']['从相册'],'从相册',true)then
						elseif done(page['往返']['照片'],'照片',false,1)then
							click(606,217)
						elseif done(page['往返']['时刻界面'],'时刻界面',false,0)then
							click(81,327)
							click(584,1063)
							
							delay(8)
							break
						elseif c_pic(page['往返']['头像'],'头像',true)then
						end
					end
					头像 = false
				end
			end
			

				if c_pic(page['往返']['昵称'],'昵称',true)then
					nickname = myRand(7,math.random(5,9))
					input(nickname)
					click(33,591)
					昵称 = false
				end

			sex={{253,528,0xfdede7},{468,527,0xfdede7},}
			sex_choice = math.random(1,2)
			click(sex[sex_choice][1],sex[sex_choice][2])
					
			c_pic(page['往返']['完成'],'完成',true)
			
		elseif done(page['往返']['注册界面'],'注册界面',false,1)then
			if 取号 then
				if c_pic(page['往返']['手机号'],'手机号',true)then
					if GET_Phone(id,token)then
						取号 = false
						input_phone()
						--input(phone)
					end
				else
					click(33,591)
				end
			else
				if 取号 == false then
					if c_pic(page['往返']['获取验证码'],'获取验证码',true)then
						delay(3)
						out_time = os.time()
						while (true) do
							if getMessage(id,phone,token)then
								input(dxyzm)
								break
							end
							if os.time()-out_time > 65 then
								addBlacklist(id,phone,token)
								return false
							end
						end
					end
					if c_pic(page['往返']['设置密码'],'设置密码',true)then
						password = myRand(4,math.random(6,10))
						input(password)
						click(33,591)
					end
					if c_pic(page['往返']['注册提交'],'注册提交',true)then
						writeFile(account_path,'往返'..'----'..phone..'----'..password)
					end
				end
			end
		else
			log('-:)')
		end
		delay(1)
	end
end

function play()
	计时 = os.time()
	超时 = math.random(20,30)
	
	while os.time()-计时<超时 do
		if active(appbid,3)then
		else
			click(math.random(50,500),math.random(150,1000))
			delay(3)
			click(37,85)
		end
	end
	nLog('活跃完成')
end

function GPS(lx,ly)
	tab = {}
	tab[appbid] = { lat = lx, lon = ly }
	fakeGPS(tab)
	return true
end

close_VPN()
abl()

for i = 1,10 do
	if VPN()then
		
		lx = math.random(246070616203,403130801431)/10000000000
		ly = math.random(1008544837397,1189599971282)/10000000000
		GPS(lx,ly)
		
		if reg()then
			play()
			--awz()
			abl_backup(appbid)
		else
			closeX(appbid)
		end
		close_VPN()
		mSleep(2000)
	end
end
dialog("完成10个", 0)


