function boxshow(txt,x1,y1,x2,y2)
	adbox = adbox or 0
	if adbox == 0 then
		adbox = 1
		fwShowWnd("wid",0,0,0,0,1)
		mSleep(2000)
	end
	fwShowTextView("wid","textid",txt,"center","FF0000","FFDAB9",10,0,x1,y1, x2,y2,0.5)
	--fwShowTextView("wid","textid","这是一个文本视图","center","FF0000","FFDAB9",0,20,0,0,200,100,0.5)
end


boxshow('登录成功',755/2+30,0,630,50)









mSleep(500)






mSleep(1000*10)