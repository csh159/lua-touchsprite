init(0,0);
unlockDevice(); --解锁屏幕
require("TSLib")
require("5pass")
retTable = {}

token = '/User/Media/TouchSprite/res/token.txt'
delFile(token)

netTime = os.time()
while getNetTime() < 0 and os.time()- netTime <= 15 do
	mSleep(2000)
	toast('等待网络连接',2)
end
if isFileExist(token)then
	token_table = readFile(token)
	
	VpnKey 		= token_table[1]
	Keys 		= token_table[2]
	username	= token_table[3]
	pass	 	= token_table[4]
	
	for i,v in pairs(token_table)do
		nLog(v)
	end
	
	if get()~=true then
		toast('帐号密码错误',2)
--		delFile(token)
		mSleep(1000*60)
--		lua_exit()
	end
else
	require("UI")
	if get()then
		--writeFile(token,VpnKey.."\n"..Keys.."\n"..username.."\n"..pass,"w")
	else
		toast('参数错误',3)
		mSleep(1000*60)
--		lua_exit()
	end
end



function close_VPN()
	setVPNEnable(false)
	delay(2)
end

function VPN()
	setVPNEnable(true)
	mSleep(2000)
	flag = getVPNStatus()
	if flag.active then
		nLog("VPN 打开状态"..flag.status)
		if flag.status == '已连接' then
			return true
		end
	else
		nLog("VPN 关闭状态"..flag.status)
	end
end

function all()
	init('0',0)
	app_imei = 'com.abc123.serialudid'
	AppStore = 'com.apple.AppStore'
	account_false = 0
	ok_lun = 0
	while (true) do
		if VpnKey =="0" or VPN() then
			vpnfalse = 0
			mSleep(1000)
			if getNetTime() > 0 then
				toast("VPN网络正常",1)
				mSleep(1*1000)
				if get()then
					if ApplePass()then
						updata('yes','no')
						UP(password,'新问题?','pppp')
						ok_lun = ok_lun + 1
						if ok_lun == 3 then
							account_false = 3
							close_VPN()
							if Keys == "0"then
								if imei()then
									return true
								end
							end
						end
					else
						account_false = account_false + 1
						if account_false >= 3 then
							close_VPN()
							if Keys == "0" then
								if imei()then
									return true
								end
							end
						end
						
						closeApp(frontAppBid())
						close_VPN()
					end
					
				else
					toast('服务器上无帐号可以用',5)
					mSleep(5000)
				end
				
			else
				toast('网络异常',1)
				mSleep(1000)
				close_VPN()
				vpnfalse = vpnfalse or 0
				vpnfalse = vpnfalse + 1
				if vpnfalse >= 30 then
					setAirplaneMode(true);  --打开飞行模式
					delay(2)
					setAirplaneMode(false); --关闭飞行模式
					mSleep(1000)
					setWifiEnable(true);    --打开 Wifi
					delay(3)
				end
			end
		else
			toast('VPN拨号失败',1)
		end
	end
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		dialog(errMessage, 60)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end



