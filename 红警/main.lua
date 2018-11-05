require("TSLib")
require("tsp")
require("AWZ")
require("iphone6")




appbid = "com.ss.iphone.ugc.Aweme"
init(appbid,0)
var={}




--设置全局变量
t={}
t.升级={ 0xccac72, "0|27|0xf2ce91,0|30|0x6e5c44,0|31|0xecc787,-12|26|0xe5c183,13|26|0xe5c183", 90, 195, 426, 579, 846}
t['升级界面']={{556,1254,0x2dadda}, {50,86,0xfffbee}, {744,796,0xdfcb9d}, }
t['升级界面取消']={{502,775,0x49a6e0}, {215,771,0x18abab}, {37,637,0x311a11}, }

function free()
	if d("升级",true,1)then
	elseif d('升级界面取消',true,2)then
		click(50,341,3)
	elseif d('升级界面')then
		click(201,1231)
	else
		click(50,341,3)
	end
end


while (true) do
free()
end


































































































































