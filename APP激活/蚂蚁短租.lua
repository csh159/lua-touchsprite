require("TSLib")
require("tsp")

function put_log(content)
	log_content = "[DATE] " .. content
	wLog("jd",log_content)
	return true
end


page={}
page['阿波罗']={}
page['阿波罗']['一键新机']={ 0x1abc9c, "0|-8|0xecf0f1,-20|-7|0x26bfa1", 90, 55, 612, 222, 661}	
page['阿波罗']['确定']={ 0xf0f6f5, "0|-2|0x007aff,2|-2|0x007aff", 90, 280, 611, 358, 652}
page['阿波罗']['确定error']={ 0x007aff, "23|1|0x007aff", 90, 282, 648, 351, 680}
page['app']={}
page['app']['1']= { 0xff8c86, "5|0|0xff8c86,15|0|0xff8c86,20|5|0xffffff", 90,  248,  912,400,  956}
page['app']['2']= { 0xfd985a, "8|0|0xfd985a,16|0|0xfd985a,20|7|0xffffff", 90,  248,  912,400,  956}
page['app']['3']= { 0x90c8fb, "4|0|0x90c8fb,15|0|0x90c8fb,21|5|0xffffff" , 90,  248,  912,400,  956}
page['app']['4']= { 0xb0a5fe, "6|0|0xb0a5fe,11|0|0xb0a5fe", 90,   244,  910,388,  953 }
page['app']['办卡'] = { 0xff1919, "1|4|0xff1919,4|4|0xff1919", 90,  538, 1022, 579, 1052 }


--bundler_id = "com.iqianjin.AiShiDai"
bundler_id = 'com.mayi'
function abl()
	abl_bid = 'com.beibeijia.Apollon'
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local first_url = "http://127.0.0.1:1234/cmd?fun=newmachine"
	active(abl_bid,3)
	delay(3)  
	status, headers, body =  http.get(first_url)
	nLog(body)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	if success then
		return true
	else

		return false 
	end

end

function get_idfa()
	--采用 cjson 构造请求头部 json
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local first_url = "http://127.0.0.1:1234/cmd?fun=getfakeparams&params=" .. bundler_id

	status, headers, body =  http.get(first_url)
	nLog(body)
	local success, result = pcall(function(str) return cjson.decode(str) end, body)
	if success then
		local res_json = result
		idfa = res_json["data"]["com.mayi"]["idfa"]
		nLog("获取idfa : " .. idfa)
		return true
	else
		nLog("获取idfa fail" .. status)
		return false 
	end

end




function awz()
	openURL("IGG://cmd/newrecord");
	mSleep(3000)
	logTxt = '/var/mobile/iggresult.txt'
	out_time = os.time()
	while os.time()-out_time <= 10 do
		if file_exists(logTxt)then
			local new = readFile(logTxt)[1]
			if new == "1" then
				toast('一键新机成功',3)
				return true
			elseif new == "3" then
				toast('IP-->重复请注意',1)
				return true
			elseif new == '2' then
				nLog('指令正在执行过程中，还未完成')
			end
			mSleep(2000)
		else
			toast('一键新机',3)
			mSleep(1000* 3)
		end
	end
end

function upload_idfa()
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	headers = {}
	headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers['Referer'] = post_url
	headers_send = cjson.encode(headers)

	post = {}
	post['username'] = 'admin'
	post['pass'] = '1234qwer'
	post['ad_id'] = "mayi"
	post['appid'] = "494520120"
	post['idfa'] = idfa
	post['platform'] = 'tuniu'
	post['os_version'] = getOSVer()
	post_send = cjson.encode(post)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post("http://muser.safoo.com.cn/api/upload_dian_joy_record", 3, headers_send, post_escaped)
	put_log("upload idfa ")
	delay(1)
end



function activate_app()

	active(bundler_id)
	delay(5)
	local random_click_begin_time = os.time()
	local random_click_total_time = math.random(180,200)
	
	page['蚂蚁短租']={}
	page['蚂蚁短租']['首页']={{500,157,0x284b54},{457,153,0xb73122},{499,89,0x3f8192},}
	page['蚂蚁短租']['4个位置']={{73,1075,0x6cd4b6},{236,1078,0xffffff},{388,1076,0xeff1f2},{557,1077,0xe9ebed},}
	开屏 = true
	点击 = false
	
	while os.time()-random_click_begin_time < random_click_total_time do
		
		if done(page['蚂蚁短租']['首页'],"首页")then

			开屏 = false
			点击 = true
		end
		if 点击 then
			mun = math.random(1,4)
			click(page['蚂蚁短租']['4个位置'][mun][1],page['蚂蚁短租']['4个位置'][mun][2])
			delay(3)
		end
		
		if 开屏 then
			moveTo(600,  824,100,  824,50)
		end
	end
end


function set_vpn_enable_with_timeout()
	local 计时 = os.time()
	local 超时 = 60 
	setVPNEnable(true)
	while os.time()-计时< 超时 do
		delay(5)
		if VPN() then
			return true
		end
	end
end

init('0',0)

--转化为数字版本号

while (true) do
	if false or abl()then
		if false or set_vpn_enable_with_timeout()then
			if get_idfa()then
				upload_idfa()
				delay(3)
				activate_app()
			end
			close_VPN()
		end
	end
end

