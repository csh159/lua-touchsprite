require("tsp")
require("ALZ")
require("阿波罗")

init('0',1)
url = 'http://p.longtugame.com/apimob/ad?_c=19358'
app_bid = 'com.longtugame.rxjh'


--awzNew()
nLog(frontAppBid())


while (true) do
	if abl()then
		if VPN()then
			openURL(url)
			mSleep(1000* math.random(5,20))
			close_VPN()
		end
		mSleep(3000)
	end
	
end


















