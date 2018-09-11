imgfile = "/var/mobile/Media/TouchSprite/res/yb.jpg"

--读取图片文件
function lzReadFileByte(file)
	local f = io.open(file,"rb")
	local retbyte = f:read("*all")
	f:close()
	return retbyte
end
--截图函数
function lzScreen(x1,y1,x2,y2,scale)
	scale = scale or 1;
	local path=userPath().."/res/yb.jpg";
	snapshot("yb.jpg",x1,y1,x2,y2,scale);
	--os.remove(path)
	return path;
end

--lzScreen(1,1,200,150)
pBuffer = lzReadFileByte(imgfile);
--local path=userPath().."/res/yzm.jpg";
--dialog(path)
dialog(type(pBuffer))
nLog(pBuffer)
dialog(pBuffer)



function lzRecoginze(user, pwd, imagefile, yzmtype)
	local sz = require("sz")
	local http = require("szocket.http")
	local pBuffer = lzReadFileByte(imagefile);
	local rq = {
		upload = { filename = "yzm.jpg", content_type = "image/jpeg", data = pBuffer }
	};
	
	local response_body = {};
	
	local boundary = gen_boundary();
	local post_data, bb = encode(rq, boundary);
	
	res, code = http.request{  
		url = "http://v1-http-api.jsdama.com/api.php?mod=php&act=upload",  
		method = "POST",  
		headers =   
		{  
			["Connection"] = "keep-alive",
			["Content-Type"] = fmt("multipart/form-data; boundary=%s", boundary),  
			["Content-Length"] = #post_data,  
		},  
		source = ltn12.source.string(post_data),  
		sink = ltn12.sink.table(response_body)
	}	

	--解析返回结果
	local strBody = table.concat(response_body);
	local bl,tbody = pcall(sz.json.decode,strBody)
	if bl then
		if tbody.result == true then
			local id, vcode = tbody.data.id,tbody.data.val
			if (id == nil or vcode == nil) then
				return false, id, vcode;
			else
				return true, id, vcode;
			end
		else 
			return false,nil,nil,tbody.data
		end
	else 
		return bl,nil,nil,"服务器返回json错误"
	end
end



