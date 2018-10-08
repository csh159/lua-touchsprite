init('0',1)
--list = '1234567890k'



function ocr(x1,y1,x2,y2)
	return ocrText(x1,y1,x2,y2, 0) or 0
end

aoc_zy={}
aoc_zy['资源']={}
aoc_zy['资源']['gold']={{404,239,0x152439},{542,260,0x132539},}
aoc_zy['资源']['water']={{643,240,0x17283c},{763,260,0x1b2d3f},}
aoc_zy['资源']['wood']={{852,239,0x162838},{979,260,0x142236},}
aoc_zy['资源']['blood']={{409,295,0x142439},{543,317,0x14263a},}
aoc_zy['资源']['silver']={{629,295,0x15273b},{759,316,0x172737},}
aoc_zy['资源']['crystal']={{841,295,0x182939},{981,317,0x132035},}
aoc_zy['资源']['mobi']={{909,398,0x17273b},{986,419,0x16253b},}

aoc_zy['set']={}
aoc_zy['set']['fight']={{133,553,0x760215},{249,578,0x6e0022},}			--战力
aoc_zy['set']['world']={{486,186,0x154261},{568,208,0x0e2c3f},}			--服
aoc_zy['set']['gid']={{490,133,0x184462},{669,155,0x1f4b63},}			--游戏id

aoc_zy['city']={}
aoc_zy['city']['lls']={{1023,26,0x1c3845},{1106,46,0x1f2f40},}
aoc_zy['city']['level']={{97,43,0x17121f},{158,68,0x484b55},}


--[[
show = {}
show['level'] = 0
show['fight'] = 0
show['service'] = 0
show['country'] = 0
show['lls'] = 0
show['gid'] = 0

show['gold'] = 0
show['water'] = 0
show['wood'] = 0
show['blood'] = 0
show['silver'] = 0
show['crystal'] = 0
show['mobi'] = 0
--]]


function get_info(t)
	for k,v in pairs(t)do
		show[k] = ocr(v[1][1],v[1][2],v[2][1],v[2][2])
	end
end

--[[
function get_info(t)
	for k,v in pairs(t)do
		local res = ocr(v[1][1],v[1][2],v[2][1],v[2][2])
		nLog(k .. '--' ..res) 
	end
end
--get_info(aoc_zy['资源'])
--]]

function upAoc(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	aoc_url = 'http://test1.oupag.com/Public/ao/?service=Ao.game'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(aoc_url, 15, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end

function upAoc_wenfree(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	
	aoc_url = 'http://wenfree.cn/api/Public/aoc/?service=User.game'
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = aoc_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(aoc_url, 15, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		return true
	end
end





