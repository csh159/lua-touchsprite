require("TSLib")
require("tsp")
require("阿波罗")


abl_bid = 'com.beibeijia.Apollon'

bundler_id = "com.ppjidai.PPLoan"

number_bundler_id = "1173456532"



function beforeUserExit()
  close_VPN()
  delay(2)
  abl_bid = 'com.beibeijia.Apollon'
  active(abl_bid,3)
end

function check_idfa_success()
  local sz = require("sz")
  local cjson = sz.json
  local http = sz.i82.http
  local first_url = "http://muser.safoo.com.cn/api/check_idfa?username=iamzhangdabei&pass=zhangdabei&idfa=" .. idfa

  status, headers, body =  http.get(first_url)
  status, headers, body =  http.get(first_url)
  nLog(body)
  local success, result = pcall(function(str) return cjson.decode(str) end, body)
  if success then
     local res_json = result
     if tonumber(res_json['state']) == 1 then
       
        return true
    else
        return false
    end
  else
    nLog("获取idfa fail" .. status)
    return false 
  end
end

function abl()
 abl_bid = 'com.beibeijia.Apollon'
 --采用 cjson 构造请求头部 json
  local sz = require("sz")
  local cjson = sz.json
  local http = sz.i82.http
  local first_url = "http://127.0.0.1:1234/cmd?fun=newmachine"
  active(abl_bid,3)
  delay(2)  
  status, headers, body =  http.get(first_url)
  toast(body,2)
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
  nLog(body,3)
  local success, result = pcall(function(str) return cjson.decode(str) end, body)
  if success then
     local res_json = result
     idfa = res_json["data"][bundler_id]["idfa"]
     nLog("获取idfa : " .. idfa)
  toast(idfa)
   nLog("获取idfa : " .. idfa)
     return true
  else
    nLog("获取idfa fail" .. status)
    return false 
  end
  
end



function check_idfa()
  --采用 cjson 构造请求头部 json
  local sz = require("sz")
  local cjson = sz.json
  local http = sz.i82.http

  
  local first_url = "http://open.dianjoy.com/dev/api/adlist/partner_confirm_install_v2.php?ad_id=" .. ad_id .. "&app_id=" .. appid .. "&device_id=" .. idfa
  status, headers, body =  http.get(first_url)
nLog("check idfa " .. body)  
  local success, result = pcall(function(str) return cjson.decode(str) end, body)
  if success then
  
      return true
  else
    nLog("check idfa" .. status)
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
  post['ad_id'] = bundler_id
  post['appid'] = number_bundler_id
  post['idfa'] = idfa
  post['platform']='people'
  post_send = cjson.encode(post)
  post_escaped = http.build_request(post_send)
  status_resp, headers_resp, body_resp = http.post("http://muser.safoo.com.cn/api/upload_dian_joy_record", 3, headers_send, post_escaped)
  
  delay(1)
end

function activate_app()
  
  active(bundler_id)
  delay(60)
  
  local random_click_begin_time = os.time()
  local random_click_total_time = 20
  
  while os.time()-random_click_begin_time < random_click_total_time do
        moveTo(600,  824,100,  824,50) -- 
        delay(1)
        moveTo(600,  824,100,  824,50)
        delay(1)
        moveTo(600,  824,100,  824,50)
        delay(1)
        moveTo(600,  824,100,  824,50)
        delay(5)
        click(316,955)
        delay(1)
        click(14+math.random(1,500),133+math.random(800))
        delay(1)
       
    end
end


function set_vpn_enable_with_timeout()
  local 计时 = os.time()
  local 超时 = 30 
  
  while os.time()-计时< 超时 do
    
    if VPN() then
      return true
     else
         setVPNEnable(true)
         delay(5)
    end
  end
end


init('0',0)
xz(bundler_id)

while (true) do
  if false or abl()then
     
    if false or set_vpn_enable_with_timeout()then
      if get_idfa()then
          upload_idfa()
          delay(1)
          activate_app()
      end
      
    end
    closeApp(bundler_id)
    delay(1)
    setVPNEnable(false)
    delay(1)
  end
end


