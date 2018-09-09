require("TSLib")
ocrInfo('haoi23','ouwen000','ouwen000|3A16D996BA0C00B7')

bool,bal=ocrBalance()
if bool then
	if tonumber(bal) > 0 then
		toast('余额: '..bal,3)
	else
		toast('余额不足: '..bal,30)
	end
end

function dm(x1,y1,x2,y2,types,timeout,scalce)
	text,tid = ocrScreen(x1,y1,x2,y2,types,timeout,scalce)
	return text
end

--nLog(dm(394, 565,535, 610,1004,103,60,1))