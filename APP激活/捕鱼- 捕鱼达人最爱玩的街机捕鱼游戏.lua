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


init('0',1)
app_name = '捕鱼'
bid_app = 'com.buyu.com'

puyu = {}
puyu['x']={ 0xf4fcfe, "-11|0|0x3692e1,10|0|0x41a4e3,0|-11|0x57c9e6", 90, 791, 109, 839, 151}
puyu['开始游戏']={{578,564,0xfff6c8},{583,564,0x04387d},{584,564,0xf8f1c5},}
puyu['游戏界面']={{47,41,0xddf4f9},{1106,46,0x164466},{79,564,0xfff57d},}
puyu['正在游戏']={{33,59,0xf8d23e},{19,32,0x1474a8},{1120,6,0x1681b7},}


function play()
	计时 = os.time()
	超时 = 60*0.5
	while (os.time()-计时<超时) do
		if active(bid_app,10)then
		elseif done(puyu['正在游戏'],'正在游戏',false,1)then
			click(548,225)
		elseif done(puyu['游戏界面'],'游戏界面',false,1)then
			click(548,225)
		elseif done(puyu['开始游戏'],'开始游戏',true,1)then
		elseif c_pic(puyu['x'],'x',true)then
		else
			click(h/2,w/2)
		end
	end
end


while true do
	if abl()then
		log('一键新机')
		get_idfa(bid_app)
		delay(1)

					up ={}
					up.mail = idfa
					up.fristname = app_name
					up.lastname = bid_app
					up.password = 'Aa112211'
					up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
					up.map = '1004'
					upFacebook(up)
		
		play()
			

	
		delay(2)
	end
end













