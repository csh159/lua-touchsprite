require("TSLib")

ocrInfo("haoi23","ouwen000","ouwen000|3A16D996BA0C00B7")

function dm(x1,y1,x2,y2,types,timeout,scalce)
	text,tid = ocrScreen(x1,y1,x2,y2,types,timeout,scalce)
	return text
end


yzm = dm(82, 460,557, 575,1004,60,1)