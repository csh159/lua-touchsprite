require("TSLib")
require("tsp")



page={}
page['主页']={}
page['主页']['未登录']={ 0x505050, "8|-1|0xfafafa,8|0|0x505050,4|-8|0x505050", 90, 568, 1084, 581, 1103}
page['主页']['手机']={ 0xfcd1d1, "-17|0|0xf85959,23|0|0xf85b5b", 90, 20, 97, 168, 178}

page['注册页面']={}
page['注册页面']['注册弹窗']={{593,123,0x505050},{581,111,0x505050},{606,111,0x505050},}
page['注册页面']['手机号']={ 0xcacaca, "2|17|0xcfcfcf,-14|-4|0xcacaca,-14|15|0xcacaca", 90, 127, 299, 157, 347}
page['注册页面']['发送验证码']={ 0x252525, "-1|8|0x252525", 90, 413, 297, 558, 344}
page['注册页面']['请输入验证码']={ 0xcacaca, "-1|5|0xcacaca", 90, 89, 450, 281, 498}
page['注册页面']['进入头条']={ 0xf85959, "1|-5|0xffffff", 90, 248, 572, 394, 634}
page['注册页面']['请输入用户名']={ 0xcccccc, "17|21|0xcbcbcb", 90, 219, 305, 414, 362}
page['注册页面']['完成']={ 0xf85959, "1|-10|0xffffff", 90, 280, 441, 356, 499}

page['阿波罗']={}
page['阿波罗']['一键新机']={ 0x1abc9c, "0|-8|0xecf0f1,-20|-7|0x26bfa1", 90, 55, 612, 222, 661}
page['阿波罗']['确定']={ 0xf0f6f5, "0|-2|0x007aff,2|-2|0x007aff", 90, 280, 611, 358, 652}
page['阿波罗']['确定error']={ 0x007aff, "23|1|0x007aff", 90, 282, 648, 351, 680}

page['今日头条']={}
page['今日头条']['logo']={{55,71,0xd43d3d},{99,72,0xd43d3d},{101,72,0xffffff},{256,89,0x999999},}
page['今日头条']['主页']={{151,88,0x999999},{75,98,0xffffff},{77,100,0xd43d3d},{50,87,0xd43d3d},}
page['今日头条']['主页有内容']={ 0x222222, "", 90, 12, 214, 618, 1021}
page['今日头条']['主页未激活']={ 0x505050, "13|3|0xfdfdfd,14|3|0x505050,37|-6|0x505050", 90, 35, 1055, 112, 1130}
page['今日头条']['搜索Icon']={ 0x707070, "-14|-4|0x707070,-14|-22|0xf4f5f6,-14|-24|0x707070", 90, 40, 65, 84, 108}
page['今日头条']['请输入关键词']={ 0x707070, "5|-8|0x707070", 90, 90, 66, 272, 109}
page['今日头条']['有结果']={{479,76,0x8f8e94},{549,78,0x2a90d7},}
page['今日头条']['菜单->用户']={ 0x222222, "0|-19|0x222222,-10|-19|0x222222", 90, 411, 140, 483, 202}
page['今日头条']['关注']={ 0x2a90d7, "-25|-27|0x2a90d7,-39|26|0x2a90d7,-8|2|0xffffff,33|2|0x2a90d7", 90, 476, 217, 628, 499}
page['今日头条']['头条号']={ 0xf85959, "-37|3|0xf85959,22|1|0xf85959,4|-12|0xf85959", 90, 131, 221, 463, 361}
page['今日头条']['个人页面白']={{597,83,0xffffff},{39,83,0x2d2d2d},{570,83,0xffffff},{51,66,0xffffff},}
page['今日头条']['个人页面黑']={{604,83,0x222222},{588,82,0x222222},{572,82,0x222222},{36,83,0x222222},}
page['今日头条']['文章列表']={ 0xf4f5f6, "-4|-120|0x909090,8|-120|0x909090,20|-120|0x909090,14|-120|0xffffff", 90, 512, 612, 633, 1128}
page['今日头条']['写评论']={ 0x222222, "-23|0|0x222222,-24|0|0xf4f5f6,-8|-26|0x222222", 90, 22, 1052, 104, 1131}
page['今日头条']['正在播放视频']={{49,25,0xffffff},{33,42,0xffffff},{0,358,0xf85959},}
page['今日头条']['视频']={ 0x232323, "-9|-3|0x3c3c3c", 90, 311, 557, 371, 589}
page['今日头条']['视频激活']={ 0xf85959, "57|0|0xf85959", 90, 245, 523, 326, 597}
page['今日头条']['彩色点']={ 0xd9bf23, "", 90, 562, 637, 609, 711}

page['今日头条']['文章激活']={ 0xf85959, "-52|0|0xf85959", 90, 121, 511, 214, 609}
page['今日头条']['文章标题']={ 0x222222, "0|-8|0x222222", 90, 15, 627, 407, 1126}
page['今日头条']['头条号页面']={{36,83,0xffffff},{41,83,0x353535},{606,82,0xffffff},{608,82,0x393939},}



page['今日头条弹窗']={}
page['今日头条弹窗']['灰']={{351,2,0xcacaca},{362,2,0xcacaca},{373,2,0xcacaca},}
page['今日头条弹窗']['X']={ 0x505050, "-10|-10|0x505050,10|-10|0x505050,10|10|0x505050", 90, 482, 299, 539, 359}

