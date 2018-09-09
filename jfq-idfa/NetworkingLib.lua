-- 网络

NetworkingLib = {}
local net = NetworkingLib

-- idfa 设备ID
net.deviceID = getDeviceID();
-- 手机编号  设备别名
net.serialNumber = ref.dci.device_name()
-- 分组编号
net.groupNumber = "1"
-- 订单号 orderId
net.orderId = "0"
-- 应用Id
net.appId = "0"
-- 应用 BundleID
net.BundleID = "bundleID"
-- 应用名称（头条号）
net.appName = "appName"
-- 关键字或网址
net.keyword = "keyword"
-- 账号
net.userName = "13411112222"
-- 密码
net.password = "password"
-- 当前排名
net.currentRanking = "0"
-- 是否为新任务
net.newTask = false
-- vpn开关 0 关闭  1开启
net.vpnStatus = 0
-- 文章类型：1文章，2视频，3图集，4微头条，5自动
net.taskType = 1
-- 0:不改变IDFA  1:变IDFA
net.isResetIDFA = 0
-- 是否关注
net.changeIdfv = true
-- 是否点赞
net.changeUdid = true
-- 是否给评论点赞
net.changeSerialNumber = false
-- 0:不评论  1:评论
net.isComment = 0
-- 评论标题
net.commentTitle = ""
-- 评论内容
net.commentContent = ""
-- 评论作者
net.commentAuthor = ""
-- 是否收藏：1收藏，0不收藏
net.intoInfo = 1;
-- 是否转发：1转发，0不转发
net.gotoTop = 1;
-- 新机方式：1abl，2awz，3rog
net.scriptType = 1;
-- 登陆方式：1手机号;2QQ;3微信;4新浪;5微博
net.source = 1;
-- 任务错误码  1 成功  2 错误 3其它处理
net.errorCode = 1
-- udidContent
--net.udidContent = ""
-- 错误消息
net.errorMessage = "错误消息"
-- 版本
net.clientScript = "shipin_V0.1"
--[[
视频
]]


local cjson = ref.sz.json
local http = ref.sz.i82.http

-- 请求超时时间（秒）
local time_out = 10

-- 睡眠30秒
local sleepTime = 30000
--龙华
--local url = "http://106.75.48.143:8080/taskShipin/api/"
local url = "http://106.75.48.143:8780/taskShipin/api/"
--西丽
--local url = "http://106.75.35.229:38080/taskCms/api/"


-- 获取外网IP
function net.getIPAddress()
    local url = "http://www.ip.cn/"
    url = "http://1212.ip138.com/ic.asp"

    local ipaddr = "0.0.0.0"
    local res, code = ref.http.request(url);
    if code == 200 then
        local i,j = string.find(res, "%d+%.%d+%.%d+%.%d+")
        ipaddr = string.sub(res,i,j)
    end
    return ipaddr
end


-- post 请求
function net.postRequest(path, post)
    
    local headers = {}
    local headers_send = cjson.encode(headers)
    local post_send = cjson.encode(post)
    local status_resp, headers_resp, body_resp = http.post(url .. path, time_out, headers_send, post_send)
	
	ref.set.checkLog("网络请求:"..path.." 网络结果"..tostring(status_resp).." "..tostring(post["errorMessage"]))
	--recheck network
--	if tostring(status_resp) == 'timeout' then
--			local current_time1 = getNetTime();
--			if current_time1 ~= 0 then
--				ref.set.checkLog('网络正常'..os.date("%m/%d %X", current_time1))
--				toast(os.date("%X", current_time1),1)
--			else
--				ref.set.checkLog('网络不通')
--			end
--	end
	
    local response = {}
    if status_resp ~= nil then        
        if status_resp == 200 then
            response = cjson.decode(body_resp);
            if response ~= nil then
                if response.code ~= 0 then
                    toast("响应代码: " .. response.code, 3)
                    mSleep(3000)
                end
            else
                toast("解析异常-json: ".. body_resp, 3)
                mSleep(3000)
            end
            return response
        else
            toast("服务器连接错误 code:" .. status_resp, 3)
            mSleep(3000)
            response.code = status_resp
            return response
        end
    end

    response.code = -1
    return response
end


