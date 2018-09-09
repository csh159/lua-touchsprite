
require("TSLib")
require("asofind")
m = require("ascmd")
	

--[[
m.login(zhanghao,mima) --登陆，登陆后2秒再查询登陆状态
m.searchTitle(txt) --输入关键字后等待2秒执行其他操作
m.search(txt) --应用id,执行
m.status() --登陆状态，可根据函数查询
aso_status()--登陆状态，已登录1，未登录0
aso_search()--搜索状态，返回 查询中，数量 或者 查询到，数量
--]]


function login()
	zhanghao = 'wenhong520@qq.com'
	mima = 'Whoami@20'
	m.login(zhanghao,mima)
end
login()
mSleep(5000)

while aso_status() == 0 do
	nLog(aso_status())
	mSleep(3000)
end

--[[]]
keyword = '最强德州'
appID = 1210629107

m.searchTitle(keyword) --输入关键字后等待2秒执行其他操作
mSleep(3000)
m.search(appID) --应用id,执行
k = '查询中'
--[[
while k == '查询中' do
	k,j = aso_search()--搜索状态，返回 查询中，数量 或者 查询到，数量
	nLog(k..','..j)
	mSleep(2000)
end
--]]