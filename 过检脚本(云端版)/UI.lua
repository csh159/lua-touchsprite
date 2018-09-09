
local sz = require("sz")--写 showUI 前必须插入这一句
local json = sz.json--写 showUI 前必须插入这一句
w,h = getScreenSize();
MyTable = {
    ["style"]        =  "default",
    ["width"]        =  w,
    ["height"]       =  h,
    ["config"]       =  "AppleID_001.dat",
    ["timer"]        =  65,
    ["orient"]       =  0,
    ["pagetype"]     =  "multi",
    ["title"]        =  "科学助手过检",
    ["cancelname"]   =  "取消",
    ["okname"]       =  "开始",
    pages            =
    {
        {   
			{
                ["type"] = "Label",
                ["text"] = "第一页设置",
                ["size"] = 15,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
            {
                ["type"] = "Label",
                ["text"] = "网络环境选择",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["type"] = "RadioGroup",
                ["list"] = "WIFI,VPN",
                ["select"] = "1",
            },
            {
                ["type"] = "Label",
                ["text"] = "金钥匙",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["type"] = "RadioGroup",
                ["list"] = "需要,不需要",
                ["select"] = "0",
            },
			{
                ["type"] = "Label",
                ["text"] = "科学助手登录帐号",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
			{
				["type"] = "Edit",
				["prompt"] = "帐号",
				["text"] = "username",
				["size"] = 15,
				["align"] = "left",
				["color"] = "0,0,0",
			},
            {
                ["type"] = "Label",
                ["text"] = "科学助手登录密码",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
			{
				["type"] = "Edit",
				["prompt"] = "密码",
				["text"] = "password",
				["size"] = 15,
				["align"] = "left",
				["color"] = "0,0,0",
			},
            {
                ["type"] = "Label",
                ["text"] = "新密码",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
			{
				["type"] = "Edit",
				["prompt"] = "新密码",
				["text"] = "AaDd112211",
				["size"] = 15,
				["align"] = "left",
				["color"] = "0,0,0",
			},
            {
                ["type"] = "Label",
                ["text"] = "新密保",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
			{
				["type"] = "Edit",
				["prompt"] = "新密保",
				["text"] = "pppp",
				["size"] = 15,
				["align"] = "left",
				["color"] = "0,0,0",
			},
            {
                ["type"] = "Label",
                ["text"] = "请输入科学助手帐号密码",
                ["size"] = 15,
                ["align"] = "center",
                ["color"] = "150,150,150",
            },

        },
		{
            {
                ["type"] = "Label",
                ["text"] = "第二页设置",
                ["size"] = 15,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
        },
		{
            {
                ["type"] = "Label",
                ["text"] = "第三页设置",
                ["size"] = 15,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
        }
    }   
}
local MyJsonString = json.encode(MyTable);
retTable = {showUI(MyJsonString)};

for i = 1,#retTable do
	nLog(i.."--"..retTable[i])
	mSleep(200)
end

if retTable[1] == 0 then
	lua_exit()
end
VpnKey = retTable[2]
Keys = retTable[3]
username = retTable[4]
pass = retTable[5]
