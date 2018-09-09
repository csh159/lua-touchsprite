require("TSLib")
require("tsp")
require("阿波罗")
require("ALZ")
require("POST")
require("AWZ")



init('0',0);

appbid = 'com.NationalPhotograpy.weishoot'
url = 'http://webapp.weishoot.com/vote/votelist.html'

--ALZ()
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
id = 71342 

p={}
p['微摄']={}
p['投票']={}

p['微摄']['投票按钮']={ 0x2b0565, "-5|-6|0xeaed00,-3|-23|0xeaed00,20|5|0x2b0565", 90, 471, 643, 618, 1020}
p['微摄']['投票按钮6']={ 0xeaed00, "-1|-47|0xeaed00,-45|2|0xeaed00,45|3|0xeaed00,0|36|0xeaed00", 90, 558, 813, 721, 1205}



function vote()
	计时 = os.time()
	超时 = 60 * 3
	投票次 = 0
	滑动 = true
	下拉 = 0

	
	p['微摄']['中国摄影年度盛典']={ 0x7bc93d, "47|-1|0xdc8444,-4|47|0xdac550,47|48|0x3994db", 90, 56, 261, 185, 396}
	
		p['微摄']['正在加载']={{0,125,0x167efb},{0,126,0x167efb},}
	p['微摄']['投票页面']={{124,1267,0xfffdfe},{133,1282,0x005396},{141,1278,0xfffdfe},{504,1282,0x005396},}
		p['微摄']['张晓萌']={ 0xffffff, "-2|0|0x0070c9,-1|12|0x0b76cb,-5|29|0xffffff,17|25|0x0070c9,17|2|0xffffff", 90, 575, 588, 610, 1017}
		p['微摄']['投票按钮']={ 0xeaed00, "0|-3|0x2b0565,9|10|0xeaed00,17|9|0x310d62", 90, 617, 752, 724, 1209}
		p['微摄']['已经投票过']={ 0xdce50c, "2|6|0x0070c9,5|6|0xeaed00,28|3|0x0070c9,28|-1|0xeaed00", 90, 617, 752, 724, 1209}
		
		p['微摄']['最多投10票']={{373,671,0xcdcdce},{373,673,0x06070c},{364,718,0xfdfdfd},{364,720,0x020202},{364,722,0xffffff},}
	
	-----new
	p['微摄']['首页展开']={{426,186,0x848484},{483,185,0xf1f1f1},{543,181,0x848484},{736,60,0x1e1717},}
		p['微摄']['首页']={{371,1199,0xee8b33},{642,1226,0x394165},{657,1227,0xa0a8cc},}	--(2)
	p['微摄']['投票']={{91,361,0x2ec1e0},{281,362,0x915ed5},{469,360,0xf8b62d},{657,361,0x8fc31f},}
	p['微摄']['中国摄影年度评选']={{677,83,0xffffff},{674,83,0x394165},{671,83,0xffffff},{664,83,0xffffff},{663,83,0x394165},}
		p['微摄']['人物推荐评选']={ 0xffffff, "-8|4|0x818240,-23|1|0xffffff,-10|36|0xffffff,-8|18|0x86863d", 90, 574, 400, 623, 1130}
		p['微摄']['人物评选']={ 0x15326a, "40|-46|0x143368,38|37|0x153469,50|-9|0xfefefe", 90, 543, 939, 701, 1282}
		
	p['微摄']['关闭']={{708,65,0xff9752},{730,78,0xe3e3de},{725,78,0xff9853},}
	p['微摄']['完善资料']={{473,85,0x394165},{476,85,0xffffff},{478,85,0x394165},{478,87,0xffffff},}
		
	while (os.time()-计时<超时) do
		if active(appbid,3) then

		elseif done(p['微摄']['首页展开'],'首页展开')then
			click(40,72)--点击恢复
		elseif done(p['微摄']['投票页面'],'投票页面',false,1)then
			if c_pic(p['微摄']['张晓萌'],'张晓萌',false)then
				if c_pic(p['微摄']['投票按钮'],'投票按钮',true)or c_pic(p['微摄']['已经投票过'],'已经投票过',true)then
					投票次 = 投票次 + 1
					if done(p['微摄']['最多投10票'],'最多投10票',false,1) or 投票次 >= 10 then
						return true
					end
					mSleep(1000*4)
				end
				滑动 = false
			else
				if 滑动 then
					moveTo(w/2,h-100,w/2,h-200,20,50)
				end
			end
			
		elseif done(p['微摄']['中国摄影年度评选'],'中国摄影年度评选',false,1)then
			if c_pic(p['微摄']['人物推荐评选'],'人物推荐评选',true)or c_pic(p['微摄']['人物评选'],'人物评选',true)then
				delay(3)
			else
				if done(p['微摄']['正在加载'],'正在加载',false,1)then
					mSleep(1000*3)
				else
					moveTo(w/2,h-100,w/2,h-600,50,20)
					下拉 = 下拉 + 1
					if 下拉 > 20 then
						click(40,40)
						下拉 = 0
					end
				end
			end
			
		elseif done(p['微摄']['首页'],'首页',true,2)then		--点发现
		elseif done(p['微摄']['投票'],'投票',true,1)then
		elseif done(p['微摄']['关闭'],'关闭',true,1)then
		elseif done(p['微摄']['完善资料'],'完善资料',false,1)then
			click(404,772)--以后再说
		else
			log('v-other')
		end
		mSleep(1000)
	end
