

--[[
	ios8.0-8.2
	aso 评论脚本
	据说是低版本的不删除

*      
*          ┌─┐       ┌─┐
*       ┌──┘ ┴───────┘ ┴──┐
*       │                 │
*       │       ───       │
*       │  ─┬┘       └┬─  │
*       │                 │
*       │       ─┴─       │
*       │                 │
*       └───┐         ┌───┘
*           │         │
*           │         │
*           │         │
*           │         └──────────────┐
*           │                        │
*           │                        ├─┐
*           │                        ┌─┘    
*           │                        │
*           └─┐  ┐  ┌───────┬──┐  ┌──┘         
*             │ ─┤ ─┤       │ ─┤ ─┤         	
*             └──┴──┘       └──┴──┘ 
*                 神兽保佑 
*                 代码无BUG! 

--]]

Version = 1


--全局变量

init('0',0)
AppStore = 'com.apple.AppStore'
Setting	 = 'com.apple.Preferences'

require("tsp")
require("Api")



page={}
page['iTunesStore']={}
page['iTunesStore']['Store']={{520,128,0xa7a7ab},{510,95,0x000000},}
page['iTunesStore']['AppleID']={ 0x007aff, "-35|-6|0xfbfcff,-36|-6|0x007aff", 90, 15, 186, 184, 388}
page['iTunesStore']['AppleID-black']={ 0x000000, "-26|-11|0x000000,-63|9|0x000000", 90, 9, 181, 181, 286}
--//登录需要识别的区域
page['AppStore']={}
page['AppStore']['精品推荐']={ 0x000000, "54|28|0x000000,108|2|0xf9f7f8,124|3|0x000000", 90, 235, 57, 407, 117}
page['AppStore']['搜索灰']={ 0x929292, "-13|-30|0x939393,-32|-12|0x939393,4|-12|0x939393", 90, 412, 1046, 480, 1112}
page['AppStore']['搜索蓝']={ 0x007aff, "-30|-13|0x007aff,4|-13|0x007aff,-14|-29|0x007aff", 90, 407, 1046, 488, 1135}
page['AppStore']['详情页']={ 0x007aff, "21|1|0x007aff,40|23|0x007aff", 90, 542, 46, 625, 119}
page['AppStore']['详情页2']={ 0x007aff, "3|-19|0x007aff,-1|-37|0xf8f8f8,-2|-37|0x007aff", 90, 440, 39, 538, 126}
page['AppStore']['获取']={ 0x0080fc, "6|0|0x0080fc,41|0|0x0080fc,-31|-24|0x0080fc,-38|26|0x0080fc", 90, 483, 206, 639, 533}
page['AppStore']['安装']={ 0x19ab20, "-5|-27|0x19ab20,33|-4|0x19ab20,-14|23|0x19ab20", 90, 483, 206, 639, 533}
page['AppStore']['打开']={ 0x1188fd, "23|6|0x0080fc,-30|-16|0x0080fc,-7|8|0xffffff,-21|35|0x0080fc", 90, 483, 206, 639, 533}
page['AppStore']['正在下载']={ 0x0080fc, "0|-25|0x0281fc,25|-1|0x0281fc,-8|-1|0xffffff,-24|-1|0x0281fc", 90, 514, 240, 637, 548}
page['AppStore']['云']={ 0x0080fc, "0|14|0x0080fc,-5|14|0x808080,-4|14|0xffffff", 90, 483, 206, 639, 533}
--//评论需要识别的区域
page['AppStore']['评论']={ 0x8e8e8e, "0|-11|0x848484,0|-30|0x848484,7|27|0x848484", 90, 292, 325, 346, 514}
page['AppStore']['评论激活']={ 0x848484, "160|4|0x848484,64|-18|0x848484,72|27|0x848484", 90, 230, 351, 407, 535}
page['AppStore']['五星灰']={ 0x848484, "21|0|0x848484,41|0|0x848484,61|0|0x848484,80|0|0x848484", 90, 10, 617, 133, 1031}
page['AppStore']['撰写评论']={ 0x0080fc, "37|1|0x0080fc,82|9|0x0080fc,112|9|0x0080fc", 90, 92, 566, 227, 1037}
page['AppStore']['撰写评论界面']={{258,86,0x000000},{311,84,0x000000},{343,86,0x000000},{380,97,0x000000},}
page['AppStore']['评论发送']={ 0x007aff, "4|-5|0x007aff", 90, 565, 77, 622, 100}
page['AppStore']['创建昵称']={ 0xc7c7cd, "21|-1|0xc7c7cd", 100, 239, 236, 316, 283}
page['AppStore']['评论标题']={ 0xc7c7cd, "22|4|0xc7c7cd,39|-6|0xffffff,41|-3|0xc7c7cd", 98, 44, 248, 98, 277}
page['AppStore']['评论标题2']={ 0xc7c7cd, "-1|-8|0xc7c7cd", 100, 62, 339, 98, 364}
page['AppStore']['评论内容']={ 0xb2b2b2, "25|7|0xb2b2b2", 100, 10, 313, 249, 456}
page['AppStore']['空格']={ 0x000000, "8|10|0x000000", 90, 244, 1062, 366, 1119}
page['AppStore']['评论完成'] = {{566,74,0x007aff},{573,72,0xf9f9f9},{574,72,0x007aff},{570,82,0xf9f9f9},{569,82,0x007aff},}

