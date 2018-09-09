

--------
require 'tsp'
local sz = require("sz")
iphonename = sz.system.mgcopyanswer("UserAssignedDeviceName") --获取设备名称
iphonename = tonumber(iphonename);
iphonename = 1

start = 500000
one = 10
AppStore = 'com.apple.AppStore'
start_mun = (iphonename - 0) * one + start
end_mun = (iphonename + 1) * one + start
mun = start_mun
n = 1
-----------------------------------------设备名转化成数字--------------

key = {}
--key[1] = '绘本'
key[1] = '天天捕鱼赢话费3d'

-----------------------------------关键词数组------------------
move_time = {}
--move_time[1] = 0
move_time[1] = 0

-----------------------------------滑动时间数组----------------
App_name = {}
--App_name[1] = "绘本之旅"
App_name[1] = "天天开心捕鱼ss"
-----------------------------------app图片名称-----------------
app_bid = {}
--app_bid[1]= 'com.glorymobi.englishch-teacherhd'
app_bid[1]= 'com.limayao.game.catchfish'



comment_list = readFile("/User/Media/TouchSprite/res/"..App_name[1]..".txt")
file={}
file.error_path = "/User/Media/TouchSprite/lua/error_ID.txt"

toast('编号【'..iphonename..'】帐号'..start_mun..'~'..end_mun..'\n关键词:'..key[1],2)
doneID = '/User/Media/TouchSprite/lua/'..App_name[1]..'-'..key[1]..move_time[1]..os.date("%Y-%B-%d-")..'-OK.txt'
--nLog(doneID)
if file_exists(doneID)then
	done_list = readFile(doneID)
	mun = mun + #done_list
	toast('已经完成~'..#done_list,2)
end

m={}
m.获取 = { 0x0080fc, "-57|-1|0x0080fc,33|1|0x0080fc", 90, 497, 279, 623, 419}
m.安装 = { 0x19ab20, "-22|-17|0x19ab20,-12|33|0x19ab20", 90, 498, 285, 622, 465}
m.正在下载={  0x0080fc, "0|17|0xffffff,0|18|0x0080fc,-1|33|0x0080fc,-1|34|0xffffff,0|50|0x0281fc", 90, 506, 293, 626, 471}
m.云={ 0x0080fc, "0|27|0x0080fc,-5|14|0x808080,-1|14|0xffffff,6|14|0x7f7f7f", 90, 497, 279, 623, 419}
---------------5s参数--------------------------------
m['iTunes与App']={{138,86,0x000000},{149,76,0xf6f6f8},{160,74,0x000000},{481,82,0xf6f6f7},{483,80,0x000000},{535,87,0x070707},{540,88,0xf6f6f8},}
m.登录={ 0x007aff, "6|8|0x007aff,10|13|0x007aff,13|15|0xffffff", 90, 19, 215, 110, 269}
m.登录灰={ 0x8f8f8f, "0|2|0xffffff,8|6|0xffffff,8|8|0x8f8f8f,12|15|0xffffff,14|17|0x8f8f8f", 90, 11, 205, 110, 275}
m.密码设置={ 0x000000, "21|11|0x101010,54|9|0xf5f5f5,55|8|0x000000,92|6|0x000000", 90, 15, 304, 178, 359}
m.登录按钮={ 0x007aff, "3|3|0xf9f9f9,5|6|0x007aff", 90, 409, 452, 496, 498}
m.已经登录ID = { 0x007aff, "5|1|0xffffff,7|1|0x007aff,9|16|0xf4f9ff", 90, 24, 217, 563, 277}
m.正在登录={ 0x828282, "0|3|0xf9f9f9,8|2|0x828282,30|-2|0x828282", 90, 412, 454, 493, 496}
m.弹窗登录={0x000000, "8|6|0xefe8ec,6|9|0x000000,7|13|0x000000,83|3|0x000000", 90, 170, 206, 462, 253}
m.帐号锁定={ 0x000000, "16|11|0x000000,50|10|0xf9f9f9,53|7|0x060606,84|17|0x000000,88|26|0x000000", 90, 333, 458, 452, 513}
m.禁用={ 0x000000, "-2|3|0xf9f9f9,15|0|0x000000,12|13|0x000000,12|15|0xf9f9f9,15|17|0x000000", 90, 368, 463, 410, 502}
m.停用 = { 0x000000, "7|3|0xebeaf1,14|7|0xe8e6ee,15|7|0x000000,17|4|0x000000,28|-1|0x000000", 90, 395, 498, 486, 547}
----------------------------------------------------------------------------------------------------------------------------------
m['iTunes']={{297,84,0x000000},{395,83,0xf6f6f7},{484,83,0x000000},{534,84,0xf6f6f7},{534,87,0x070707},}
m.AppleID={ 0x007aff, "27|-1|0xffffff,37|-1|0x007aff,48|-1|0xffffff,57|-1|0x007aff,101|1|0x007aff", 90, 12, 207, 161, 280}
m.注销 = { 0x007aff, "13|4|0xf5f5f5,20|1|0x007aff,28|-4|0x007aff", 90, 272, 572, 367, 649}
m['灰']={{397,17,0x939394},{415,17,0x939394},{430,17,0x939394},{443,17,0x939394},}
m.登录={0x007aff, "6|-4|0xffffff,8|-6|0x007aff,31|-6|0xffffff,34|-6|0x007aff,47|-8|0x007aff", 90, 15, 207, 110, 278}
m.密码={ 0xc8c8ce, "7|1|0xffffff,9|1|0xc7c7cd,15|1|0xffffff,26|1|0xc7c7cd", 90, 83, 321, 144, 394}
m.登录按钮={0x007aff, "17|-7|0xf9f9fa,37|-2|0x007aff", 90, 407, 409, 505, 473}
m.正在登录={ 0x828282, "0|3|0xf9f9f9,8|2|0x828282,30|-2|0x828282", 90, 412, 454, 493, 496}
m.更新按钮={ 0xffffff, "29|0|0x47cc5e,-45|1|0x4bd863", 90, 494, 671, 619, 756}
m.中国={0x0d0d0d, "3|19|0x0d0d0d,12|2|0xf6f6f6,25|-4|0x0e0e0e", 90, 169, 475, 245, 522}
m.协议更改={ 0x000000, "4|12|0x000000,15|21|0x000000,47|12|0x000000,48|1|0x000000", 90, 483, 436, 565, 491}
--------
m['协议iTunesStore']={{224,84,0x000000},{235,76,0xf7f7f7},{237,75,0x000000},{356,78,0x000000},{417,87,0x070707},{417,88,0xf7f7f7},}
m.协议同意={ 0x007aff, "20|-2|0x007aff,29|0|0xf7f7f7,31|6|0x007aff", 90, 549, 1069, 626, 1113}
m.协议同意2={ 0x007aff, "19|4|0x007aff,25|18|0x007aff,55|7|0x007aff,59|3|0x007aff", 90, 414, 628, 499, 671}
m.协议完成={ 0x007aff, "0|5|0x007aff,6|12|0x007aff,51|1|0x007aff", 90, 547, 60, 627, 109}
m.十五分后需要={ 0x007aff, "20|-4|0x007aff,92|4|0x007aff,152|8|0x007aff", 90, 340, 668, 567, 721}
m.立即下载={0x000000, "39|3|0x000000,44|-1|0xf4f4f6,47|-4|0x000000,82|-4|0x000000,116|2|0x000000", 90, 236, 457, 412, 508}
m.打开={ 0x0080fc, "29|0|0xffffff,38|0|0x0080fc,40|2|0xffffff,60|9|0x0080fc,60|10|0xebf5fe", 95, 493, 297, 622, 494}
m.弹窗登录={ 0x000000, "10|-2|0xf0eff3,12|-3|0x000000,140|2|0x000000,165|14|0x000000", 90, 254, 197, 463, 233}
m['需要密码']={{302,230,0x000000},{341,233,0x000000},{397,222,0x000000},{450,234,0x070707},{429,242,0x000000},}
m['app启动']={{400,19,0x8c6d80},{413,19,0x8c6d80},{442,19,0x8c6d80},{468,18,0x8e6c7f},}
m.验证失败={ 0x000000, "8|-9|0x000000,96|5|0x010101,130|-5|0x000000", 90, 243, 476, 399, 527}
m.有应用 ={ 0x0080fc, "-37|26|0x0080fc,53|22|0x0080fc,9|50|0x0080fc", 90, 507, 518, 632, 1037}
-----------------error------------------------
m.无法连接到 = { 0x000000, "96|5|0x020202,163|-12|0x000000,259|6|0x070707,372|6|0x070707", 90, 117, 497, 517, 551}
m.暂时无法连接到 = { 0x999999, "2|-4|0xfbfbfb,2|-3|0x999999,35|-4|0xfdfdfd,35|-5|0x999999", 90, 24, 553, 111, 612}
m['热门搜索']={{282,227,0x000000},{288,220,0x000000},{310,220,0x101010},{384,220,0x000000},{383,223,0xffffff},{393,227,0x000000},}
m.无网={ 0x999999, "10|4|0xffffff,12|2|0x999999,38|19|0x999999,28|44|0x999999,17|21|0xffffff", 90, 53, 537, 114, 593}
m.协议错位={ 0x000000, "-2|1|0xf9f9f9,22|26|0x000000,5|21|0xf9f9f9,57|16|0x000000,55|14|0xf9f9f9", 90, 484, 188, 567, 234}
m.免费项目={ 0xf8f8f9, "3|-3|0x000000,8|-3|0xf8f8f9,9|-4|0x090909,49|18|0x000000,49|16|0xf7f7f9", 90, 411, 458, 515, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m.购买过了={ 0x000000, "9|-4|0xf9f9f9,26|-4|0x000000,30|12|0x000000,35|16|0xf9f9f9,38|15|0x000000", 90, 436, 524, 508, 565}
-------------------------------游戏识别------------------------------------------
m.不允许 = {0x007aff, "11|18|0x007aff,25|17|0x007aff", 90, 165, 651, 225, 747}
m.AppPage ={0x007aff, "-17|16|0x007aff,0|15|0xf9f9f9,1|32|0x007aff", 90, 8, 52, 50, 113}
-----------------------------------------------------------------------------------------------------------
m['搜索']={ 0x9d9d9d, "-5|0|0xf6f6f6,-5|1|0xadadad", 90, 419, 1108, 465, 1134}
m['搜索-blue']= { 0x007aff, "0|4|0x007aff", 90, 423, 1107, 469, 1135}
m.有结果={ 0x0080fc, "17|-10|0x0080fc,91|14|0x0080fc,56|40|0x0080fc", 90, 499, 159, 625, 289}
m.有结果云={ 0x0080fc, "0|-1|0xffffff,-5|14|0x808080,6|14|0x7f7f7f", 90, 528, 162, 630, 306}
m.有结果元={ 0x0080fc, "109|2|0x0080fc", 90, 477, 166, 622, 307}
m['top-搜索']={ 0x8e8e93, "5|-1|0xe3e4e6,18|-1|0x909096", 95, 259, 65, 307, 107}
m['空格']={ 0x000000, "8|10|0x000000", 90, 244, 1062, 366, 1119}
m['搜']={ 0xffffff, "2|0|0x007aff", 90, 515, 1065, 603, 1112}
------------------------------------评论区----------------------------
m.评论={ 0x848484, "13|0|0x848484,34|-2|0x848484,38|9|0x848484", 90, 237, 368, 398, 555}
m.评论激活={ 0x848484, "160|4|0x848484,64|-18|0x848484,72|27|0x848484", 90, 230, 351, 407, 535}
m.五星灰={ 0x848484, "21|0|0x848484,41|0|0x848484,61|0|0x848484,80|0|0x848484", 90, 10, 617, 133, 1031}
m.撰写评论={ 0x0080fc, "21|-1|0x0080fc,46|9|0x0080fc,81|10|0x0080fc,113|11|0x0080fc", 90, 87, 471, 231, 1037}
m['撰写评论界面']={{258,86,0x000000},{311,84,0x000000},{343,86,0x000000},{380,97,0x000000},}
m.评论发送={ 0x007aff, "4|-5|0x007aff", 90, 565, 77, 622, 100}
m.创建昵称={ 0xc7c7cd, "21|-1|0xc7c7cd", 100, 239, 236, 316, 283}
m.评论标题={ 0xc7c7cd, "22|4|0xc7c7cd,39|-6|0xffffff,41|-3|0xc7c7cd", 98, 44, 248, 98, 277}
m.评论标题2={ 0xc7c7cd, "-1|-8|0xc7c7cd", 100, 62, 339, 98, 364}
m.评论内容={ 0xb2b2b2, "25|7|0xb2b2b2", 100, 10, 313, 249, 456}
m['评论完成'] = {{566,74,0x007aff},{573,72,0xf9f9f9},{574,72,0x007aff},{570,82,0xf9f9f9},{569,82,0x007aff},}
--------------------------------------------
comment_arr = {'找到评论','打开评论','撰写评论','确认完成'}

password = "AaDd112211"
function comment(name,title,content)
	out_time = os.time()
	comment_setp = 1
	while (true) do
		if comment_setp == 1 then
			if f_pic(m.评论激活,"评论激活")then
				if c_pic(m.撰写评论,'撰写评论') then
					comment_setp = 2
				end
			elseif f_pic(m.五星灰,'五星灰')and f_pic(m.评论激活,"评论激活") then
				moveUp(314,841,318,746)
			elseif c_pic(m.评论,'点击评论')then
			end
		elseif comment_setp == 2 then
			if c_pic(m.撰写评论,'撰写评论')then
			elseif f_pic(m.评论发送,'评论发送')then
				comment_setp = 3
			end
		elseif comment_setp == 3 then
			if isColor(459,159,0xb2b2b2)then  ---判断5星 为灰色
				click(459,159)
--			if isColor(179,161,0xb2b2b2)then  ---判断1星 为灰色
--				click(179,161)
			elseif c_pic(m.创建昵称,'创建昵称')then
				writePasteboard(name,0)
				delay(1)
				keyDown("RightGUI") 
				keyDown("v")
				keyUp("v")
				keyUp("RightGUI")
			elseif c_pic(m.评论标题,'标题')or c_pic(m.评论标题2,'标题') then
				writePasteboard(title,0)
				delay(1)
				keyDown("RightGUI") 
				keyDown("v")
				keyUp("v")
				keyUp("RightGUI")
			elseif c_pic(m.评论内容,'评论内容')then
				writePasteboard(content,0)
				delay(1)
				keyDown("RightGUI") 
				keyDown("v")
				keyUp("v")
				keyUp("RightGUI")
			elseif c_pic(m.评论发送,'评论发送')then
				comment_setp = 4
				comment_arr[4]='发送评论'
			end
		elseif comment_setp == 4 then
			if done(m.评论完成,'评论完成')then
				toast('确认完成',1)
				return true
			end
		end
		if os.time() - out_time >= 180 then
			return false
		end
		toast('评论步骤~'..comment_arr[comment_setp],1)
		--other()
		delay(2)
	end
end
comment(name,title,content)
lua_exit()

----返回帐号状态--------失败or成功---------------
function RAPS(ids,state)

end

function other()
	function a_error(txt)
		RAPS(mun,2)
		re_start = 1
		writeFile(file.error_path,mun.."|"..account.."|"..txt)
	end
	if done(m.灰,'灰有弹窗') then
		if f_pic(m.弹窗登录,'弹窗登录')or done(m.需要密码,'需要密码')then
			input(password)
			click(460,505)
			return true
		elseif login_setp ~= 2 and f_pic(m.密码,'密码')then
			click(180,438)
		elseif f_pic(m.免费项目,'免费项目')then
			click(185,669)
			return false
		elseif f_pic(m.帐号锁定,'帐号锁定')then
			click(468,665)
			a_error("帐号锁定")
			return false
		elseif f_pic(m.禁用,'禁用')then
			click(180,663)
			a_error("帐号禁用")
			return false
		elseif f_pic(m.停用,'停用')then
			click(316,626)
			a_error("帐号停用")
			return false
		end
		if c_pic(m['注销'],'注销')then
			delay(5)
		end
		c_pic(m.十五分后需要,'十五分后需要')
		c_pic(m.协议同意2,'协议同意2')
		if f_pic(m.自动下载,'自动下载')then
			click(178,684)
			return true
		elseif c_pic(m.购买过了,'购买过了')then
			click(325,651)
		elseif f_pic(m.协议错位,'协议错位')then
			click(459,437)
			return true
		elseif f_pic(m.协议更改,'协议更改')then
			click(461,691)
			return true
		elseif f_pic(m.验证失败,'验证失败')then
			click(321,653)
			return true
		elseif f_pic(m.立即下载,'立即下载')then
			click(323,652)
			return true
		end
		if f_pic(m.无法连接到,'无法连接到')then
			wf = wf or 0
			wf = wf + 1
			if wf >= 3 then
				click(327,628)
				login_setp = 1
				search_setp = 1
			end
			return true
		else
			wf = 0
		end
	end
	if done(m.协议iTunesStore,'协议iTunesStore')then
		c_pic(m.协议同意,'协议同意')
		c_pic(m.协议完成,'协议完成')
	end
end

function ASOA(mun)

end

function login()
	login_arr = {'启动设置','准备登录','查询网络','获取帐号','登录帐号'}
	login_setp = 1
	logout = 0
	out_time = os.time()
	while (true) do
		if login_setp == 1 then
			if done(m.iTunes与App,'iTunes与App')then
				login_setp = 2
			else
				openURL("prefs:root=STORE"); --打开登录界面
				log('STORE')
				delay(5)
			end
		elseif login_setp == 2 then
			if logout == 0 and c_pic(m.AppleID,'已经登录')then
				logout = 1
			elseif f_pic(m.AppleID,'已经登录')then
				log('待注销帐号')
				delay(3)
			elseif f_pic(m.登录,'找到登录')then
				login_setp = 3
			elseif done(m.灰,'注销弹窗')and c_pic(m.注销,'注销')then
				login_arr[2]='注销帐号'
				delay(5)
			end
		elseif login_setp == 3 then
			if getNetTime()>0 then
				login_setp = 4
			else
				toast('网络错误~等待网络正常')
				delay(3)
			end
		elseif login_setp == 4 then
			if ASOA(mun)then
				login_setp = 5
			else
				mun = mun + 1
			end
			login_ok = 0
		elseif login_setp == 5 then
			if f_pic(m.AppleID,'登录成功')then
				login_ok = login_ok + 1
				if login_ok >= 3 then
					toast('登录成功',1)
					closeApp(AppStore)
					delay(2)
					return true
				end
			elseif c_pic(m.登录,'登录')then
				input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
				input(account)
				if c_pic(m.密码,'密码')then
					input(password)
				end
				if c_pic(m.登录按钮,'登录按钮')then
					login_arr[5] = '等待登录'
				end
			elseif f_pic(m.密码,'密码')then
				click(165,437) --点击取消,由输入错误
			elseif f_pic(m.登录灰,'登录灰')or f_pic(m.正在登录,'正在登录,弹窗灰')then
				toast('正在登录',1)
				delay(3)
			end			
		end
		sotp = sotp or 0
		if sotp ~= login_setp then
			sotp = login_setp
			waitTimes = 0
		elseif sotp == login_setp then
			waitTimes = waitTimes or 0
			waitTimes = waitTimes + 1
			wait_mun = 90
			if waitTimes > wait_mun then
				closeApp(frontAppBid())
				toast('网络错误');
				delay(3)
				return false
			end
		end
		delay(1)
		other()
		log('登录步骤~'..login_arr[login_setp]..'~'..login_setp)
		toast('登录步骤~'..login_arr[login_setp],1)
		if re_start == 1 then
			re_start = 0
			return false
		end
	end
end

function search(keys,move_times,app_name,bid_s)
	search_arr = {'打开AppStore','输入关键词','滑动应用','购买应用状态'}
	--closeApp(AppStore)
	search_setp = 4
	function write_ID(keys,app_name,txt)
		writeFile('/User/Media/TouchSprite/lua/'..app_name..'-'..keys..move_times..os.date("%Y-%B-%d-")..'-OK.txt',mun.."|"..account.."|"..keys.."|"..app_name..txt)
	end
	while (true) do
		if search_setp == 1 then
			if active(AppStore)then
				delay(2)
			end
			if c_pic(m['搜索'],'搜索')then
			elseif f_pic(m['搜索-blue'],'搜索-blue')then
				search_setp = 2
			end
		elseif search_setp == 2 then
			active(AppStore)
			if c_pic(m['top-搜索'],'top-搜索')then
				input(keys)
				if c_pic(m['空格'],'空格')then
					input('\b')
				end
				c_pic(m['搜'],'搜')
			elseif c_pic(m['搜'],'搜')then
			elseif c_pic(m['搜索'],'搜索')then
			elseif done(m['热门搜索'],'热门搜索')then
				closeApp(frontAppBid())
			elseif c_pic(m.暂时无法连接到,'暂时无法连接到')then
				delay(2)
				search_setp = 1
				closeApp(frontAppBid())
			elseif f_pic(m.有结果,'有结果')or f_pic(m.有结果云,'有结果云')or f_pic(m.有结果元,'有结果元')then
				search_setp = 3
			end
			move_fast = 0 --快速滑动时间标记,0为开启,非0为关闭
		elseif search_setp == 3 then
			if move_fast == 0  then
				move_out = os.time()
				while os.time()- move_out < move_times do
					if AppStore == frontAppBid() then
						moveUp_one(321,897,317,310)
					else
						search_setp = 1
					end
				end
				move_fast = 1
			end
			-----------------------------查找应用-c_tu图片的名称-----------------------
			if c_tu(app_name)then
				delay(3)
				if f_pic(m.AppPage,'AppPage')then
					search_setp = 4
				end
			else
				if active(AppStore)then
					search_setp = 1
				else
					moveUp(311,860,311,650)
					if f_pic(m.有应用,'有应用')then
						bottom = 0
					else
						bottom = bottom or 0
						bottom = bottom + 1
						if bottom >= 60 then
							log('搜索超出')
							closeApp(frontAppBid())
							delay(2)
							search_setp = 1
						end
					end
				end
			end
			yun = 0
			down = 0
		elseif search_setp == 4 then
			if down == 1 and f_pic(m.打开,'打开') then
				write_ID(keys,app_name,'下载完成')
				delay(2)
				ipaUninstall(bid_s)
				return true
			elseif f_pic(m.打开,'打开')then
				delay(2)
				ipaUninstall(bid_s)
				closeApp(frontAppBid())
				delay(5)
			elseif c_pic(m.获取,'获取')then
			elseif c_pic(m.安装,'安装')then
				down = 1
			elseif f_pic(m.云,'云')then
				yun = yun + 1
				search_arr[4] = '云~'..yun
				if yun >= 10 then
					write_ID(keys,app_name,'正常购买')
					log('购买完成,准备一下步')
					toast('购买完成,准备一下步')
					delay(2)
					txt_list = split(comment_list[n],"|")
					title,content = txt_list[1],txt_list[2]
					name = RndWord(math.random(4,8)).. RndLetter(math.random(1,4))
					if comment(name,title,content)then
						n = n + 1
						delay(10)
					end
					return true
				end
			elseif c_pic(m.正在下载,'正在下载')then
			elseif frontAppBid() == app_bid then
				closeApp(frontAppBid())
				delay(2)
				ipaUninstall(bid_s)
				write_ID(keys,app_name,'下载完成')
				return true
			end
		end
		--超时设置------------------------
		if search_setp ~= 3 then
			toast('步骤~'..search_arr[search_setp])
		end
		sotp = sotp or 0
		if sotp ~= search_setp then
			sotp = search_setp
			waitTimes = 0
		elseif sotp == search_setp then
			waitTimes = waitTimes or 0
			waitTimes = waitTimes + 1
			wait_mun = wait_mun or 120
			if search_setp == 3 then
				wait_mun = 1000
			else
				wait_mun = 120
			end
			if waitTimes > wait_mun then
				closeApp(frontAppBid())
				toast('网络错误');
				delay(3)
				waitTimes = 0
				search_setp = 1
			end
		end
		--超时设置------------------------END-------
		delay(1)
		other()
		if re_start == 1 then
			re_start = 0
			return false
		end
	end
end

while (true) do
	if mun > end_mun then
		dialog('工作完成', 60)
		lua_exit()
	else
		if true or login()then
			for i,v in pairs(key)do
				search(key[i],move_time[i],App_name[i],app_bid[i])
			end
		end
		mun = mun + 1
	end
end