-- 获取任务请求
function net.getTaskRequest()

    local path = "getTask"
    local post = {}

    post["idfa"] = net.deviceID
    post["userName"] = net.userName
    post["sn"] = net.serialNumber
    post["clientScript"] = net.clientScript

    -- realIdfa    真实idfa
    post["realIdfa"] = ref.dci.getIDFA()

    local sign = net.deviceID .. net.serialNumber
    post["sign"] = sign:md5()

    local response = net.postRequest(path, post);

    local code = 0
    if response == nil then
        toast("获取任务失败，response = nil", 3)
        mSleep(3000) 
        code = 1       
    else
        -- 0 成功 1失败 2无任务 3获取账号为空
        if response.code == 0 then
            code = 0
			
			for k,v in pairs(response) do
				fredLog( k.. ':' .. tostring(v) )
			end
			
            net.orderId = response.orderId
            net.appId = string.rtrim(response.appId)
            net.BundleID = string.rtrim(response.bundleId)

            if net.appName == response.appName then
                net.newTask = false;
            else
                net.newTask = true;
            end

            if response.appName ~= nil then
                net.appName = response.appName
            end            

            if response.keyword ~= nil then
                net.keyword = response.keyword
            end            
            net.userName = string.rtrim(response.userName)
            net.password = string.rtrim(response.userPwd)
			if response.curRanking ~= nil then
				net.curRanking = response.curRanking 
			end
            
            if response.vpn ~= nil then
                net.vpnStatus = response.vpn
            end

            if response.changeIdfa == true then
                net.isResetIDFA = 1
            else 
                net.isResetIDFA = 0
            end
			net.changeIdfv = response.changeIdfv
			net.changeUdid = response.changeUdid
			if response.isComment ~= nil then
                net.isComment = response.isComment
			end
			
			if response.commentTitle ~= nil then
                net.commentTitle = response.commentTitle;
            end
			
			if response.commentAuthor ~= nil then
                net.commentAuthor = response.commentAuthor;
            end
			
			if response.commentContent ~= nil then
                net.commentContent = response.commentContent;
            end
			
            net.taskType = response.taskType
            
            if response.intoInfo ~= nil then
                net.intoInfo = response.intoInfo;
            end
            
            if response.gotoTop ~= nil then
                net.gotoTop = response.gotoTop;
            end

            if response.scriptType ~= nil then
                net.scriptType = response.scriptType;
            end
			
			if response.changeSerialNumber ~= nil then
				net.changeSerialNumber = response.changeSerialNumber
			end

			if response.udidContent ~= nil then
                net.udidContent = response.udidContent;
--				writeFileString("/var/root/fk.json",net.udidContent)
--				closeApp("com.apple.AppStore")
--				closeApp("com.apple.preferences")
--				os.execute('killall -9 ptpd');
--				os.execute('killall -9 lsd');
--				os.execute('killall -9 appstored');
--				os.execute('killall -9 atc');
--				os.execute('killall -9 locationd');
--				os.execute('killall -9 CommCenter');
--				os.execute('killall -9 lockdownd');
--				os.execute('killall -9 akd');
--				os.execute('killall -9 adid');
--				os.execute('killall -9 homed');
--				os.execute('killall -9 itunesstored');
--				os.execute('killall -9 cloudd');
--				os.execute('killall -9 familycircled');
--				closeApp("com.apple.AdSheetPhone")
--				os.execute('killall -9 storebookkeeperd');
--				os.execute('killall -9 itunescloudd');
--				os.execute('killall -9 identityservicesd');
--				os.execute('killall -9 absd');
--				os.execute('killall -9 fairplayd.H2');
--				mSleep(1000)
--				os.execute("killall -9 SpringBoard")
--				mSleep(1000*17)
--				ref.set.checkLog("软改成功")
--			else
--				toast("未取到软改参数")
--				ref.set.checkLog("未取到软改参数")				
            end
			
            toast("获取任务成功", 1)
			ref.set.checkLog("获取任务成功")
            mSleep(1000)
        elseif response.code == 1 then
            toast("获取任务失败", 3)
			ref.set.checkLog("获取任务失败")
            mSleep(3000)
            code = 1
        elseif response.code == 2 then
            toast("无任务", 5)
			ref.set.checkLog("无任务")
            mSleep(5000)
            code = 2
        elseif response.code == 3 then
            toast("获取账号为空", 5)
			ref.set.checkLog("获取账号为空")
            mSleep(5000)
            code = 3
        elseif response.code == 4 then
            toast("未选择评论组", 5)
			ref.set.checkLog("未选择评论组")
            mSleep(5000)
            code = 4
        elseif response.code == 5 then
            toast("无匹配的评论", 5)
			ref.set.checkLog("无匹配的评论")
            mSleep(5000)
            code = 5
        elseif response.code == 6 then
            toast("ip重复", 3)
			ref.set.checkLog("ip重复")
            mSleep(3000)
            code = 6
			
        elseif response.code == 7 then
            toast("无任务", 5)
			ref.set.checkLog("无任务")
            mSleep(5000)
            code = 7
        else
            toast("获取任务失败 code:" .. response.code, 3)
			ref.set.checkLog("获取任务失败")
            mSleep(3000)
            code = 1
        end
    end

    response = nil
    return code
