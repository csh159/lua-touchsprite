



if t == nil then
	t={}
end

t['快头条_tips_我知道了']={ 0xf54343, "140|4|0xf54343,64|-632|0xffbe22,68|-656|0xffe26f", 90, 95, 182, 540, 948}
t['快头条_tips_显示']={ 0x007aff, "-236|-6|0x007aff,-273|-2|0x007aff", 90, 79, 442, 563, 804}

t['快头条_写评论_阅读界面']={ 0xa7a7a7, "6|7|0xa7a7a7,30|2|0x9a9a9a,538|5|0x6f6f6f,541|5|0xffffff", 90, 11, 1031, 633, 1134}
t['快头条_写评论_已经领取']={ 0xf86663, "-14|-55|0xfeca27,-8|-13|0xffffff,-72|-3|0xfeca27,-26|-53|0xfeca27", 90, 481, 111, 634, 263}
t['快头条_写评论_展开全文']={ 0x3091f5, "68|-4|0x4398ee,73|-9|0xe8f3fd,30|-12|0x3091f5", 90, 176, 150, 461, 1034}
t['快头条_写评论_在播视频']={ 0xf54343, "-17|2|0xffffff,3|-24|0xf54343,6|29|0xf54343", 90, 493, 404, 636, 524}

t['快头条_ad_back']={ 0x5e5e5e, "7|-3|0xffffff,11|-14|0x5e5e5e", 90, 8, 47, 86, 125}

t['快头条_首页']={ 0xfe7153, "153|12|0x6e6e6e,320|3|0x6e6e6e,478|18|0x6e6e6e", 90, 15, 1044, 628, 1128}
t['快头条_首页_领取']={ 0xff6600, "-4|1|0xff6600,-3|1|0xffeec8", 90, 558, 60, 628, 133}

t['快头条_首页_我']={ 0xfc6a50, "-156|1|0x6e6e6e,-322|9|0x6e6e6e,-476|5|0x6e6e6e", 90, 16, 1032, 628, 1132}
t['快头条_我的金币']={ 0xf34548, "41|707|0xcecece,523|706|0xcecece,295|699|0xffffff", 90, 9, 43, 624, 1123}

function 快头条tips()
	if d('快头条_tips_我知道了',true,1)then
	elseif d('快头条_tips_显示',true,1) then
	else
		return true
	end
end


function kuaitoutiao()
	local TimeL = os.time()
	local outTime = rd(20,30)*60
	while (os.time()-TimeL < outTime ) do
		if active(arr.newsbid['快头条'],5)then
			if d('快头条_写评论_阅读界面')then
				if d('快头条_写评论_在播视频')then
					click(40,60)
				elseif d('快头条_写评论_已经领取')then
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(2)
					click(width/2,rd(300,900))
					delay(1)
				else
					d('快头条_写评论_展开全文',true)
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(rd(3,5))
				end
			elseif d('快头条_首页')then
				if d('快头条_首页_领取',true)then
					
				else
					click(width/2,rd(300,900))
				end
			elseif d('快头条_ad_back',true)then
			elseif d('快头条_首页_我',true,4)then
			else
				if 快头条tips()then
					click(40,60)
					moveTo(width/2,900,width/2,500,10)
					delay(rd(3,5))
				end
			end
		end
		delay(1)
	end
	--[[
	local logoutTime = os.time()
	while (true) do
		if os.time()-logoutTime >= 30 then return false end
		if d('快头条_首页',true,4)then
		elseif d('快头条_首页_我')then
			click(311,325)
		elseif d('快头条_我的金币')then
			金币 = ocr(12, 260,254, 351)
			log(金币,true)
			return true
		else
			click(40,60)
		end
		delay(2)
	end 
	--]]
end















