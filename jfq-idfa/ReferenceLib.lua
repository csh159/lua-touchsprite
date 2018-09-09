ReferenceLib = {}
ref = ReferenceLib

ref.ts = require "TSLib"
ref.dci = require "dci"

-- 网络扩展库
ref.sz = require "sz"
ref.http = require "szocket.http"
ref.cjson = ref.sz.json

-- 设置
require "SettingLib"
ref.set = SettingLib

-- 对话框处理
--require "DialogHandleLib"
--ref.dh = DialogHandleLib

-- 网络
require "NetworkingLib"
ref.net = NetworkingLib

-- 搜索
--require "SearchLib"
--ref.search = SearchLib

--清理
--require("RuangaiBuqingli")
--ref.ql = QingliLib

appStoreBid = "com.apple.AppStore"
safariBid = "com.apple.mobilesafari"

preferencesBid = "com.apple.Preferences"

wxBid = "com.tencent.xin"

return ref