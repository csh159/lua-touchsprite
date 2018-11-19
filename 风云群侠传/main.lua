require("TSLib")
require("tsp")
require("AWZ")


-- awzNew()

local url = 'http://uri6.com/tkio/EJ3ARba' 
local url = 'http://uri6.com/tkio/FRZNVfa' 


init('0',1)
var = {}
var.phone = '18349101229'
var.bid = 'com.fengyun.qxz.ios'
var.AppStore = 'com.apple.AppStore'
	


t={}
t['用户登录']={{1236,25,0x996c35}, {1073,28,0x8e652e}, }
t['正在更新']={ 0x421402, "624|0|0x421402", 90, 279, 609, 1055, 688}
t['你叫什么名字']={ 0x875e2b, "163|-124|0xffffff,140|-225|0x332d21,161|-133|0x0d20a7", 90, 457, 209, 914, 483}

t['向下箭头']={ 0xeabe3d, "-30|-37|0xbf9029,-28|-43|0x733415,24|-43|0x683016,-4|-71|0xccb727", 90, 0, 0, 1333, 749}
t['向右箭头']={ 0xfffaad, "-44|31|0xcba32d,-50|24|0x733314,-50|-25|0x6e3317,-44|-32|0xc88124,-78|-1|0xccb827", 90, 0, 0, 1333, 749}
t['向左箭头']={ 0xfffdb8, "46|-26|0xbc8b29,50|-22|0x7c3615,50|23|0x7b3514,79|-3|0xccb727", 90, 0, 0, 1333, 749}
t['向上箭头']={ 0xfffdb4, "-28|51|0x662f16,-30|45|0xc17821,23|50|0x7a3616,21|51|0x7b3616,0|79|0xccb727", 90, 0, 0, 1333, 749}



function open(url)
	openURL(url)
	delay(2)
	local timeLine = os.time()
	local outTime = 30
	while (os.time()-timeLine < outTime) do
		if frontAppBid() == var.AppStore then
			return true
		end
		delay(1)
	end
end

--open(url)
--lua_exit()


while (true) do
	if active(var.bid,5)then
		if d('用户登录')then
			input(var.phone)
			return true
		elseif d('正在更新') then
			closeApp(frontAppBid())
			return true
		elseif d('你叫什么名字',true,1)then
			delay(3)
			reName('创建角色')
			return true
		else
			keepScreen(true)
			if d('向下箭头')then
				click(x,y+80)
			elseif d('向右箭头')then
				click(x+80,y)			
			elseif d('向左箭头')then
				click(x-80,y)			
			elseif d('向上箭头')then
				click(x,y-50)
			end
			keepScreen(false)
		--	openURL(url)
			click(674,671,0.5)
		end
	end
	delay(0.5)
end































