--//处理错误的地方集
page['弹窗']={}
page['弹窗']['有弹窗']={{276,3,0x949495},{299,3,0x949495},{364,3,0x949495},}
page['弹窗']['注销']={ 0x007aff, "23|-3|0x007aff,42|-5|0x007aff", 90, 276, 558, 372, 646}
page['弹窗']['密码错误']={ 0x000000, "0|1|0xeceef0,47|13|0x000000,61|16|0x010101", 90, 339, 526, 487, 563}
page['弹窗']['登录iTunesStore']={ 0x000000, "31|-8|0x1b1a1a,32|-8|0xf5f2f3,210|-8|0x000000", 90, 241, 180, 465, 264}
page['弹窗']['AppleID停用']={ 0x000000, "59|0|0x000000,97|0|0x181717,98|0|0xf6f2ee,103|0|0x000000", 90, 207, 518, 318, 542}
page['弹窗']['无法连接']={ 0x151515, "46|2|0xf5f6f7,47|2|0x070707,178|1|0x000000,181|1|0x323232", 90, 135, 515, 321, 542}
page['弹窗']['条件更改']={ 0x000000, "18|3|0xf6f6f6,22|1|0x222222,46|2|0x141414", 90, 491, 453, 555, 472}
page['弹窗']['协议同意']={ 0x000000, "0|-4|0xf7f8f8,0|-12|0x000000,12|-12|0x000000", 90, 509, 495, 529, 520}
page['弹窗']['立即下载']={ 0x000000, "24|0|0x000000,11|25|0x000000,8|3|0xf6f5f3", 90, 321, 478, 352, 533}
page['弹窗']['帐号禁用']={ 0x000000, "0|2|0xf7f8f8,20|4|0x171717,53|-14|0x000000", 90, 371, 473, 436, 505}
page['弹窗']['未过检']={ 0x000000, "44|-1|0x000000,49|3|0x000000,49|2|0xf1f2f3", 90, 396, 442, 467, 485}
page['弹窗']['需要验证']={ 0x0c0c0c, "59|17|0x000000,109|3|0x000000,120|24|0xf1f2f1", 90, 257, 474, 387, 503}
page['弹窗']['表格填写不完整']={ 0x030303, "25|0|0x000000,20|5|0xeeeeee,20|6|0x000000", 90, 357, 493, 420, 521}
page['弹窗']['未能登录']={ 0x000000, "-12|-6|0x000000,-14|-6|0xf6f7f7,-22|-9|0x000000", 90, 254, 494, 283, 508}
page['弹窗']['蓝色提示']={ 0x007aff, "", 90, 58, 334, 310, 881}


--//错误的页面收集处理
page['处误页面']={}
page['处误页面']['iTunesStore']={{225,72,0x010101},{225,76,0xf7f7f7},{225,95,0x010101},}
page['处误页面']['右下同意']={ 0x007aff, 90, 547, 1066, 632, 1117}
page['处误页面']['右上完成']={ 0x007aff, "", 90, 566, 76, 623, 100}
page['处误页面']['帐户设置']={{370,71,0x000000},{303,75,0x000000},{298,77,0xf7f7f8},}
--//数据采集区域

account = 'wenhong520@qq.com'
password = 'AaDd112233'
密码输入 = false
re_start = 0

