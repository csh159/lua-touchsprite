require("TSLib")
require("tsp")

function put_log(content)
  log_content = "[DATE] " .. content
  wLog("jd",log_content)
  return true
end


appid = "d48f089d7dd4aaf5248d0efc88ebe3c0"
ad_id = "cc9c20b52ae518d8ea01bed10b3a8eda"

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
page['app']['弹窗'] = {
	{  318, 1043, 0x595959},
	{  313, 1057, 0xffffff},
	{  319, 1064, 0xffffff},
	{  329, 1073, 0xffffff},
	{  320, 1074, 0x595959},
	{  309, 1062, 0x595959},
	{  329, 1060, 0x595959},
}
bundler_id = "com.tuniu.app"
abl_bid = 'com.beibeijia.Apollon'
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

function abl_click()
    abl_bid = 'com.beibeijia.Apollon'
 active(abl_bid,3)
 delay(2)
	计时 = os.time()
	超时 = 60 * 1

	
	while os.time() - 计时 <= 超时 do
		if active(abl_bid,3)then
		elseif c_pic(page['阿波罗']['一键新机'],'一键新机',true)then
		elseif c_pic(page['阿波罗']['确定'],'确定',true)then
			delay(2)
		
			return true
		elseif c_pic(page['阿波罗']['确定error'],'确定error',true)then
		end
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
     idfa = res_json["data"]["com.tuniu.app"]["idfa"]
     nLog("获取idfa : " .. idfa)
     return true
  else
    nLog("获取idfa fail" .. status)
    return false 
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
  post['ad_id'] = "tuniu"
  post['appid'] = "447313708"
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
  
  local random_click_begin_time = os.time()
  local random_click_total_time = math.random(200,220)
    
  while os.time()-random_click_begin_time < random_click_total_time do
	if active(bundler_id) then
		delay(5)
	elseif done(page['app']['弹窗'],'弹窗')then
		click(318, 1065)
		delay(3)
	else
	    click(14+math.random(1,500),133+math.random(800))
        delay(2)
        click(14+math.random(1,500),133+math.random(800))
        delay(2)
        click(14+math.random(1,500),133+math.random(800))
        delay(2)
        click(14+math.random(1,500),133+math.random(800))
        delay(2)
        click(43,87)
        delay(2)
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
 
 function beforeUserExit()
	close_VPN()
end

while (true) do
  if false or abl()then
    if false or set_vpn_enable_with_timeout()then
      if get_idfa()then
          upload_idfa()
          activate_app()
      end
      close_VPN()
    end
  end
end
