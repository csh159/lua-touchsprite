--require("TSLib")
require("tsp")
require("阿波罗")
require("ALZ")
require("lz-api")
require("yzm")

nLog(frontAppBid())


init('0',0);
appbid = 'com.apple.mobilesafari';
url = 'http://www.qianyoulu.cn/index.php/home/login/r/sign/85c505f815dc5a23fb664b0430fa2b62'

--爱乐赞id 取手机号用
id = 74340
app_name = '速米贷'
yzmtype = '1001'
apple_yzm = ''
--imgfile = lzScreen(439, 377, 609, 448,1.0)

token = '20801571-3b8c-4fcb-be16-5da3d5633c60'
path = {
	[1] = '/User/Media/TouchSprite/lua/'..app_name..'.txt',
	}
page={}

idcrad = {
	{"刘萌萌","210212198506035924",},
	{"孟民社","610424196903160835",},
	{"莫雨俏","460022199203270022",},
	{"刘惠萍","142703197908151223",},
	{"陈达兴","441322197303064319",},
	{"梁保伟","440402197912235717",},
	}

--注册往返
function reg()
	Time_line = os.time()
	Time_out = 60 * 2
	get_Phone = true
	get_Message = false
	by_pic = true
	by_yzm = false
	--------

	while os.time()-Time_line<Time_out do
		if frontAppBid() ~= appbid then
			openURL(url)
			mSleep(1000*5)
		else
			log('-:)')
		end
		delay(1)
	end
end

--abl()
reg()














