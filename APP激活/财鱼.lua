




require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")


initLog("jfq", 1);

function initlogs(txt)
	wLog("jfq",txt);
end


手机键盘={
	{113,751,0x000000},{314,759,0x000000},{539,760,0x000000},
	{117,860,0x000000},{324,858,0xffffff},{551,868,0xffffff},
	{112,964,0xf8f8f8},{319,967,0xffffff},{540,962,0x000000},
	[0]={331,1078,0x000000},}

	
function input_phone(txt)
	for i =1,string.len(txt) do
		nLog(string.sub(txt,i,i))
		phone_mun_input = tonumber(string.sub(txt,i,i))
		click(手机键盘[phone_mun_input][1],手机键盘[phone_mun_input][2],0.25)
	end
end

function GetTask(bid,adid,idfa)
	data_url = 'bid='..bid..'&idfa='..idfa..'&source=sz&adid='..adid
	ALL_url = ATM_jfq_URL.."?"..data_url
	nLog(ALL_url)
	initlogs(ALL_url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(ALL_url);
	initlogs(res)
	nLog(res)
	--dialog(res,0)
	nLog('code'..code)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		--dialog(data[idfa],0)
		toast(data[idfa],1)
		if tonumber(data[idfa]) == 0 then
			nLog('idfa可用')
			return true
		end
	end
end

function upidfa()
	
	if abl()then
		get_idfa(bid_app)
		ATM_jfq_URL = 'http://apiyoumi.kdatm.com/show/query/idfa_tuniu.php'
		app_url = 'https://itunes.apple.com/cn/app/id597364850?mt=8'
		
		if VPN()then
			mSleep(1000)
			ip_address = ip()
			toast(ip_address,1)
			if ip_address then
				if GetTask("yylls",adid,idfa)then
					toast('排重成功',1)
					up ={}
					up.mail = idfa
					up.fristname = app_name
					up.lastname = bid_app
					--up.phone = math.random(10000000000,99999999999)
					up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
					up.password = ip_address
					up.map = adid
					upFacebook(up)
					mSleep(1000)
					openURL(app_url)
					return true
				else
					toast('排重失败',1)
				end
			else
				toast('ip-false',1)
			end
		end
	end
	
end

function up_my_self(password)
	up ={}
	up.mail = idfa
	up.fristname = app_name
	up.lastname = bid_app
	--up.phone = math.random(10000000000,99999999999)
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = password
	up.map = adid
	upFacebook(up)
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

aoc={}
aoc['lls']={}
aoc['lls']['开始学习']={{200,1053,0x4fcb19},{438,1057,0x4fcb19},}
aoc['lls']['注册界面']={{77,103,0x787878},{384,933,0x616161},{245,915,0x616161},{544,92,0xf2f2f2},}
	aoc['lls']['手机号']={ 0xcccccc, "0|-20|0xcccccc,0|-28|0xcccccc", 90, 200, 326, 450, 381}
	aoc['lls']['获取验证码']={ 0x4fcb19, "", 90, 263, 460, 375, 487}
aoc['lls']['验证码界面']={{76,103,0x787878},{381,172,0x212121},}
aoc['lls']['注册成功']={{187,822,0x4fcb19},{458,823,0x4fcb19},{328,1005,0x474747},}
aoc['lls']['APP界面']={{52,69,0x979797},{335,71,0x757575},{574,64,0x979797},}
	aoc['lls']['第一页']={{168,493,0x363535},{466,511,0x653927},}
	aoc['lls']['第二页']={{170,389,0x5c3f34},{477,381,0x5e4841},{163,633,0xaa706c},{446,664,0xf7bfad},}
	aoc['lls']['第三页']={{113,296,0xed6768},{309,293,0xfbb84d},}
	aoc['lls']['暂停']={{57,57,0x787878},{74,59,0x787878},}	--264,490
	aoc['lls']['小姐姐']={{303,923,0x4fcb19},{303,859,0x4fcb19},{90,892,0x4fcb19},{542,898,0x4fcb19},}
	
兴趣={{112,318,0xffffff},{413,311,0xffffff},{526,315,0xffffff},{180,477,0xffffff},{321,478,0xffffff},
				{521,482,0x23c4bc},{104,630,0xeb5f6f},{311,623,0xffeee0},{526,634,0xffffff},{122,797,0xb6e3d6},
				{324,798,0xffffff},{520,787,0xffffff},
				}	

function reg()
	计时 = os.time()
	超时 = math.random(10,20)
	取号 = true
	获取 = false

	
	while (os.time()-计时<超时) do
		if active(bid_app,3)then
	
		else
			moveTo(500,300,200,300,30)
		end
		mSleep(1000*1)
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
  post['ad_id'] = bid_app
  post['appid'] = number_bundler_id
  post['idfa'] = idfa
  post['platform']='people'
  post_send = cjson.encode(post)
  post_escaped = http.build_request(post_send)
  status_resp, headers_resp, body_resp = http.post("http://muser.safoo.com.cn/api/upload_dian_joy_record", 3, headers_send, post_escaped)
  delay(1)
end
--ALZ()

init(0,"0")
number_bundler_id = '953052361'
app_name = '财鱼管家—全资产账本'
bid_app = 'com.caiyuhousekeeper.sumcloud'
adid = '南京肉刷'
id = 16649
token = '20801571-3b8c-4fcb-be16-5da3d5633c60'

xz(bid_app)

while (true) do
	if abl() then
		if VPN()then
			if get_idfa(bid_app)then
				upload_idfa()
--				up_my_self('未注册状态')
				if reg()then
--					up_my_self('注册成功')
				end
			end
			close_VPN()
			delay(2)
		end
	end
end




































































































