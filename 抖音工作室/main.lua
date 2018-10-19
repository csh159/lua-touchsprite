require("TSLib")
require("tsp")
require("AWZ")
require("lz-api")
require("yzm")
--require("ui")


	require("iphone6")




appbid = "com.ss.iphone.ugc.Aweme"
init(appbid,0)
local arrs ={}
arrs.show={477, 0, 665, 41}
arrs.commnet={645, 852, 733, 896}
arrs.send = 1
arrs.lady = false
arrs.man = false
arrs.kongbai = false


---------------------------------全局变量
function orc(t)
	local recognize = ocrText(t[1],t[2],t[3],t[4],0)
	if recognize ~= nil then
		nLog('识别结果--'..recognize)
		local i,j = string.find(recognize,"%d+")
		if i~= nil and j~= nil then
			recognize =string.sub(recognize,i,j)
			recognize = tonumber(recognize)
			recognize = recognize or 1
			nLog(recognize)
			return recognize
		end
	end
	return 0
end

function box(txt)
	boxshow(txt,arrs.show[1],arrs.show[2],arrs.show[3],arrs.show[4])
end

function getTXT()
	url = "http://idfa888.com/Public/dyid/?service=dyid.readtext"
	return get(url)['data']
end

function Tip()
	if d('弹窗_允许',true,1,"是否允许发送通知")then
	elseif d('弹窗_位置允许',true,1,"是否允许访问你的位置允许")then
--	elseif d('弹窗_通讯录取消',true,1)then
--	elseif d('弹窗_取消回复',true,1,"误点操作")then
--		return '取消回复'
	else
		log('no Tip')
		return true
	end
end

function newphone()
	url='http://127.0.0.1:8080/reset_app'
	get(url)
end

function tips()
	if d('弹窗_微博登录',true)then
	elseif d('弹窗_微博登录_绑定跳过',true)then
	elseif d('弹窗_位置允许',true)then
	elseif d('弹窗_允许',true)then
	else
		return true
	end
end

function login()
	local timeline = os.time()
	local utime = 60*5
	local 改资料 = true
	accountdata = get('http://wenfree.cn/api/Public/aoc/?service=Dy.get')
	if not(accountdata) then
		return false
	end
	
	while (os.time()-timeline < utime) do
		if active(appbid,5)then
			if d('首页红绿') then
				if d('首页红绿_完善资料',true)then
					

				elseif 改资料 then
					if d('首页红绿_我的页面')then
						click(123,255)	
					else
						click(668,1286)
					end
				end
			elseif d('弹窗_微博登录_界面')then
				
				if d('弹窗_微博登录_界面_密码',true)then
					input(accountdata.data.pwd)
					d('弹窗_微博登录_界面_完成',true)
				end				
				
				if d('弹窗_微博登录_界面_帐号',true)then
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(accountdata.data.account)
					d('弹窗_微博登录_界面_完成',true)
				end
				
				d('弹窗_微博登录_界面_登录',true)
			elseif d('弹窗_微博登录_安全验证')then
				delay(3)
				imgfile = lzScreen(210, 670, 545, 991,1.0)
				if false or lz_yzm() then
--					apple_yzm = "260,270|67,266|68,69|258,62|264,253"
					jiegoulist = strSplit(apple_yzm,"|")
					for i,v in ipairs(jiegoulist) do
						jiegoulist[i]=strSplit(v,",")
						jiegoulist[i][1] = jiegoulist[i][1]+210
						jiegoulist[i][2] = jiegoulist[i][2]+670
						
					end
					print_r(jiegoulist)
					if apple_yzm ~= '' then
						delay(1)
						for i,v in ipairs(jiegoulist) do
							if i == 1 then
								touchDown(1, v[1], v[2])
							elseif i == 4 then
								moveTo_(jiegoulist[i-1][1],jiegoulist[i-1][2],v[1], v[2],5)
								touchUp(1, v[1], v[2])
								break
							else
								moveTo_(jiegoulist[i-1][1],jiegoulist[i-1][2],v[1], v[2],5)
								delay(0.1)
							end
						end
					end
				else
					click(603,431)
				end
				delay(5)
			elseif d('弹窗_微博登录_授权登录',true)then
			elseif d('个人资料_保存')then
				click(178,1054)
				input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
				local dyurl = 'http://idfa888.com/Public/dyid/?service=dyid.readtext'
				local dydata=get(dyurl)
				if dydata ~= nil then
					print_r(dydata)
				end
				input(dydata.data.text)
				if d('个人资料_保存',true)then
					改资料 = false
					return true
				end
				
				
			else
				if tips()then
					moveTo(width/2,900,width/2,500)
				end
		
			end
		end
		delay(1)
	end

end



login()




































































































































