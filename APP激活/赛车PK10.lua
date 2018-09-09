require("tsp")
require("阿波罗")

--nLog(frontAppBid())
app_bid = 'com.driftrallychampion.game'
account_path = '/User/Media/TouchSprite/lua/Pk10.txt';


page={}
page['立即更新']={ 0xffff00, "2|-9|0x020002,23|7|0x0f0d02,11|31|0xff7000", 90, 89, 607, 557, 751}


function get()
	timeline = os.time()
	while os.time()-timeline < 90 do
		if active(app_bid,5)then
		elseif c_pic(page['立即更新'],'立即更新',true)then
			mSleep(1000*3)
			return true
		end
		mSleep(1000)
	end
end





work_mun = 1

while (work_mun < 1100) do
	if VPN() then
		if abl()then
			if get()then
				if get_idfa(app_bid)then
					writeFile(account_path,idfa..'\n')
					work_mun = work_mun + 1
				end
			end
		end
		close_VPN()
		mSleep(1000* 5)
	end
end

























