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
app_name = '星星学贷'
bid_app = 'com.qichen.jsy.xingxingdaisz'


function play()
	计时 = os.time()
	超时 = 60*0.5
	while (os.time()-计时<超时) do
		if active(bid_app,10)then
		else
			moveTo(w/2+200,h/2,w/2,h/2,20)
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
				up.password = '星星学贷'
				up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
				up.map = '1004'
				upFacebook(up)
		
		play()
			

	
		delay(2)
	end
end













