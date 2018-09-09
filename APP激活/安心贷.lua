--require("TSLib")
require("tsp")
require("阿波罗")
require("ALZ")
require("lz-api")
require("yzm")

nLog(frontAppBid())


init('0',0);
appbid = 'com.anxin.anxindai';

--爱乐赞id 取手机号用
id = 18446
app_name = '安心贷'
yzmtype = '1001'
apple_yzm = ''
--imgfile = lzScreen(439, 377, 609, 448,1.0)

ALZ()
path = {
	[1] = '/User/Media/TouchSprite/lua/'..app_name..'.txt',
	}

page={}
page['app_name']={}

--注册往返
function reg()
	Time_line = os.time()
	Time_out = 60 * 3
	get_Phone = true
	get_Message = false
	by_pic = true
	by_yzm = false
	--------
	page['app_name']['screen']={{597,1058,0x7f7f7f},}
	page['app_name']['open']={{284,975,0xf44336},{321,944,0xf44336},{387,975,0xffffff},}
	page['app_name']['sign_up']={{151,872,0xf8837b},{579,95,0xf44336},{211,245,0xe5372a},}
	page['app_name']['sign_ui']={{146,195,0xff0000},{321,205,0xc7c7c7},{326,70,0xffffff},{67,82,0xffffff},{67,79,0xf44336},}
		page['app_name']['phone']={ 0x757575, "-17|16|0x787878,-17|-12|0x757575", 90, 35, 406, 185, 462}
		page['app_name']['passwrod']={ 0x757575, "0|16|0x7c7c7c,-5|-11|0x909090", 90, 31, 604, 167, 647}
		page['app_name']['next']={ 0xf44336, "1|-14|0xffffff,3|-22|0xf44336", 90, 390, 869, 628, 1136}
		page['app_name']['waiting']={{256,566,0x333333},{381,569,0x333333},{384,693,0x333333},{259,688,0x333333},}
		
	page['app_name']['info_ui']={{385,70,0xffffff},{385,73,0xf44336},{149,199,0xff2323},{321,206,0xc7c7c7},}
		page['app_name']['check']={ 0xd6d5d5, "0|-27|0xd6d5d5,12|-15|0xd6d5d5", 90, 23, 765, 72, 821}
		page['app_name']['pic_yzm']={ 0x757575, "-4|-14|0x757575,-13|-25|0x757575", 90, 77, 412, 201, 456}
		page['app_name']['yzm_false']={ 0xff4040, "-2|-2|0xff3939", 90, 26, 486, 313, 537}
		page['app_name']['get_yzm']={ 0xfcd0cc, "-1|-7|0xf44336,-11|-21|0xffffff", 90, 455, 583, 595, 634}
		page['app_name']['phone_yzm']={ 0x757575, "-6|-14|0x757575,-14|-25|0x757575", 90, 34, 603, 196, 651}
	page['app_name']['OK']={{385,70,0xffffff},{375,73,0xf44336},{324,204,0xff3030},{326,205,0xffffff},}


	while os.time()-Time_line<Time_out do
		if active(appbid,3)then
		elseif done(page['app_name']['OK'],'OK',false,1)then
			return true
		elseif done(page['app_name']['info_ui'],'info_ui',false,1)then
			
			if c_pic(page['app_name']['check'],'check',true)then
			elseif c_pic(page['app_name']['next'],'next',true)then
			elseif get_Message then
				if c_pic(page['app_name']['get_yzm'],'get_yzm',true)then
					mSleep(1000*5)
					if c_pic(page['app_name']['yzm_false'],'yzm_false',false)then
						lzReportError(lz_username, lz_password, yzmid)
						closeX(appbid)
						return false
					else
						out_time = os.time()
						while (true) do
							if getMessage(id,phone,token)then
								if c_pic(page['app_name']['phone_yzm'],'phone_yzm',true)then
									input(dxyzm)
									click(565,222)	--回位
									get_Message = false
									break
								end
							end
							if os.time()-out_time > 65 then
								addBlacklist(id,phone,token)
								return false
							end
						end
					end
				end
			elseif by_yzm then
				if lz_yzm()then
					if c_pic(page['app_name']['pic_yzm'],'pic_yzm',true)then
						apple_yzm = string.sub(apple_yzm,1,4)
						input(apple_yzm)
						click(565,222)	--回位
						get_Message = true
					end
				end
			elseif by_pic then
				imgfile = lzScreen(439, 377, 609, 448,1.0)
				by_yzm = true
			end
			
		elseif done(page['app_name']['sign_ui'],'sign_ui',false,1)then

			if done(page['app_name']['waiting'],'waiting',false,1)then
				mSleep(1000*3)
			elseif get_Phone then 
				if GET_Phone(id,token)then
					if c_pic(page['app_name']['phone'],'phone',true)then
						input(phone)
						click(565,222)	--回位
						get_Phone = false
					end
				end
			elseif c_pic(page['app_name']['passwrod'],'passwrod',true)then
				password = myRand(4,math.random(8,12))
				input(password)
				click(565,222)	--回位
			elseif c_pic(page['app_name']['next'],'next',true)then
			end
				
		elseif done(page['app_name']['sign_up'],'sign_up',true,1)then
		elseif done(page['app_name']['open'],'open',true,3)then
		elseif done(page['app_name']['screen'],'screen',false,1)then
			moveTo(600,h/2,200,h/2,50,20)
			mSleep(1000*2)
		else
			log('-:)')
		end
		delay(1)
	end
end

--abl()
reg()














