require("tsp")
require("api")
--[[
account = "uvsz42803501754104@icloud.com"
password = "XVxvbet87959"
--]]
PM={}

PM['iTunesStore']={{147,74,0x000000},{148,76,0xf7f7f7},{180,79,0x000000}}
PM['已经登录']={ 0x007aff, "3|0|0xffffff", 90, 252, 209, 560, 277}
	PM['帐号注销']={ 0x007aff, "8|-17|0x007aff,22|-17|0x007aff,20|-6|0x007aff", 90, 270, 563, 370, 645}
	PM.id = { 0x000000, "36|1|0x000000,46|-2|0x000000", 95, 21, 213, 170, 280}
	PM.密码 = { 0x040404, "3|-1|0xffffff,6|10|0x000000", 90, 26, 311, 106, 354}
	PM.登录 = { 0x007aff, "17|0|0xffffff,32|0|0x007aff", 90, 15, 461, 106, 513}
	PM.登录灰 = { 0x8f8f8f, "6|-5|0x8f8f8f,6|-12|0xffffff,6|-10|0x8f8f8f", 90, 252, 209, 560, 277}

PM['检查']={ 0x007aff, "56|21|0x007aff,43|-3|0x007aff", 90, 405, 661, 501, 705}
PM['帐户设置']={{268,80,0xf7f7f7},{269,80,0x000000},{298,7,0xf7f7f7},{298,75,0x000000},{369,79,0x000000},}
	PM['下一步']={ 0x007aff, "9|0|0x007aff", 90, 518, 1070, 627, 1123}
	PM.通过电子邮件发送 = { 0x0080fc, 90, 183, 304, 461, 344}
	PM['同意']={0x007aff, "10|-1|0xf1f1f1,13|-1|0x007aff", 90, 383, 620, 512, 671}
	PM.银行卡 = { 0x0080fc, 90, 560, 478, 627, 536}
	PM['街']={ 0x818181, "1|0|0xffffff,11|0|0x808080,21|3|0x808080,23|-16|0x808080", 90, 247, 767, 337, 1135}
	PM['路']={ 0x818181, "1|0|0xffffff,11|0|0x808080,21|3|0x808080,23|-16|0x808080", 90, 247, 377, 337, 1135}
	PM['邮编']={ 0x808080, "18|24|0x808080,51|-1|0x888888,57|20|0x808080", 90, 0, 0, 639, 1135}
	PM['市级行政区']={0x808080, "-1|2|0xf4f4f4,44|-2|0x808080,76|-2|0x808080,138|-1|0x858585", 90, 242, 287, 625, 616}
	PM['省份']={0xffffff, "2|-1|0x808080,14|-2|0xffffff,18|1|0x808080,104|-3|0x808080", 90, 250, 371, 503, 480}
	PM['5s完成']={ 0x000000, "6|0|0x000000", 90, 556, 640, 630, 684}
	PM['完成']={0x007aff, "4|0|0xbed8f5,15|-2|0x007aff", 90, 561, 643, 624, 681}
	PM['电话']={0x808080, "48|-2|0xffffff,55|-2|0x808080", 90, 253, 560, 449, 640}
	PM['超时']={ 0x78787a, "16|1|0x78787a,29|1|0x78787a,41|0|0x7a7a7c", 90, 165, 205, 229, 244}

PM['好']={0x007aff, "8|6|0x007aff", 90, 298, 606, 334, 636}
PM['失败']={ 0xff0202, 90, 16, 264, 523, 352 }
PM['注册成功']={{144,453,0x19d5fc},{318,451,0xf358ca},{491,458,0xfe9d05},}
-----------------------------帐号过检------------------------------------------------
PM['灰']={{317,1,0x959595},{350,1,0x959595},{375,1,0x959595},}
------------------全局参数-----------------------

m = {}
--------------------------------全局参数-----------------------------------------------
m['灰']={{317,1,0x959595},{350,1,0x959595},{375,1,0x959595},}
	m.请输入密码={ 0x000000, "15|-8|0x010101,15|-4|0xf7f7f7,15|15|0x010101,220|-8|0x000000", 90, 160, 184, 476, 269}
		m.请输入密码取消 = { 0x007aff, "18|1|0x007aff,43|15|0x007aff,58|15|0x007aff", 90, 140, 446, 230, 520}
	m.帐号禁用 ={ 0x000000, "32|6|0x000000,40|14|0x000000,36|22|0xf7f8f9", 90, 368, 455, 443, 512}
	m['确认帐号禁用']={{434,477,0x000000},{431,480,0xf6f7f7},{295,483,0xf7f7f7},{297,483,0x000000},{174,483,0x000000},}
	m.无法连接到iTunesStore = { 0x000000, "21|-10|0x000000,177|4|0x000000,312|1|0x000000,356|5|0x000000", 90, 127, 508, 513, 548}
	m.蓝色提示2={ 0x007aff, "1|-3|0xf1f2f3", 90, 88, 190, 374, 788}
	m.错误提示 = { 0x007aff, 90, 88, 190, 374, 788}
	m.位置取消 = { 0x007aff, 90, 430, 639, 483, 656}
	m['帐号有问题']={{34,236,0x000000},{42,236,0xffffff},{45,236,0x050505},{53,235,0xffffff},{55,233,0x000000},}
	m.帐号有问题2 = { 0x000000, "44|0|0x000000,44|1|0xeaeaea,61|15|0x000000", 90, 16, 208, 108, 261}
		m.修改密码 = { 0x808080, "10|0|0x808080,16|0|0xffffff,20|0|0x808080,49|-21|0x808080", 90, 222, 256, 485, 472}
		m.确认修改 = { 0x808080, "10|0|0x808080,17|0|0xffffff,20|0|0x808080,49|-22|0x808080", 80, 199, 266, 491, 472}
		m.通用密码 = { 0x8a8a8a, "16|-6|0xffffff,18|-8|0x808080,46|-9|0x808080,40|10|0x808080", 90, 229, 177,484, 570}
		m.修改提问一 = {0x808080, "28|-4|0xffffff,30|-10|0x808080,51|-11|0x808080", 90, 234, 778, 376, 857}
	

