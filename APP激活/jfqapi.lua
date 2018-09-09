require("tsp")
require("阿波罗")
local sz = require("sz")


initLog("jfq", 1);

function initlogs(txt)
	wLog("jfq",txt);
end

function GetTask(bid,adid,ip,idfa)
	data_url = 'bid='..bid..'&adid='..adid..'&ip='..ip..'&idfa='..idfa
	ALL_url = ATM_jfq_URL.."?"..data_url
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	--dialog(res,0)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa], 0)
		toast(data[idfa],1)
		if data[idfa] == '0' then
			return true
		end
	end
end

function jd()
	
	abl()
	bid_jd = 'com.360buy.jdmobile'
	adid = '10002'
	ip_address = ip()
	get_idfa(bid_jd)
	ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_check2.php'
	京东商城_url = 'https://itunes.apple.com/cn/app/id414245413?mt=8'
	
	if VPN()then
		mSleep(1000)
		ip_address = ip()
		toast(ip_address,1)
		if ip_address then
			if GetTask(bid_jd,adid,ip_address,idfa)then
				toast('排重成功',1)
				up ={}
				up.mail = idfa
				up.fristname = '京东商城'
				up.lastname = bid_jd
				--up.phone = math.random(10000000000,99999999999)
				up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
				up.password = ip_address
				up.map = adid
				upFacebook(up)
				mSleep(1000)
				openURL(京东商城_url)
				return true
			else
				toast('排重失败',1)
			end
		else
			toast('ip-false',1)
		end
	end
end

function jdjr()
	abl()
	bid_jd = 'com.jd.jinrong'
	adid = '10001'
	get_idfa(bid_jd)
	ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_check2.php'
	京东商城_url = 'https://itunes.apple.com/cn/app/id895682747?mt=8'
	if VPN()then
		mSleep(1000)
		ip_address = ip()
		toast(ip_address,1)
		if ip_address then
			if GetTask(bid_jd,adid,ip_address,idfa)then
				toast('排重成功',1)
				up ={}
				up.mail = idfa
				up.fristname = '京东金融'
				up.lastname = bid_jd
				--up.phone = math.random(10000000000,99999999999)
				up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
				up.password = ip_address
				upFacebook(up)
				mSleep(1000)
				openURL(京东商城_url)
				return true
			else
				toast('排重失败',1)
			end
		else
			toast('ip-false',1)
		end
	end
end

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
	initlogs(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	
	initlogs(body_resp)
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

jdjr_str={}
jdjr_str['同意']={{447,1065,0x4d7bfe},}
jdjr_str['立即体验']={{250,982,0xfe0f00},}
jdjr_str['x']={{319,990,0x444444},{319,984,0xffffff},{326,991,0xffffff},}

function play()
	计时 = os.time()
	超时 = math.random(180,190)
	bid_jd = 'com.jd.jinrong'
	进入app = false
	x = true
	
	while (os.time()-计时<超时) do
		if active(bid_jd,3)then
		elseif done(jdjr_str['同意'],'同意',true,1)then
		elseif done(jdjr_str['立即体验'],'立即体验',true,1)then
			进入app = true
			x = false
		elseif x and done(jdjr_str['x'],'x',true,1)then
		else
			if 进入app then
				moveTo(0.8*w,h/2,0.3*w,h/2,50,20)
				--click(math.random(1,640),math.random(1,1136))
				mSleep(math.random(1000,5000))
			else
				moveTo(0.8*w,h/2,0.3*w,h/2,50,20)
				mSleep(math.random(1000,2000))
			end
		end
		mSleep(1000*2)
	end
end

jdsc = {}
jdsc['点击开启狂欢']={{320,960,0xf6ab2c},{317,998,0xf8aa2d},}
jdsc['同意']={{511,947,0xf23030},{410,945,0xf23030},}

function play_jdsc()
	计时 = os.time()
	超时 = math.random(180,190)
	bid_jd = 'com.360buy.jdmobile'
	进入app = false
	x = true
	
	while (os.time()-计时<超时) do
		if active(bid_jd,6)then
		elseif done(jdsc['点击开启狂欢'],'点击开启狂欢',true,1)then
			进入app = true		
		elseif done(jdsc['同意'],'同意',true,1)then

		else
			if 进入app then
				moveTo(0.8*w,h/2,0.3*w,h/2,50,20)
				click(math.random(1,640),math.random(1,1136))
				mSleep(math.random(1000,5000))
			else
				moveTo(0.8*w,h/2,0.3*w,h/2,50,20)
				click(math.random(1,640),math.random(1,1136))
				mSleep(math.random(1000,2000))
				click(40,40)
			end
		end
		mSleep(1000*2)
	end
end


while (true) do
	if jd()then
		mSleep(1000* math.random(10,15))
		play_jdsc()
	end
	close_VPN()
end










