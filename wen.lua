local ver = 1.0

--[[
	绯虹上弦月插件.lua
--]]

function QMPlugin.openvpn()	--打开vpn
	os.execute("activator send switch-on.com.a3tweaks.switch.vpn")
end
function QMPlugin.closedvpn()	--断开VPN
	os.execute("activator send switch-off.com.a3tweaks.switch.vpn")
end
