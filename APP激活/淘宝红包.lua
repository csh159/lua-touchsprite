require("tsp")
require("GET_URL")






init("0",0)
appbid = 'com.taobao.taobao4iphone'

tb={}
tb['马上帮TA点亮']={ 0xff4800, "1|19|0xfef645,19|1|0xff4800", 90, 119, 617, 512, 752}
tb['关闭']={ 0xffffff, "0|-8|0x575552,-9|0|0x585550,-11|-12|0xffffff", 90, 303, 984, 343, 1029}
tb['规则']={ 0xff7200, "2|-7|0xfff7ef,26|-2|0xff6e00", 90, 277, 649, 357, 702}

function taobao(keys)
	
	if appbid == frontAppBid() then
		pressHomeKey(0);    --按下 Home 键
		pressHomeKey(1);    --抬起 Home 键
		mSleep(1000)
	end
	
	writePasteboard(keys);
	dialog(keys, 1)
	outTime = os.time()
	while os.time() - outTime < 10 do
		if active(appbid,2)then
		elseif c_pic(tb['马上帮TA点亮'],'马上帮TA点亮',true)then
			if c_pic(tb['关闭'],'关闭',true)then
				pressHomeKey(0);    --按下 Home 键
				pressHomeKey(1);    --抬起 Home 键
				mSleep(1000)
				return true
			end
		elseif c_pic(tb['关闭'],'关闭',true)then
			pressHomeKey(0);    --按下 Home 键
			pressHomeKey(1);    --抬起 Home 键
			mSleep(1000)
			return true
		elseif c_pic(tb['规则'],'规则',false)then
			click(323,909)
			pressHomeKey(0);    --按下 Home 键
			pressHomeKey(1);    --抬起 Home 键
			mSleep(1000)
			return false
		end
		mSleep(500)
	end
end

	
while (true) do
	if robotGetUrl()then
		for i,v in pairs(data.data)do
			taobao(v)
		end
		mSleep(1000*1)
	end
end