m['修改序列号'] = {{242,80,0x0b0b0b},{243,80,0xf8f8f8},{322,73,0x000000},{378,72,0x000000},{381,73,0xf8f8f8},}
	m.随机序列号={ 0x007aff, "7|3|0x007aff", 90, 239, 535, 346, 549}
	m.写入系统={ 0x007aff, "5|5|0x007aff", 90, 245, 673, 341, 694}
	m.一键重启={ 0x1a86fe, "7|0|0x1885fe,8|-2|0xefeff4", 90, 266, 816, 338, 830}


function click(x,y,times)
	times = times or 1
--	log("准备点击("..x..","..y..")")
	touchDown(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(50)
	touchUp(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(500*times)
end
function input(txt)
	inputText(txt)
	delay(0.5)
end
function imei_other()
	if done(m.灰,'灰')then
		c_p(m.位置取消,'取消')
	end
end

function respring()--帮你玩平台禁用此函数
    os.execute("killall -9 SpringBoard");
end
function imei()
	imei_s = 1
	app_imei = 'com.abc123.serialudid'
	AppStore = 'com.apple.AppStore'
	out_time = os.time()
	while os.time() - out_time <= 180 do
		if active(app_imei)then
			delay(2)
		end
		if imei_s == 1 then
			if done(m['修改序列号'],'修改序列号')then
				imei_s = 2
			end
		elseif imei_s == 2 then
			if c_pic(m.随机序列号,'随机序列号')then
				imei_s = 3
			end
		elseif imei_s == 3 then
			if c_pic(m.写入系统,'写入系统')then
				imei_s = 4
			end
		elseif imei_s == 4 then
			closeX(app_imei)
			mSleep(1000 * 2)
			toast('正在软改',3)
			--respring()
			closeX(AppStore)
			return true
		end
		other()
		imei_other()
		mSleep(1000)
	end
end

function other()
	other_n = other_n or 0
	if done(m['灰'],'弹窗处理')then
		mSleep(1000)
		other_n = other_n + 1
		if other_n >= 10 then
			c_p(m.错误提示,"未知错误")
			return true
		end
		if f_pic(m.请输入密码,'请输入密码')then
			click(191,506) --点击取消
		elseif f_pic(m.无法连接到iTunesStore,'无法连接到iTunesStore')then
			click(326,623)
			toast('无法连接到iTunesStore,即将后台处理',3)
			
			file_del = {}
			path_del = '/var/mobile/Library/com.apple.itunesstored/'
			file_del[1] = path_del..'itunesstored_private.sqlitedb'
			file_del[2] = path_del..'itunesstored_private.sqlitedb-shm'
			file_del[3] = path_del..'itunesstored_private.sqlitedb-wal'
			file_del[4] = path_del..'kvs.sqlitedb'
			file_del[5] = path_del..'updates.sqlitedb'
			
			for i,v in pairs(file_del)do
				delFile(v)
			end
			
			respring()
			
			mSleep(2000)
			return true
		elseif f_pic(m.帐号禁用,'帐号禁用')and done(m['确认帐号禁用'],'确认帐号禁用')then
			toast('帐号禁用',2)
			click(189,661)
			updata('no','yes')
			re_star = 1
		elseif c_pic(m.请输入密码取消,'请输入密码取消')then
		end
	else
		other_n = 0
	end
end

function ApplePass()
	out_time = os.time()
	setp = 1
	logout = 0
	re_star = 0
	closeX(AppStore)
	while (true) do
		if setp == 1 then
			if done(PM['iTunesStore'],"iTunesStore")then
				setp = 2
			else
				openURL("prefs:root=STORE");
				mSleep(3000)
			end
			
			ok = false
		elseif setp == 2 then
			if logout == 0 and c_pic(PM['已经登录'],'已经登录')then
				logout = 1 --只注销一次
				mSleep(1000)
			elseif ok and f_pic(PM['已经登录'],'已经登录')then
				toast('原本就是过检帐号',2)
				return true
			elseif done(PM.灰,"灰") and c_pic(PM['帐号注销'],'帐号注销') then
				delay(3)
			elseif (done(PM.灰,"灰"))and c_pic(PM['检查'],'检查->评论')then
			elseif c_pic(PM.id,'id') then --点击id
				mSleep(1000)
				input("\b\b\b\b\b\b\b\b\b\b\b\\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
				input(account)
				c_pic(PM.密码,"密码") --点击密码
				click(320,18)
				input(password)
				
				if c_pic(PM.登录,"登录") then--点击登录
					delay(3)
					ok = true
				end

			elseif done(PM['帐户设置'],"帐户设置")then
				setp = 3
			else
				click(320,18)
			end
		elseif setp == 3 then
			if done(PM['帐户设置'],"帐户设置")then
				log('选国家')
				if f_p(PM.通过电子邮件发送,'通过电子邮件发送')then
					setp = 4
				elseif c_pic(PM['下一步'],'下一步')then
				end
			elseif done(m.灰,'出现弹窗')and f_pic(PM['同意'],'同意')then
				setp = 5
			end
		elseif setp == 4 then
				log('同意')
				if done(m.灰,'出现弹窗')and f_pic(PM['同意'],'同意')then
					setp = 5
				elseif done(PM['帐户设置'],"帐户设置")and c_pic(PM['下一步'],'下一步')then
				end
		elseif setp == 5 then
			if done(PM['帐户设置'],"帐户设置")then
				setp = 6
			elseif c_pic(PM['同意'],'同意')then
			end
		elseif setp == 6 then
			if done(PM['帐户设置'],"帐户设置")then
				delay(3)
				if done(m['帐号有问题'],'问题帐号') or c_pic(m.帐号有问题2,'帐号有问题2')then
					toast('问题帐号',2)
					password = retTable[6] or "AaDd112211"
					setp = 6.5
				elseif f_p(PM['银行卡'],'银行卡已经勾选')then
					setp = 7
				else
					click(583,507)
				end
			end
		elseif setp == 6.5 then
			if c_pic(m.通用密码,"通用密码")then
				input(password)
				c_pic(PM['完成'],'完成')
			else
				if c_pic(m.修改提问一,'修改提问一')then
					input(retTable[7] or "pppp")
					c_pic(PM['完成'],'完成')
				else
					c_pic(PM['下一步'],'下一步')
					setp = 7
				end
			end
		elseif setp == 7 then
			UP(password,'新问题?','pppp')
			
			if done(PM['帐户设置'],"帐户设置")then
				if c_pic(PM['街'],'街')then
					input((myRand(7,math.random(2,4))) .."街")
				elseif c_pic(PM['路'],'路')then
					input((myRand(7,math.random(2,4))) .."路")
				elseif c_pic(PM['邮编'],'邮编')then
					input(math.random(100000,600000))
				elseif c_pic(PM['市级行政区'],'市级行政区')then
					input((myRand(7,2) .."市"))
				elseif c_pic(PM['省份'],'省份')then
					mSleep(2000)
					moveXY(320,954,324,886) --滑动
					mSleep(6000)
					if c_pic(PM['完成'],'完成') then
						setp = 9
					end
				else
					moveUp(320,800,320,500) 
				end
			end
		elseif setp == 9 then
			if done(PM['帐户设置'],'帐户设置')then
				if c_pic(PM['电话'],'电话')then
					input(myRand(2))
					if c_pic(PM['完成'],'完成') then
						setp = 11
					end
				end
			end
		elseif setp == 11 then
			if done(PM['帐户设置'],'帐户设置')then
				if c_pic(PM['下一步'],'下一步')then
					setp = setp + 1
				end
			end
		else
			if f_p(PM['失败'],'失败')then
				mSleep(2000)
				closeApp(frontAppBid())
				mSleep(2000)
				toast('如需帮助，请联系iTunes 支持，网址：www.apple.com/support/itunes/ww/。',2)
				updata('no','no')
				return false
			else
				for i,v in pairs(PM.注册成功)do
					if isColor(v[1],v[2],v[3])then
						toast('过检成功',2)
						mSleep(2000)
						click(577,85)
						return true
					end
				end
			end
		end
		log('过检步骤----> '..setp)
		
		if other()then
			return false
		end
		
		if re_star == 1 then
			return true
		end
		
		sotp = sotp or 0
		if sotp ~= setp then
			sotp = setp
			waitTimes = os.time()
		elseif sotp == setp then
			watiTime_key = os.time() - waitTimes
			nLog(watiTime_key)
			if  watiTime_key > 60*3 then
				closeApp(frontAppBid())
				toast('过检超时,网络错误');
				mSleep(2000)
				waitTimes = os.time()
				return false
			end
		end
		mSleep(200)
	end
end
--ApplePass()
--[[
--]
	if pass()then
		ACCOUNT_T = {}
		ACCOUNT_T.state = 1
		ACCOUNT_T.account = account
		upState(ACCOUNT_T)
	end
--]]
nLog('pass.lua 加截完成')



