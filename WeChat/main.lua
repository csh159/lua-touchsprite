require("TSLib")
require("tsp")

log(frontAppBid())


arr={}
arr.bid="com.tencent.xin"
t={}




t['微信菜单']={{60,1086,0x7e8287}, {247,1096,0x7a7e83}, {398,1097,0x7a7e83}, {559,1096,0x7a7e83}, {559,1092,0x1aad19}, }






function wecha_play()
	local H = tonumber(os.date("%H"))
	log(H)
	

	if arr.work_key then
		if H >= 6 and H <= 23 then
			log("微信聊天时间")
			if active(arr.bid,5)then
				tab('微信菜单',true,rd(1,4))
			end
		else
			if frontAppBid() == arr.bid then
				closeApp(arr.bid)
				log("当前为微信休息时间",true)
			end
			delay(15)
			
		end
	else
		if frontAppBid() == arr.bid then
			closeApp(arr.bid)
			log("例行休息",true)
		end
		delay(15)
	end
	
	delay(1)
end

path = appDataPath(arr.bid); 
dialog(path)
os.exit()

arr.workTime = 60*1
arr.work_key = true
arr.work_Time_line = os.time()
arr.rest_time = 60*5
arr.rest_key = false
arr.rest_time_line = os.time()

while (true) do
	
	
	if os.time() - arr.work_Time_line <= arr.workTime then
		arr.work_key = true
		arr.rest_time_line = os.time() 
		log("工作时间")
	else
		if os.time()- arr.rest_time_line <= arr.rest_time then
			arr.work_key = false
		else
			arr.work_Time_line = os.time()
		end
	end
	
	
	wecha_play()
	
end



