end

--获取所有头条账号
function net.getAllTTAcc()

    local path = "getUserList"
    local post = {}

    post["idfa"] = net.deviceID
    post["sn"] = net.serialNumber
    post["clientScript"] = net.clientScript

    -- realIdfa    真实idfa
    post["realIdfa"] = ref.dci.getIDFA()

    local sign = net.deviceID .. net.serialNumber
    post["sign"] = sign:md5()
    local response = net.postRequest(path, post);

    local code = 0
    if response == nil then
        toast("获取任务失败，response = nil", 3)
        mSleep(3000) 
        code = 1       
    else
        -- 0 成功 1失败 2无任务 3获取账号为空
        if response.code == 0 then
            code = 0
			
			for k,v in pairs(response) do
				fredLog( k.. ':' .. tostring(v) )
			end
			
            AllAccounts = response.AllAccounts

            toast("获取账号列表成功", 1)
			ref.set.checkLog("获取账号列表成功")
        elseif response.code == 1 then
            toast("获取任务失败", 3)
			ref.set.checkLog("获取任务失败")
            mSleep(3000)
            code = 1
        elseif response.code == 2 then
            toast("无任务", 5)
			ref.set.checkLog("无任务")
            mSleep(5000)
            code = 2
        elseif response.code == 3 then
            toast("获取账号为空", 5)
			ref.set.checkLog("获取账号为空")
            mSleep(5000)
            code = 3
        elseif response.code == 4 then
            toast("未选择评论组", 5)
			ref.set.checkLog("未选择评论组")
            mSleep(5000)
            code = 4
        elseif response.code == 5 then
            toast("无匹配的评论", 5)
			ref.set.checkLog("无匹配的评论")
            mSleep(5000)
            code = 5
        elseif response.code == 6 then
            toast("ip重复", 3)
			ref.set.checkLog("ip重复")
            mSleep(3000)
            code = 6
			
        elseif response.code == 7 then
            toast("此账号无任务", 5)
			ref.set.checkLog("此账号无任务")
            mSleep(5000)
            code = 7
        else
            toast("获取任务失败 code:" .. response.code, 3)
            mSleep(3000)
            code = 1
        end
    end

    response = nil
    return AllAccounts
end

-- 获取用户请求
function net.getUserRequest(userName, isRepeat, status, errorMessage)

    local path = "getUser"
    local post = {}

    post["idfa"] = net.deviceID
    post["sn"] = net.serialNumber
    -- post["gn"] = net.groupNumber
    post["isRepeat"] = isRepeat
    post["orderId"] = net.orderId
    post["userName"] = userName
    
    post["status"] = status
    post["errorMessage"] = errorMessage
    -- MD5(idfa+sn+gn)  sign:md5()
    local sign = net.deviceID .. net.serialNumber
    post["sign"] = sign:md5()

    local response = net.postRequest(path, post);

    local code = -1

    if response == nil then
        toast("获取账号失败，response = nil", 3)
        mSleep(1000)
    else
        if response.code == 0 then

            if response.userName ~= nil then
                net.userName = string.rtrim(response.userName)
            end

            if response.userPwd ~= nil then
                net.password = string.rtrim(response.userPwd)
            end
            
            code = 0
        elseif response.code == 3 then
            toast("获取账号为空", 3)
            mSleep(1000)
            code = 3
        else
            toast("获取账号失败", 3)
            mSleep(1000)
        end
    end

    response = nil
    return code
