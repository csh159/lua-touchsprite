





function kuaitoutiao()
	local TimeL = os.time()
	local outTime = rd(5,10)*60
	while (os.time()-TimeL < outTime ) do
		if active(arr['bid快头条'],5)then
			moveTo(width/2,900,width/2,500,10)
			delay(rd(3,5))
		end
	end
end















