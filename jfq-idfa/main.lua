require("TSLib")
require("tsp")
local sz = require("sz")
require("阿波罗")
require("ReferenceLib")


--校验idfa是否可用
--http://91ami.com/ami/dev/api/third/partner_confirm_install.htm?uuid=1dfa3712f5da4394829e241acf1e3312&idfa={idfa}


function check_idfa()
	get_task_url = 'http://91ami.com/ami/dev/api/third/partner_confirm_install.htm?uuid='..keyword..'&idfa='..idfa
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		if res == '{"result_text":"","msg":"0"}' then
			nLog("接口成功")
			mSleep(200)
			return true
		else
			log('idfa,,,不可用')
		end

	end
end

--提交准备任务
-- http://91ami.com/ami/dev/api/third/click_down.htm?uuid=1dfa3712f5da4394829e241acf1e3312&idfa={idfa}&ip={ClientRemoteIP}&os_version={version}&mac={VirtualMac}&user=sirenxing&callback_url={callback}

function notice_idfa()
	callback = 'http://dajiang.dianzibaoka.top:18089/BCallBack/CallBack?st=2&pid='..BundleID..'&idfa='..idfa
	log(callback)
	get_task_url = 'http://91ami.com/ami/dev/api/third/click_down.htm?uuid='..keyword..'&idfa='..idfa..'&ip='..ip()..'&os_version='..getOSVer()..'&mac=02:00:00:00:00:00&user=sirenxing&callback_url='..callback
	
	log(get_task_url)
	
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		if res == '{"status":"1"}' then
			nLog("通知完成")
			mSleep(200)
			notice_me()
			return true
		else
			log('idfa,,,不可用')
		end

	end
end


--提交给我自己
--http://dajiang.dianzibaoka.top:18089/BCallBack/CallBack?st=1pid=&idfa=
function notice_me()
	get_task_url = 'http://dajiang.dianzibaoka.top:18089/BCallBack/CallBack?st=1&pid='..BundleID..'&idfa='..idfa
	log(get_task_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		if res == '{"status":"1"}' then
			nLog("通知完成")
			mSleep(200)
			return true
		else
			log('idfa,,,不可用')
		end

	end
end

--获取任务接口
--[[
http://106.75.48.143:8780/taskShipin/api/getTask 

    post["idfa"] = getDeviceID();		--手机设备号
    post["userName"] = "13411112222"	--用户名
    post["sn"] = getDeviceName()		--
    post["clientScript"] = wenhong_v0.1		--
	
    post["realIdfa"] = idfa		
    local sign = getDeviceID() .. getDeviceName()
    post["sign"] = sign:md5()

--]]





function get_Task(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = 'http://106.75.48.143:8780/taskShipin/api/getTask'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	
	post_send = cjson.encode(t)
	nLog('我上传的--' ..post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	
	nLog('得到结果\n'..body_resp)
	
	if status_resp == 200 then
		nLog('通讯成功')
		local json = sz.json
		loginData = json.decode(body_resp)
	
	end
end


init('0',0)
app_bid = 'com.baidu.BaiduMobile'
--xz(app_bid)

--[[
userPwd:123456
curRanking:null
code:0
userName:lb001233
vpnIp:88.88.88.88
changeIdfa:false
changeUdid:false
vpnDesc:打开
intoInfo:0
changeIdfv:false
vpnPassword:888@dotui.cn
gotoTop:0
scriptType:1
isComment:0
taskType:1
appName:手机百度
bundleId:
orderId:1801040010207022207
vpnPort:8080
appId:
vpnProtocol:PPTP
keyword:手机百度激活
]]

aoc={}
aoc['立即开始']={{344,894,0x000000},{310,413,0xe73838},{333,413,0x3c78ff},{318,338,0x316dff},}
aoc['好']={ 0x007aff, "-312|-14|0x007aff", 90, 77, 654, 532, 725}
aoc['允许']={ 0x007aff, "-256|-1|0x007aff", 90, 65, 595, 553, 783}
aoc['主界面']={{81,1094,0x000000},{294,1080,0x3388ff},{557,1071,0xa2a2a2},}


function play()
	计时 = os.time()
	超时 = 30
	上滑次数 = 0
	while (os.time()-计时< 超时) do
		if active(BundleID,3)then
		elseif c_pic(aoc['允许'],'允许',true,1)then
		elseif c_pic(aoc['好'],'好',true,1)then
		elseif done(aoc['立即开始'],'立即开始',true,1)then
		elseif done(aoc['主界面'],'主界面',false,1)then
			moveTo(300,500,300,300,50)
			上滑次数 = 上滑次数 + 1
			if 上滑次数 >= 3 then
				delay(math.random(5,10))
				return true
			end
		else
			--moveTo(500,300,300,300,50)
		end
		mSleep(1000*1)
	end
end



while (true) do
	if ref.net.getTask() == 0 then
		
		keyword = ref.net.keyword    ---当uuid用
		BundleID = ref.net.BundleID		--就是包名
		if abl()then
			if VPN()then
				get_idfa(BundleID)
				if check_idfa()then
					log('--准备上报')
					if notice_idfa() then
						mSleep(1000 * 3)
						if play()then
							ref.net.reportTask(1, '成功')
						else
							ref.net.reportTask(0, '失败')
						end
					end
				end
			end
		end
	else
		log('没有任务',true,5)
		mSleep(1000*3)
	end
	closeX(BundleID)
	close_VPN()
	delay(2)
end






















