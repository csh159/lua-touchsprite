function ocr(x1,y1,x2,y2)
	return ocrText(x1,y1,x2,y2, 0) or 0
end


require("TSLib")

local sqlite3 = require('sqlite3')
--nLog(appDataPath(frontAppBid()))
--local db = sqlite3.open(appDataPath(frontAppBid())'/Documents/ifengNewsData.sqlite')
--local res = assert(db:execute [[select count(*) FROM friend where type=3]])
--local count = res:fetch({}, 'a')
--for k, v in pairs(count) do
--   dialog("总数"..k..v,10)
--end
--res:close()  
--db:close()  
--sqlite3:close()

----]]



