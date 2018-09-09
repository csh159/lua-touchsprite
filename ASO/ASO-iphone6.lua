w,h =getScreenSize()
nLog(w..'*'..h)
lua_exit()



require "tsp"
AppStore = 'com.apple.AppStore'
----------------------------------------way = 1 ----------------------------------------
ONE = {}
ONE.关键词 = {}
ONE.关键词[1] = {'口袋总动员',6,102,40}
------------------应用包信息--------------------------------
ONE.应用名={'口袋物语','mono.gatari.pocket'}
----------------------------------------way = 2 ------------------------------------------

------------------------------------------------------------
--获取设备名称
local sz = require("sz")
iphonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
local i,j = string.find(iphonename, "%d+")
local iphonename =string.sub(iphonename,i,j)
p_mun = tonumber(iphonename)

if p_mun == nil then
	dialog("手机编号错误", 5)
	lua_exit()
end


toast('ASO 启动啦',2)
mSleep(1000)

m = {}
--------------------------------全局参数-----------------------------------------------
m['灰']={{438,15,0x939394},{452,17,0x939394},{462,16,0x939394},{466,13,0x939394},}
--------------------------------登录判断区域-------------------------------------------------
m['iTunes与App']={{138,86,0x000000},{149,76,0xf6f6f8},{160,74,0x000000},{481,82,0xf6f6f7},{483,80,0x000000},{535,87,0x070707},{540,88,0xf6f6f8},}
m['iTunes_iphone6']={{566,86,0x000000},}
m.正在登录 = { 0x828282, "0|3|0xf9f9f9,8|2|0x828282,30|-2|0x828282", 90, 412, 454, 493, 496}
m.登录灰={ 0x8f8f8f, "0|2|0xffffff,8|6|0xffffff,8|8|0x8f8f8f,12|15|0xffffff,14|17|0x8f8f8f", 90, 11, 205, 110, 275}
m.AppleID = { 0x007aff, "-5|4|0xffffff,-9|4|0x007aff", 90, 246, 209, 708, 277 }
m.登录={ 0x007aff, "17|1|0x007aff", 90, 22, 219, 65, 265}
m.密码={ 0xc7c7cd, "8|14|0xc7c7cd,19|-1|0xc7c7cd", 90, 144, 418, 233, 500}
m.登录按钮={ 0x007aff, "42|0|0x007aff", 90, 438, 495, 634, 639}  --点击登录按钮
m.正在登录={ 0x828282, "7|4|0xf9f9f9,8|8|0x828282,40|13|0x828282", 90, 422, 515, 600, 648} --弹窗登录灰色
m.注销 = { 0x007aff, "12|12|0x1b87fe,6|20|0xf3f4f8,5|20|0x007aff", 90, 312, 665, 464, 754}
---------------------------------APP搜索区域-------------------------------------------------
m.搜索={ 0x929292, "14|-4|0x929292", 90, 482, 1243, 566, 1332}
m.搜索blue= { 0x007aff, "13|-3|0x007aff", 90, 482, 1243, 566, 1332}
m['top-搜索']={ 0x909095, "3|0|0xe4e5e7,18|0|0x8e8e93,23|14|0x8e8e93", 90, 316, 61, 430, 109}
m['空格']={ 0x000000, "4|1|0xffffff", 90, 283, 1251, 536, 1322}
m['搜']={ 0xffffff, "-6|-32|0x007aff", 90, 576, 1248, 735, 1321}
m.有结果={ 0x0080fc, "39|27|0x0080fc,37|27|0xffffff,-5|49|0x0080fc", 90, 566, 149, 736, 1192}
m.结果云={ 0x0080fc, "0|-1|0xffffff,-5|14|0x808080,6|14|0x7f7f7f", 90, 566, 149, 736, 1192}
m.AppPage={ 0x007aff, "-17|16|0x007aff,0|15|0xf9f9f9,1|32|0x007aff", 90, 8, 52, 50, 113}
m.有应用={ 0x0080fc, "39|27|0x0080fc,37|27|0xffffff,-5|49|0x0080fc", 90, 566, 659, 736, 1192}
---------------------------------下载区域----------------------------------------------------
m.获取={ 0x0080fc, "-57|-1|0x0080fc,33|1|0x0080fc", 90, 584, 225, 740, 503}
m.安装={ 0x19ab20, "-22|-17|0x19ab20,-12|33|0x19ab20", 90, 584, 225, 740, 503}
m.打开={ 0x0080fc, "5|-3|0xffffff,27|-3|0x0080fc,-24|-1|0x0080fc,-35|0|0xffffff,-62|0|0x0080fc", 90, 584, 225, 740, 503}
m.正在下载={ 0x0080fc, "0|25|0x0080fc,0|-26|0x0080fc,25|-1|0x0381fc", 90, 598, 232, 749, 510}
m.云={ 0x0080fc, "0|26|0x0080fc,5|13|0x7f7f7f,-6|13|0x808080,-5|13|0xffffff", 90, 600, 212, 748, 518}
---------------------------------弹窗提示----------------------------------------------------
m.登录iTunes={ 0x000000, "2|3|0xf9f9f9,226|9|0x000000,226|12|0xf9f9f9,266|17|0x080808", 90, 201, 275, 538, 344}
m.十五分需要={ 0x040404, "0|1|0xf8f8f8,10|-8|0x000000,34|-1|0x000000,35|2|0xf8f8f8,31|4|0x000000", 90, 489, 440, 562, 485}
m.不再另外收费={ 0x000000, "-6|5|0x000000,0|29|0x000000,43|18|0x000000,53|4|0x000000,28|4|0x000000", 90, 436, 525, 513, 570}
m.无法连接到={ 0x000000, "3|1|0xf8f8f9,21|2|0x000000,76|12|0xf8f8f9,80|15|0x070707,131|8|0x000000,188|12|0xf9f9f9", 90, 303, 500, 512, 544}
m.验证失败={ 0x000000, "12|-4|0xf9f9f9,21|0|0x000000,24|7|0x010101,31|-6|0x000000,36|-3|0xf9f9f9,36|-1|0x000000", 90, 319, 475, 390, 519}
m.保存密码={ 0x000000, "27|0|0x000000,13|18|0x060606,43|9|0x000000,57|20|0x000000,46|20|0x000000", 90, 415, 460, 494, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m.购买过了={ 0x000000, "9|-4|0xf9f9f9,26|-4|0x000000,30|12|0x000000,35|16|0xf9f9f9,38|15|0x000000", 90, 436, 524, 508, 565}
m.无法下载项目={ 0x000000, "0|7|0xefefee,0|8|0x020202,-3|28|0x000000,17|23|0xefede9,18|28|0x010101", 80, 388, 481, 422, 519}
m.免费项目={ 0xf8f8f9, "3|-3|0x000000,8|-3|0xf8f8f9,9|-4|0x090909,49|18|0x000000,49|16|0xf7f7f9", 90, 411, 458, 515, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m['需要验证']={{385,470,0x000000},{380,473,0xf8f8f8},{486,674,0x007aff},{165,683,0x007aff},}
m.帐户设置={{259,69,0x000000},{259,100,0xf6f6f8},{291,72,0x060606},{316,83,0xf6f6f7},{349,83,0x000000},{380,82,0x000000},}
m.帐户设置完成={ 0x007aff, "0|-3|0xf6f6f8,0|-5|0x067dff", 90, 562, 75, 612, 95}
m['unbale']={{91,444,0x0a0a0a},{371,444,0x000000},{546,460,0x000000},{326,697,0x007aff},{299,697,0x007aff},}
m.蓝色提示={ 0x007aff, "0|7|0x007aff", 90, 138, 617, 477, 686}
m.蓝色提示2={ 0x007aff, "1|-3|0xf1f2f3", 90, 175, 669, 624, 853}
---------------------------------帐号处理区域------------------------------------------------
m.锁定={ 0x000000, "16|11|0x000000,50|10|0xf9f9f9,53|7|0x060606,84|17|0x000000,88|26|0x000000", 90, 333, 458, 452, 513}
m.禁用={ 0x000000, "-2|3|0xf9f9f9,15|0|0x000000,12|13|0x000000,12|15|0xf9f9f9,15|17|0x000000", 90, 368, 463, 410, 502}
m['停用']={{475,510,0x000000},{326,628,0x007aff},{315,512,0x0a0a0a},}
---------------------------------修改协议----------------------------------------------------
m.立即下载={ 0x000000, "17|-18|0xf3f3f4,28|-21|0x000000,52|-25|0x000000,54|3|0x000000,111|3|0x000000,131|-19|0x000000", 80, 239, 445, 390, 524}
m.协议更改={ 0x000000, "21|3|0xf9f9f9,23|1|0x000000,20|26|0x000000,59|5|0x000000,59|3|0xf9f9f9,61|1|0x000000", 90, 486, 441, 561, 486}
m['协议iTunesStore']={{224,84,0x000000},{235,76,0xf7f7f7},{237,75,0x000000},{356,78,0x000000},{417,87,0x070707},{417,88,0xf7f7f7},}
m.协议同意={ 0x007aff, "20|-2|0x007aff,29|0|0xf7f7f7,31|6|0x007aff", 90, 549, 1069, 626, 1113}
m.协议弹窗同意={ 0x007aff, "23|-5|0xf9f9f9,25|-7|0x007aff,9|6|0x007aff,9|7|0xf9f9f9,56|3|0x007aff", 90, 413, 625, 494, 671}
m.协议完成={ 0x007aff, "0|5|0x007aff,6|12|0x007aff,51|1|0x007aff", 90, 547, 60, 627, 109}
---------------------------------协议修改--END-----------------------------------------------

function other()
	if done(m.灰,'有弹窗')then
		if f_pic(m.登录iTunes,'需要密码')then             	--ok
			input(password)
			click(508,605)
		elseif f_pic(m.十五分需要,'十五分需要')then       	--ok
			click(478,692)
		elseif f_pic(m.保存密码,'保存密码')then				--OK
			click(185,669)

			----------------------------------------帐号封号处理-------------------------------------
		elseif login_setp ~= 2 and c_pic(m.蓝色提示,'蓝色提示')then				--待定
		elseif login_setp ~= 2 and c_pic(m.蓝色提示2,'蓝色提示2')then			--确定
		elseif login_setp == 2 and f_pic(m.蓝色提示2,'蓝色提示2')then
			log_other = log_other or 0
			log_other = log_other + 1
			if log_other >= 5 then
				c_pic(m.蓝色提示2,'蓝色提示2')
			end
------------------------------------帐号处理问题------------------------
		end
	else
		if done(m.协议iTunesStore,'协议iTunesStore')then
			c_pic(m.协议同意,'协议同意')
			c_pic(m.协议完成,'协议完成')
		elseif done(m.帐户设置,'帐户设置')then
			c_pic(m.帐户设置完成,'帐户设置完成')
		end
	end
end

function RAPS(ids,state)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = 'http://www.150book.com/index.php/api/mail/account'
	headers_send = cjson.encode(headers)
	post = {}
	post['id'] = ids
	post['state'] = state
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post("http://www.150book.com/index.php/api/mail/account", 5, headers_send, post_escaped)
	delay(3)
	if status_resp ~= nil then
		return true
	end
end
function ASOA(mun)
	account_url = 'http://150book.com/index.php/api/mail/account/id/'..mun
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(account_url);





	if code == 200 then
		
		local json = sz.json
		local datas = json.decode(res)


		id = datas['data']["id"]
		account = datas['data']["account"]
		password = datas['data']["password"]
		state = datas['data']["state"]
		txt = id.."\r"..account.."\r"..password.."\r"..state
		nLog(txt)
		if state == "1" then
			return true
		end
	else
		dialog("帐号编号错误", 3)
		lua_exit()
	end
end

function login()
	login_arr = {'启动设置','准备登录','查询网络','获取帐号','登录帐号'}
	log_other = 0
	login_setp = 1
	logout = 0
	out_time = os.time()
	while (true) do
		if login_setp == 1 then
			if done(m.iTunes与App,'iTunes与App')or done(m['iTunes_iphone6'],'iTunes_iphone6')then
				login_setp = 2
			else
				openURL("prefs:root=STORE"); --打开登录界面
				toast('打开帐号登录界面',1)
				delay(5)
			end
		elseif login_setp == 2 then
			if logout == 0 and c_pic(m.AppleID,'已经登录')then
				logout = 1
			elseif f_pic(m.AppleID,'已经登录')then
				login_arr[2]='待注销帐号'
				delay(3)
			elseif f_pic(m.登录,'找到登录')then
				login_setp = 3
			elseif done(m.灰,'注销弹窗')and c_pic(m.注销,'注销')then
				login_arr[2]='注销帐号'
				delay(3)
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
				click(220,569) --点击取消,由输入错误
			elseif f_pic(m.登录灰,'登录灰')or f_pic(m.正在登录,'正在登录,弹窗灰')then
				toast('正在登录',1)
				delay(3)
			end			
		end
		sotp = sotp or 0
		if sotp ~= login_setp then
			sotp = login_setp
			waitTimes = os.time()
		elseif sotp == login_setp then
			if os.time() - waitTimes > 180 then
				closeApp(frontAppBid())
				toast('登录超时,网络错误');
				delay(3)
				waitTimes = os.time()
				mun = mun + 1
				return false
			end
		end
		other()
		delay(1)
		log('登录步骤~'..login_arr[login_setp]..'~'..login_setp)
		toast('登录步骤~'..login_arr[login_setp],1)
		if re_start == 1 then
			re_start = 0
			return false
		end
	end
end

function search(keys,move_times,app_name,bid_s)
	function write_ID(keys,app_name,txt)
		writeFile(file.done,mun.."|"..account.."|"..txt)
	end
	search_arr = {'打开STORE','输入关键词','下拉应用','购买页面'}
	search_setp = 1
	lun = lun or 0
	while (true) do
		if search_setp == 1 then
			if active(AppStore)then
				delay(2)
			elseif c_pic(m.搜索,'搜索')then
			elseif f_pic(m.搜索blue,'搜索-blue')then
				search_setp = 2
			end
		elseif search_setp == 2 then
			if c_pic(m['top-搜索'],'top-搜索')then
				input(keys)
				if c_pic(m['空格'],'空格')then
					input('\b')
				end
				c_pic(m['搜'],'搜')
			elseif c_pic(m['搜'],'搜')then
			elseif f_pic(m.有结果,'有结果')or f_pic(m.结果云,'结果云')then
				search_setp = 3
			else
				if active(AppStore)then
					delay(2)
				end
			end
			move_fast = 0 --快速滑动时间标记,0为开启,非0为关闭
			line_out = 0 --设置超时滑动数量
		elseif search_setp == 3 then
			if move_fast == 0 then
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
			if c_tu(app_name)then
				delay(2)
				if f_pic(m.AppPage,'应用详细页面')then
					search_setp = 4
				end
			else
				if active(AppStore)then
					search_setp = 1
				else
					moveUp(314,939,315,671)
					if f_pic(m.有应用,'有应用')then
						line_out = line_out + 1
						if line_out >= line then
							closeApp(AppStore)
							return false
						end
						bottom = 0
					else
						bottom = bottom or 0
						bottom = bottom + 1
						if bottom >= 60 then
							closeApp(frontAppBid())
							closeApp(AppStore)
							delay(2)
							search_setp = 1
						end
					end
				end
			end
			yun = 0
			dow = 0
		elseif search_setp == 4 then
			if f_pic(m.云,'云')then
				yun = yun + 1
				toast('云~'..yun)
				if yun >= 17 then
					toast('购买完成,准备一下步',2)
					delay(1)
					closeApp(AppStore)
					delay(1)
					return true
				end
			elseif dow == 1 and f_pic(m.打开,'打开')then
				toast('下载完成',1)
				delay(1)
				if ipaUninstall(bid_s) == 1 then
					closeApp(AppStore)
					delay(1)
					return true
				end
			elseif f_pic(m.打开,'打开')then
				delay(1)
				ipaUninstall(bid_s)
			elseif c_pic(m.正在下载,'正在下载')then
				toast('正在下载',1)
			elseif c_pic(m.获取,'获取')then
				toast('获取',1)
			elseif c_pic(m.安装,'安装')then
				toast('安装',1)
				dow = 1
			else
				toast('正在转圈',1)
				if frontAppBid() ~= AppStore then
					closeApp(AppStore)
					delay(2)
					search_setp = 1
				end
			end
		end
		log('步骤~'..search_arr[search_setp])
		---------------------------------超时验证-----------------------
		sotp = sotp or 0
		if sotp ~= search_setp then
			sotp = search_setp
			waitTimes = os.time() -----------------设置超时间
		elseif sotp == search_setp then
			if search_setp == 3 then
				wait_mun = 60 * 20 --由于排名没有200名以外的 所以滑动时间应该小于300秒
			else
				wait_mun = 180
			end
			if os.time() - waitTimes > wait_mun then
				closeApp(frontAppBid())
				toast('搜索超时~网络错误');
				delay(3)
				waitTimes = os.time()
				search_setp = 1
			end
		end
		---------------------------------超时验证-----------------------
		if re_start == 1 then
			re_start = 0
			return false
		end
		lun = lun + 1
		if lun%5 == 0 then
			other()
		end
		if search_setp ~= 3 then 
			delay(1)
		end
	end
end

--------------------------------------------脚本执行层面--------------------------

for i=1007,1080 do
	
	
end
----------------执行完一轮-----------------

doublePressHomeKey()
lua_exit()



