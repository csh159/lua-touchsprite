
phone_uid = getDeviceID()		--触动唯一名
phone_name = getDeviceName()	--设备名
Service_Link = 'http://kexuezhushou.cn/api/'	--基本地址

username = 'id122333'
pass = 'asd198312'

function kexuezhushou_get_account(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = Service_Link..'get_one_account_to_activate'
	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	nLog(body_resp)
	if status_resp == 200 then
		nLog('服务器通讯成功')
		local json = sz.json
		local datas = json.decode(body_resp)
		if datas.code == 0 then
			account = datas.account.login
			password = datas.account.password
			nLog(account..'\n'..password)
			return true
		end
	end
end
--获取一个可以用来过检的帐号
function get()		
	get_account = {}
	get_account.username = username
	get_account.pass = pass
	get_account.phone_uid = phone_uid
	get_account.phone_name = phone_name
	if kexuezhushou_get_account(get_account)then
		return true
	end
end
function kexuezhushou_updata_account(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = Service_Link..'upload_activate_result'
	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	nLog(body_resp)
	if status_resp == 200 then
		nLog('服务器通讯成功')
		local json = sz.json
		local datas = json.decode(body_resp)
		if datas.code == 0 then
			nLog(datas.message)
			return true
		end
	end
end

function updata(state,j)	--修改帐号的 state状态	state = 'yes' or 'no'  yes代码过检成功
	updata_account = {}
	updata_account.success = state
	updata_account.login = account
	updata_account.password = password
	updata_account.username = username
	updata_account.pass = pass
	updata_account.phone_uid = phone_uid
	updata_account.phone_name = phone_name
	updata_account.jinyong = j
	if kexuezhushou_updata_account(updata_account)then
		return true
	end
end
function update_info(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = Service_Link..'update_info'
	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	nLog(body_resp)
	if status_resp == 200 then
		nLog('服务器通讯成功')
		local json = sz.json
		local datas = json.decode(body_resp)
		if datas.code == 0 then
			nLog(datas.message)
			return true
		end
	end
end
function UP(password,ask1,answer1)	--修改状态其它信息接口 passwrod 为密码 ask1 为第一个提问 answer1 第一个答案
	post = {}
	post.login = account
	post.password = password
	post.username = username
	post.pass = pass
	post.ask1 = ask1
	post.answer1 = answer1
	if update_info(post)then
		return true
	end
end

-------------------------------------POST----------
nLog("api加截完成")

account = "wangfangvn5027207@163.com"
updata('yes','no')