function click(x,y)
	times = times or 0.5
	Offset = math.random(-3,3)
	touchDown(1, x+Offset, y+Offset)
	mSleep(40+Offset)
	touchUp(1, x+Offset, y+Offset)
	mSleep(1000*times)
end

function tips()
	if done(page['弹窗']['有弹窗'],'有弹窗',false)then
		toast('弹窗处理',2)
		mSleep(1000*2)
		--//有弹窗准备延迟2秒
		if c_pic(page['弹窗']['密码错误'],'密码错误',false)and c_pic(page['弹窗']['未能登录'],'未能登录',false) then
			click(320,647)
			errorAccount('密码错误',4)
		elseif c_pic(page['弹窗']['登录iTunesStore'],'登录iTunesStore',false)then
			if 密码输入 then
				input(password)
				click(462,484)  --//点击好
			else
				click(199,502)	--//点击左边取消
			end
		elseif c_pic(page['弹窗']['AppleID停用'],'AppleID停用',false)then
			click(322,622)
			errorAccount('停用',4)		
		elseif c_pic(page['弹窗']['帐号禁用'],'帐号禁用',false)then
			click(184,662)
			errorAccount('帐号禁用',2)
		elseif c_pic(page['弹窗']['无法连接'],'无法连接',false)then
			click(326,623)
		elseif c_pic(page['弹窗']['条件更改'],'协议条件更改',false)then
			click(455,684)		
		elseif c_pic(page['弹窗']['协议同意'],'协议同意',false)then
			click(449,641)
		elseif c_pic(page['弹窗']['表格填写不完整'],'表格填写不完整',false)then	
			click(324,647)
			errorAccount('未过检帐号',0)
		elseif c_pic(page['弹窗']['立即下载'],'立即下载',false)then
			click(319,646)
		elseif c_pic(page['弹窗']['未过检'],'未过检',false)then
			click(190,684)
			errorAccount('未过检帐号',0)
		elseif c_pic(page['弹窗']['需要验证'],'需要验证',false)then	
			click(454,661)		
		elseif c_pic(page['弹窗']['未能登录'],'未能登录',false)then	
			click(327,651)
			errorAccount('密码错误',4)
		elseif c_p(page['弹窗']['蓝色提示'],'蓝色提示',true)then
		end
	else
		if done(page['处误页面']['iTunesStore'],'iTunesStore')then
			c_p(page['处误页面']['右下同意'],'右下同意',true)
			c_p(page['处误页面']['右上完成'],'右上完成',true)
		elseif done(page['处误页面']['帐户设置'],'帐户设置')then
			c_p(page['处误页面']['右上完成'],'右上完成',true)
		end
	end
end

function comment(title,content,user_name)
	计时 = os.time()
	超时 = 60 * 3 -- 设置3分钟超时
	setp = 1
	while os.time()-计时 < 超时 do
		if setp == 1 then
			if c_pic(page['AppStore']['评论激活'],"评论激活")then
				if c_pic(page['AppStore']['撰写评论'],'撰写评论',false) then
					setp = 2
				else
					click(429,632) 	--所有版本
				end
				
			elseif c_pic(page['AppStore']['五星灰'],'五星灰')and c_pic(page['AppStore']['评论激活'],"评论激活") then
				moveTo(314,841,318,746,2)
			elseif c_pic(page['AppStore']['评论'],'点击评论',true)then
			end
		elseif setp == 2 then
			if c_pic(page['AppStore']['评论发送'],'评论发送',false)then
				setp = 3
			elseif c_pic(page['AppStore']['撰写评论'],'撰写评论',true) then
			end
			
			昵称 = true
			标题 = true
			内容 = true
			发送 = true
			
		elseif setp == 3 then
			if c_pic(page['AppStore']['评论激活'],"评论激活") and c_pic(page['AppStore']['撰写评论'],'撰写评论')then
				log('评论发送成功',true,3)
				return true
			elseif isColor(459,159,0xb2b2b2)then  ---判断5星 为灰色则点击
				click(459,159)
			elseif 昵称 and c_pic(page['AppStore']['创建昵称'],'创建昵称',true)then
				input(user_name)
				昵称 = false
			elseif 标题 and (c_pic(page['AppStore']['评论标题'],'标题',true) or c_pic(page['AppStore']['评论标题2'],'标题',true))then
				input(title)
				标题 = false
			elseif 内容 and c_pic(page['AppStore']['评论内容'],'评论内容',true)then
				input(content)
				if c_pic(page['AppStore']['空格'],'空格',true)then
					内容 = false
				end
				input("\b")
			elseif 发送 and c_pic(page['AppStore']['评论发送'],'发送',true)then
				发送 = false
			end
		end
		mSleep(1000)
		tips()
		log('---')
	end