end


function reg()
	计时 = os.time()
	超时 = 60 * 1
	手机号 = true
	验证码 = true

	p['微摄']['首页']={{577,80,0xf1f1f1},{349,70,0x394165},{357,66,0xffffff},{316,1115,0xee8025},}	--1为头像
		p['微摄']['首页展开']={{426,186,0x848484},{483,185,0xf1f1f1},{543,181,0x848484},{736,60,0x1e1717},}
		
	p['微摄']['登录界面']={{236,1256,0xf56467},{387,1226,0x68a5e1},{493,1251,0x8dc81b},}
		--(245,740)
	p['微摄']['快速注册界面']={{438,71,0x394165},{441,68,0xffffff},{438,84,0x394165},{440,83,0xffffff},}
	
		p['微摄']['注册按钮']={ 0xababab, "2|-7|0x1f253d,2|-12|0xababab", 90, 313, 419, 432, 486}
	p['微摄']['验证码填写']={{456,71,0x394165},{456,70,0xf4f5f7},{460,68,0xffffff},{461,68,0x41486b},}	
		p['微摄']['下一步']={ 0xababab, "-11|-9|0x1f253d,-11|-13|0xababab", 90, 300, 391, 450, 469}
	p['微摄']['设置密码']={{427,69,0x394165},{431,68,0xffffff},{431,71,0x394165},{429,84,0xffffff},}
		p['微摄']['完成注册']={ 0xababab, "0|-10|0x222840,0|-13|0xa3a3a5", 90, 280, 489, 461, 556}
	p['微摄']['完善资料']={{259,261,0x1f253d},{326,260,0x848484},{367,262,0xf1f1f1},{426,260,0x848484},{477,262,0x1f253d},}
		--(404,772)
	
	p['微摄']['发送短信确认']={ 0x54c7b8, "-271|-2|0x54c7b8", 90, 127, 819, 619, 882}
	p['微摄']['已经注册提示']={{329,562,0x404363},{329,561,0xffffff},{333,561,0x3d4061},{395,835,0x54c7b8},}
	
	
	ws_password = myRand(4,12)
	log(wp_password)
	while (os.time()-计时<超时) do
		if active(appbid,3) then
			
		elseif done(p['微摄']['完善资料'],'完善资料',false,1)then
			click(404,772)--以后再说
			t={}
			t.mail = phone
			t.phone = phone
			t.password = ws_password
			t.fristname = '微摄'
			upFacebook(t)
			return true
		elseif done(p['微摄']['设置密码'],'设置密码',false,1)then
			click(336,290)
			input(ws_password)
			click(355,571) --点击空白
			if c_pic(p['微摄']['完成注册'],'完成注册',true)then
				
			end
		
		elseif done(p['微摄']['验证码填写'],'验证码填写',false,1)then
			if 验证码 then
				out_time = os.time()
				while true do
					if getMessage(id,phone,token)then
						click(284,288)
						input(dxyzm)
						click(355,571) --点击空白
						验证码 = false
						break
					end
					if os.time()-out_time > 60 then
						return false
					end
				end
			elseif c_pic(p['微摄']['下一步'],'下一步',true)then
				
			end
				
		elseif done(p['微摄']['快速注册界面'],'快速注册界面',false,1)then
			if 手机号 then
				if GET_Phone(id,token) then
					click(578,311)
					input(phone)
					手机号 = false
					验证码 = true
					click(339,652) 	--点击空白
				end
			elseif 验证码 and c_pic(p['微摄']['注册按钮'],'注册按钮',true)then
				delay(2)
			end
			
		elseif done(p['微摄']['登录界面'],'登录界面',false,1)then
			click(245,740)
		elseif done(p['微摄']['首页展开'],'首页展开',true,1)then
		
		else
			log('other')
			if c_pic(p['微摄']['发送短信确认'],'发送短信确认',true)then
			elseif done(p['微摄']['已经注册提示'],'已经注册提示')then
				return false
			else
				click(693,85)
			end
		end
		mSleep(500)
	end
end


if xz(appbid)then

	while (true) do
		if abl()then
			if reg()then
				if vote()then
					--reName(phone..'投票10')
					t={}
					t.mail = phone
					t.phone = phone
					t.password = ws_password
					t.fristname = '微摄'
					t.map = 10
					upFacebook(t)
				end
			end
		end
	end

end







	