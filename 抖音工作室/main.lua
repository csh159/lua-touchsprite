require("TSLib")
require("tsp")
require("AWZ")



if width == 750 then
	require("iphone6")
end



appbid = "com.ss.iphone.ugc.Aweme"
init(appbid,0)
local arrs ={}
arrs.show={477, 0, 665, 41}
arrs.commnet={645, 852, 733, 896}
arrs.send = 1
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
	elseif d('弹窗_通讯录取消',true,1)then
	elseif d('弹窗_取消回复',true,1,"误点操作")then
		return '取消回复'
	else
		log('no Tip')
		return true
	end
end

t['后退按钮']={40,60}
t['评论分割线']={ 0x232323, "20|0|0x232323,155|0|0x232323,328|0|0x232323,407|0|0x232323", 90, 95, 551, 555, 725}

t['抖音_用户界面']={{707,84,0xa0a3ae},{693,84,0xa0a3ae},{680,84,0xa1a4ae},{40,84,0xa9abb3},}
t['抖音_用户界面_大关注+关注']={ 0xffeaee, "45|-36|0xfe2c55,-79|-4|0xfe2c55,143|-2|0xfe2c55,29|35|0xfe2c55", 90, 356, 201, 667, 331 }
t['抖音_用户界面_发消息']={ 0xc5bfc3, "261|-173|0xa1a4ae,168|4|0xc1bec3,168|10|0xc1bec3", 80, 342, 39, 732, 311 }
t['抖音_用户界面_性别男']={ 0xb4b5a0, "-4|0|0xb4b4a0,-4|10|0xb4b5a0,-10|15|0xb1b29d,-16|10|0xb4b4a0,-10|3|0xb4b4a0", 70, 43, 512, 64, 796}

t['抖音_用户界面_图片']={ 0x161823, "-21|-10|0xffffff,-15|-3|0x161823,-25|-3|0x161823,-96|8|0x161823,-109|3|0xffffff", 90, 
	539, 627, 748, 1333}
t['弹窗_取消回复']={ 0x007aff, "41|2|0x007aff,34|-130|0xff3b30,44|-133|0xff3b30", 90, 315, 1079, 424, 1294}
t['弹窗_通讯录取消']={  0x6a6b77, "272|0|0x292b37,265|-543|0x3aa6ff,256|-537|0xf6ff36", 90, 57, 288, 679, 1059}


function commnet_follow()
	local Timeline = os.time()
	local Outtimes = 60*10
	local commnet_up = 0
	local commnet_up_key = false
	local success = 0
	local todo = getTXT()

	while (os.time()-Timeline<Outtimes) do
		if active(appbid,5)then
			if success >= tonumber(todo.mun) then
				return true
			end

			if tab("首页菜单",true,1,"首页菜单-点击首页",80) then
				delay(rd(8,10))
				boxshow('加载首页',arrs.show[1],arrs.show[2],arrs.show[3],arrs.show[4])
				keepScreen(true)
				local commnet_count = orc(arrs.commnet)
				boxshow('评论数量->'..commnet_count,arrs.show[1],arrs.show[2],arrs.show[3],arrs.show[4])
				keepScreen(false)
				if commnet_count > 500 then
					click(686,808)
				end
			elseif d('评论弹出界面')then
	--			log(commnet_up)
				if commnet_up >= 30 then
					if d('评论弹出界面',true,1)then
						commnet_up = 0
					end
				elseif commnet_up_key then
					moveTo_(370,700+160,370,700,2,20)
					commnet_up = commnet_up + 1
					commnet_up_key = false
				elseif d('评论分割线')then
					log(x..','..y)
					keepScreen(true)
					local commnetTime = orc({x,y-50,x+150,y})
					local likes = orc({x+570,y-77,x+616,y-39})
					boxshow('评论时间->'..commnetTime..'min',arrs.show[1],arrs.show[2],arrs.show[3],arrs.show[4])
					keepScreen(false)
					if commnetTime <= 6 and likes <= 10 then
						click(x-60,y-120)
						commnet_up_key = true
					elseif commnetTime >= 30 then
						commnet_up = 30
					else
						moveTo_(370,y+160,370,y,5,20)
						commnet_up = commnet_up + 1
						delay(1)
					end
				else
					commnet_up_key = true
				end
			elseif d('抖音_用户界面')then
				box('用户界面')
				if d('抖音_用户界面_性别男') then
					if d('抖音_用户界面_大关注+关注',true)then
					elseif d('抖音_用户界面_发消息',false)then
						success = success + 1
						commnet_up_key = true
						click(t['后退按钮'][1],t['后退按钮'][2])
						delay(2)
					end
				else
					box('性别非男')
					click(t['后退按钮'][1],t['后退按钮'][2])
					commnet_up_key = true
				end
			else
				log("Tip")
				local tip_r = Tip()
				if tip_r == '取消回复' then
					commnet_up_key = true
				end
			end
		end
	end
	delay(1)
end


--print_r()
--orc(arrs.commnet)
--d('抖音_用户界面_性别男')

--[[]]
while (true) do

	commnet_follow()
	awz_next()
	
end
--]]






























































































































