end

function open()
	delay(1)
	tips()
	url = 'https://itunes.apple.com/cn/app/id'..image
	openURL(url)
	计时 = os.time()
	超时 = 60 * 2 --30秒超时
	while os.time()-计时 < 超时 do
		mSleep(1000* 2)
		if c_pic(page['AppStore']['详情页'],'详情页',false)or  c_pic(page['AppStore']['详情页2'],'详情页2',false)then
			log('App详情页显示',true,2)
			mSleep(1000 * 2)
			return true
		end
		tips()
		mSleep(1000* 1)
		openURL(url)
		log('----')
	end
end


function aso(app_id,app_bid)
	获取 = true
	安装 = true
	计时 = os.time()
	超时 = 60 * 5 --5分钟超时
	while os.time()- 计时 < 超时 do
		
		if re_start == 1 then
			return false
		end

		if 获取 and c_pic(page['AppStore']['获取'],'获取',true)then
			获取 = false
		elseif 安装 and c_pic(page['AppStore']['安装'],'安装',true)then
			安装 = false
			密码输入 = true
		elseif c_pic(page['AppStore']['打开'],'打开')then
			toast("卸载应用",10)
			ipaUninstall(app_bid)				
			closeX(AppStore)
			safari(app_id)
		elseif c_pic(page['AppStore']['正在下载'],'正在下载',true)then
			log('取消下载',true,3)
			mSleep(1000*3)
		elseif c_pic(page['AppStore']['云'],'云',false)then
			log('已经拥有',true,5)
			return true
		end
	
		tips()
		mSleep(1000* 1)
		log('----')
		
	end
end
--safari("1143470119")
--aso("1143470119","com.yizhao.OneHit")

function login()

注销 = true
登录 = false
计时 = os.time()
超时 = 60 * 3 --3分钟超时

while os.time() - 计时 < 超时 do
	
	if re_start == 1 then
		return
	end

	if 注销 and c_pic(page['iTunesStore']['AppleID'],'AppleID',true)then
		mSleep(1000*2)
		if c_pic(page['弹窗']['注销'],'注销',true)then
			注销 = false
		end
	elseif 登录 and c_pic(page['iTunesStore']['AppleID'],'AppleID',false)then
		mSleep(1000)
		log(account..' 登录成功',true,2)
		--closeX(AppStore)
		return true
	elseif done(page['弹窗']['有弹窗'],'有弹窗',false)then
		if c_pic(page['弹窗']['注销'],'注销',true)then
			注销 = false
		end
	elseif c_pic(page['iTunesStore']['AppleID-black'],'AppleID-black',true)then
		注销 = false
		input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
		mSleep(500)
		input(account)
		click(597,1095) --点击换行
		input(password)
		click(597,1095) --点击登录
		mSleep(1000*5)	--给5秒反应时间
		登录 = true
	else
		if done(page['iTunesStore']['Store'],'Store')~=true then
			openURL("prefs:root=STORE")
			mSleep(1000*5)
		elseif done(page['弹窗']['有弹窗'],'有弹窗')~=true then
			log('返回顶部')
			click(w/2,20)
			mSleep(1000*3)
		end
	end

	mSleep(1000 * 1)
	tips()
end

end

	
function all()


while (true) do
	if GetTask()then
		re_start = 0
		密码输入 = false
		if login()then
			for i,v in ipairs(data.tasks)do
				log('任务--'..i)
				keywords = v.keywords
				rank = v.rank
				image = v.image
				log(image)
				app_id = v.app_id
				open_comments = v.open_comments
				
				if re_start == 1 then
					log('帐号问题 结束整个流程  \n\n\n\n\n\n\n-------')
					return false
				end
				
				if open()then
					if aso(image,app_id)then
						if open_comments then
							user_name = v.user_name..myRand(7,1)
							if comment(v.comment.title,v.comment.content,user_name)then
								successfull(v.app_name,v.task_id)
							end
						else
							successfull(v.app_name,v.task_id)
						end
					end
				end
				closeX(AppStore)
			end
		end
	else
		mSleep(1000*10)
	end
end

end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		dialog(errMessage, 5)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
