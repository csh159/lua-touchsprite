
-- 设置
SettingLib = {}
local set = SettingLib

local TSPath = "/var/mobile/Media/TouchSprite/"
local TSEPath = "/var/mobile/Media/TouchSpriteENT/"

local TSLogPath = TSPath .. "log/"
local TSELogPath = TSEPath .. "log/"

local LogPath = ""

--table has value
local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

-- 创建文件目录
function mkdir(path)
    -- 文件是否存在
    local file, err = io.open(path)
    if file == nil then
        os.execute("mkdir "..path);
    end
end


--删除文件
function delFile(path)
    os.execute("rm -rf "..path);
end

--读取文件到列表
function set.readFile(path)
    local file = io.open(path,"r");
    if file then
        local _list = {};
        for l in file:lines() do
            table.insert(_list,l)
        end
        file:close();
        return _list
    end
end

--遍历文件
function getList(path)
    local a = io.popen("ls " .. path);
    local f = {};
    for l in a:lines() do
        -- dialog(l)
        table.insert(f,l)
    end
    return f
end

-- 创建目录
function set.mkdirPath()
    local time = os.time()
    time = os.date("%Y%m%d", time);

    if file_exists(TSPath) then        
        -- 创建当前日期的目录 日志存放
        mkdir(TSLogPath .. time)
    end

    -- 企业: TouchSpriteENT
    if file_exists(TSEPath) then
        -- 创建当前日期的目录 日志存放
        mkdir(TSELogPath .. time)
    end
end


-- 设置系统VPN开关 0 关闭 1开启
function set.vpn(tag)
    -- flag	逻辑型	打开VPN默认连接 - true;关闭VPN默认连接 - false
    if tag == 0 then
        setVPNEnable(false)
        mSleep(1000);
    else
        -- 切换开启
        toast("－开启VPN－")
        setVPNEnable(false)
        mSleep(1000);
        setVPNEnable(true)
    end
end


-- 打开设置注销账号
function set.logout()
    openURL("prefs:root=STORE");
    mSleep(1000)
end

-- 打开设置-隐私-广告
function set.Advertising()
    openURL("prefs:root=Privacy&path=ADVERTISING");
    mSleep(1000)
end

-- log 日志， path 日志路径
function set.log(logstr, path)
    local time = os.time()
    local timeStr = os.date("%Y%m%d", time)
--    log(logstr, timeStr .. "/" .. path)
	
--	local current_time2 = getNetTime();
	local timeStrFull = os.date("%m/%d %X", time);
	writeFileString(LogPath..timeStr..".log",timeStrFull..' '..logstr..'\r\n',"a")
end

-- log 日志， path 日志路径
function set.checkLog(checkname)
    ref.set.log(checkname, "checkLog")
--    ref.set.log("===========================", "checkLog")
end


-- 清理文件
function set.deleteFiles()
    local time = os.time()-86400*7
    time = os.date("%Y%m%d", time);

    -- 单机: TouchSprite
    if file_exists(TSPath) then
        local a = io.popen("ls " .. TSLogPath);
        local f = {};
        for l in a:lines() do
            if l < time then
                local path = TSLogPath .. l  
                delFile(path)
            end
        end
    end

    -- 企业: TouchSpriteENT
    if file_exists(TSEPath) then
        local a = io.popen("ls " .. TSELogPath);
        local f = {};
        for l in a:lines() do
            if l < time then
                local path = TSELogPath .. l  
                delFile(path)
            end
        end
    end

end
-- 清理文件1
function set.deleteFiles1()
    local time = os.time()-86400*7
    time = os.date("%Y%m%d", time);
	time = time..".log"

    -- 单机: TouchSprite
    if file_exists(TSPath) then
        local a = io.popen("ls " .. TSLogPath);
        local f = {};
        for l in a:lines() do
            if l < time then
                local path = TSLogPath .. l  
                delFile(path)
            end
        end
    end

    -- 企业: TouchSpriteENT
    if file_exists(TSEPath) then
        local a = io.popen("ls " .. TSELogPath);
        local f = {};
        for l in a:lines() do
            if l < time then
                local path = TSELogPath .. l  
                delFile(path)
            end
        end
    end

end

-- 清理文件工具
function set.deleteFilesUtil(directory)
    if file_exists(directory) then
        local a = io.popen("ls " .. directory);
        local f = {};
        for l in a:lines() do
			local path = directory .. l  
			delFile(path)
        end
    end

end

--检查账号文件是否过期
function set.checkTTAccFileValid(accJsonPath)
	local AccFile = set.readFile(accJsonPath)
	if AccFile then
		local time = os.time()
		local timeStr = os.date("%Y%m%d", time)
		if timeStr == string.rtrim(AccFile[1]) then
			return true
		end
	end
	return false
end 

function set.getCurrentTTAcc0(accJsonPath,disableAccPath)
	local AccFile = set.readFile(accJsonPath)
	local disableAcc = set.readFile(disableAccPath)
	local disableAccM = {}
	
	for a,b in ipairs(disableAcc) do
		table.insert(disableAccM,string.rtrim(b))
	end
	local accJson = ref.cjson.decode(AccFile[2])
	local r = {}
	for x,y in ipairs(accJson) do
--		fredLog(y.userName)
		if not has_value(disableAccM, y.userName) then
--			fredLog("GOT"..y.userName)
			r['userName'] = y.userName
			r['userPwd'] = y.userPwd
			r['source'] = y.source
			r['udidContent'] = y.udidContent
			break
		end
	end
	return r
end

function set.rgIndex(disableAccPath)
	local r = 1
	if file_exists(disableAccPath) then
		local AccFile = set.readFile(disableAccPath)
		r = tonumber(AccFile[1])
	end
	return r
end

function set.getCurrentTTAcc1(accJsonPath)
	local r = {}
	if file_exists(accJsonPath) then
		local AccFile = set.readFile(accJsonPath)

		r['userName'] = AccFile[1]
		r['userPwd'] = AccFile[2]
		r['udidContent'] = AccFile[3]
		r['appName'] = AccFile[4]
	end
	return r
end

if file_exists(TSELogPath) then
	LogPath=TSELogPath
elseif file_exists(TSLogPath) then
	LogPath=TSLogPath
else
	toast('日志路径不存在',1)
end



return set