page['今日头条评论']={}
page['今日头条评论']['发布']={ 0x2b90d7, "8|-9|0xffffff,20|-11|0x2a90d7", 90, 546, 502, 618, 550}
page['今日头条评论']['取消转发']={ 0xffffff, "0|-13|0x2a90d7,0|7|0x2a90d7", 90, 16, 573, 64, 614}



function Comment(text)
	计时 = os.time()
	超时 = 60 * 2
	发布 = 0
	
	while os.time()-计时<超时 do
		if c_pic(page['今日头条评论']['发布'],'发布',true)then
			delay(3)
			if c_pic(page['今日头条评论']['发布'],'发布',false)then
				toast('发布失败~再试一次',3)
				delay(3)
				发布 = 发布 + 1
				if 发布 > 10 then
					return false
				end
			else
				return true
			end
		elseif c_pic(page['今日头条']['写评论'],'写评论',true)then
			input(text)
			if false and c_pic(page['今日头条评论']['取消转发'],'取消转发',true)then
				delay(2)
			end
		end
	end

end


function Read(name)

	计时 = os.time()
	超时 = 60 * 2
	手机号 = true
	向上滑动 = 0
	搜索结果 = 0
	
	while os.time() - 计时 < 超时 do
		if active(app)then
			ms(5)
		elseif done(page['今日头条']['logo'],'logo',4,false)or done(page['今日头条']['主页'],'主页',4,false)then
			delay(6)
			if c_p(page['今日头条']['主页有内容'],'主页有内容',false)then
				done(page['今日头条']['logo'],'logo',4,true)
				done(page['今日头条']['主页'],'主页',1,true)
			else
				moveTo(w/2,h/2,w/2,h*0.7)
			end
			
		elseif c_pic(page['今日头条']['搜索Icon'],'搜索界面')then
			if done(page['今日头条']['有结果'],'有结果')then
				if true and c_pic(page['今日头条']['关注'],'关注',true)then
					delay(2)
					if done(page['今日头条弹窗']['灰'],'今日头条弹窗')then
						delay(2)
						c_pic(page['今日头条弹窗']['X'],'x',true)
						delay(2)
					end
					click(86,291)
				else
					if c_pic(page['今日头条']['头条号'],'头条号',true)then
						delay(rd(5,8))
					end
				end
				搜索结果 = 搜索结果 + 1
				if 搜索结果 > 20 then
					closeX(app)
					搜索结果 = 0
				elseif 搜索结果 > 10 then
					c_pic(page['今日头条']['菜单->用户'],'菜单->用户',true)
				end
				
			else
				if c_pic(page['今日头条']['请输入关键词'],'请输入关键词',true)then
					input(name)
					click(600,1091)	--点搜索\
					delay(5)
				end
			end
		elseif done(page['今日头条']['个人页面白'],'个人页面白') or done(page['今日头条']['个人页面黑'],'个人页面黑')or done(page['今日头条']['头条号页面'],'头条号页面')then
			if c_pic(page['今日头条']['写评论'],'文章页面',false)then
				delay(1)

				if 向上滑动 < 15 then
					moveTo(w/2,math.random(800,850),w/2,math.random(250,300),20)
					向上滑动 = 向上滑动 + 1
				elseif 向上滑动 >= 15 then
					return true
				end
			else
				if c_pic(page['今日头条']['文章激活'],'文章激活',false)then
					if c_pic(page['今日头条']['文章标题'],'文章标题',true)then
						delay(rd(2,5))
					end
				else
					click(168,549)
				end
			end
		elseif done(page['今日头条']['正在播放视频'],'正在播放视频')then
			delay(rd(10,20))
			return true
		elseif c_pic(page['今日头条']['主页未激活'],'主页未激活',true)then
			
		else
			log('read-other')
		end
		delay(1)
		
	end
	
end


function abl()

	计时 = os.time()
	超时 = 60 * 1
	abl_bid = 'com.beibeijia.Apollon'
	
	while os.time() - 计时 <= 超时 do
		if active(abl_bid,3)then
		elseif c_pic(page['阿波罗']['一键新机'],'一键新机',true)then
		elseif c_pic(page['阿波罗']['确定'],'确定',true)then
			if c_pic(page['阿波罗']['一键新机'],'一键新机',false)then
				return true
			end
		elseif c_pic(page['阿波罗']['确定error'],'确定error',true)then
		end
	end
	
end

function beforeUserExit()
	close_VPN()
end

function ms(n)
	mSleep(1000* n)
end

function rd(x,y)
	return math.random(x,y)
end


function awz()
	openURL("IGG://cmd/newrecord");
	mSleep(3000)
	logTxt = '/var/mobile/iggresult.txt'
	out_time = os.time()
	while os.time()-out_time <= 10 do
		if file_exists(logTxt)then
			local new = readFile(logTxt)[1]
			if new == "1" then
				toast('一键新机成功',3)
				return true
			elseif new == "3" then
				toast('IP-->重复请注意',1)
				return true
			elseif new == '2' then
				nLog('指令正在执行过程中，还未完成')
			end
			mSleep(2000)
		else
			toast('一键新机',3)
			mSleep(1000* 3)
		end
	end
end

--//项目id -----------
id = 1552
app = 'com.ss.iphone.article.News'
init('0',0)

--[[
while (true) do
	if false or abl()then
		if false or VPN()then
			Read('水果山庄梅宝宝')
			Read('南京中园旅游')
			close_VPN()
		end
	end
end
--]]









