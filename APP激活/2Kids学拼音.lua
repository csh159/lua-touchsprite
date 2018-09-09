require("tsp")
require("阿波罗")
local sz = require("sz")



Facebook_url = 'http://onlyonelife.online/Public/facebook/?service=Facebook.add'
function upFacebook(t)
	
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = Facebook_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
	
end


init('0',0)
app_name = '2Kids学拼音'
bid_app = 'cn.2kids.pinYin'

xpy={}
xpy['home']={{270,39,0xdd7aa8},{1030,66,0x80a2f9},{668,484,0xffe308},}
xpy['关于x']={{1115,143,0xffffff},{456,94,0xf78f02},{16,14,0x002e41},}
xpy['成功']={{1248,31,0x0cd0f8},{61,679,0xfd9408},{77,77,0xfdf2e7},}


function play()
	计时 = os.time()
	超时 = 30
	init('0',2)
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
		elseif done(xpy['成功'],'成功')then
			delay(math.random(5,12))
			return true
		elseif done(xpy['关于x'],'关于x',true,1)then
		elseif done(xpy['home'],'home',true,3)then
		end
		mSleep(1000*2)
	end
end

if xz(bid_app)then
	
	
	while true do
		if abl()then
			log('一键新机')
			get_idfa(bid_app)
			if false or VPN()then
				if play()then
					up ={}
					up.mail = idfa
					up.fristname = app_name
					up.lastname = bid_app
					up.password = 'ATM积分墙'
					up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
					up.map = '希望之光'
					upFacebook(up)
				end
			end
			close_VPN()
			delay(1)
		end
	end


end