end


-- 获取最后一次成功用户
function net.getLastAppSuccessUser()

    local path = "getLastAppSuccessUser"
    local post = {}

    post["idfa"] = net.deviceID
    post["sn"] = net.serialNumber
    post["orderId"] = net.orderId
    post["bundleId"] = net.BundleID
    local sign = net.deviceID .. net.serialNumber
    post["sign"] = sign:md5()

    local response = net.postRequest(path, post);

    local code = -1

    if response == nil then
        toast("获取最后一次成功用户失败，response = nil", 3)
        mSleep(1000)
    else
        if response.code == 0 then
            
            net.userName = string.rtrim(response.userName)
            net.password = string.rtrim(response.userPwd)
            code = 0
        elseif response.code == 3 then
            toast("获取最后一次成功用户为空", 3)
            mSleep(1000)
            code = 3
        else
            toast("获取最后一次成功用户失败", 3)
            mSleep(1000)
        end
    end

    response = nil
    return code
end


-- 上报任务结果
function net.reportTaskResultRequest(taskResult, message)

    local path = "reportTaskResult"
    local post = {}
    
    post["idfa"] = net.deviceID
    post["sn"] = net.serialNumber
    post["orderId"] = net.orderId
    local sign = net.deviceID .. net.serialNumber
    post["sign"] = sign:md5()

    -- realIdfa    真实idfa
    post["realIdfa"] = ref.dci.getIDFA()

    -- 任务返回结果【1 成功 2 失败】
    post["taskResult"] = taskResult
    post["errorMessage"] = message
	fredLog('上报任务结果'..post["taskResult"])
    local response = net.postRequest(path, post);
    -- 连续上报返回值
    local code = -1
    if response == nil then
        -- dialog(response)
        toast("上报任务失败，response = nil")
        mSleep(3000)
    else
        if response.code == 0 then
            toast("上报任务成功")
        else
            toast("上报任务失败")
            mSleep(3000)
        end
        code = response.code
    end

    response = nil
    return code
end


-- 获取任务 
function net.getTask()
    -- 0成功, 1失败, 2无任务
    local code = 0
    local timeout = 0
    while true do
        timeout = timeout + 30000
        code = net.getTaskRequest()
        if code == 1 then
            toast("获取任务失败,重新获取", 3)
            if timeout >= 120000 then
                break
            end

            mSleep(sleepTime)
        else
            -- 成功或无任务            
            break
        end
    end

    mSleep(500)
    return code
end


-- 获取用户
function net.getUser(userName, isRepeat, status, errorMessage)

    local result = 0
    local timeout = 0
    while true do
        timeout = timeout + 30000
        local code = net.getUserRequest(userName, isRepeat, status, errorMessage)
        if code == 0 then
            break
        elseif code == 3 then
            -- 获取账号为空
            break
        else
            toast("获取用户失败,重新获取", 3)
            if timeout >= 180000 then
                break
            end
            mSleep(sleepTime)
        end
    end
    return code
end


-- 获取最后一次成功用户 重复
function net.getLastUser()
    local result = 0
    local timeout = 0
    while true do
        timeout = timeout + 30000
        local code = net.getLastAppSuccessUser()
        if code == 0 then
            break
        elseif code == 3 then
            -- 获取账号为空
            break
        else
            toast("获取用户失败,重新获取", 3)
            -- 3分钟  60000 * 3
            if timeout >= 180000 then
                break
            end
            mSleep(sleepTime)
        end
    end
    return code
end


-- 上报任务结果
function net.reportTask(taskResult, message)

    local result = 0
    local timeout = 0

    while true do
        timeout = timeout + 30000
        local code = net.reportTaskResultRequest(taskResult, message)
        if code == 0 then
            toast("上报成功")
            break
        else
            toast("上报任务失败,重新上报")
            -- 1分钟  60000 * 1
            if timeout >= 60000 then
                result = -1
                break
            end
            mSleep(sleepTime)
        end
    end
    return result
end

return net