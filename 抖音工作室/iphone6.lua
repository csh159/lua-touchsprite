nLog('iphone6')

function orch(name,dj,order,logTxt,stayTime)
	local dj = dj or false
	local order = order or 1
	local arr = {}
	if type(name) == 'table' then
		if #name == 2 then
			arr = t[name[1]][name[2]]
		elseif #name == 3 then
			arr = t[name[1]][name[2]][name[3]]
		end
	else
		arr = t[name]
	end
	x1,y1 = findMultiColorInRegionFuzzy(arr[1],arr[2],arr[3],arr[4],arr[5],arr[6],arr[7])
	if x1 > 0 and y1 > 0 then
		if dj then
			local new_arr2 = split(arr[2],',')
			for i,v in pairs(new_arr2)do
				new_arr2[i]=split(v,'|')
			end
			print_r(new_arr2)
			if order == 1 then
				click(x1,y1)
			else
				click(x+new_arr2[order-1][1],y+new_arr2[order-1][2])
			end
			if type(name) ~= 'table' then
				log("点击-->( "..order..' )->'..name)
			end
		else
			if type(name) ~= 'table' then
				log("找到-->( "..order..' )->'..name)
			end
		end
		log(logTxt)
		return true
	end
end

t={}



--首页菜单
t['首页红绿']={{335,1295,0x17eee8}, {335,1273,0x17eee8}, {415,1285,0xff2c55}, {414,1301,0xff2c55}, }
	t['首页红绿_完善资料']={ 0xfe2c55, "-165|-2|0xffeaee,-165|3|0xfe2c55,-100|-3|0xffeaee", 90, 75, 4, 740, 437}
	t['首页红绿_我的页面']={{673,1332,0xffffff}, {667,1277,0xffffff}, {704,79,0xacacac}, {690,78,0xacacac}, {677,79,0xababab}, }

--个人资料
t['个人资料_保存']={ 0xfe2c55, "-349|4|0xe8e8e9,-649|-3|0xa2a3a7", 90, 8, 5, 739, 234}
	t['个人资料_签名位置']={ 0xe8e8e9, "13|-12|0x161823,-1|-22|0xe8e8e9", 90, 131, 716, 743, 893}







----弹窗
t['弹窗_允许']={ 0x007aff, "-5|-17|0x007aff,-253|-5|0x007aff,-327|-19|0x007aff", 90, 149, 730, 607, 803}
t['弹窗_位置允许']={ 0x292b37, "-263|-9|0x2a2c38,37|-426|0xf783c9,-302|-364|0x3bc8f6", 90, 110, 469, 639, 967}

---有用弹窗
t['弹窗_微博登录']={ 0x050101, "0|-13|0xe42223,23|-25|0xf49c25,22|6|0xe42223", 90, 49, 618, 738, 893}
t['弹窗_微博登录_界面']={ 0x000000, "-22|-31|0xf11e44,32|-41|0xffc402,28|3|0xf41a33", 90, 252, 95, 494, 483}
	t['弹窗_微博登录_界面_密码']={ 0xa9a9a9, "1|-7|0xffffff,-1|-22|0xa9a9a9", 90, 108, 588, 290, 649}
	t['弹窗_微博登录_界面_帐号']={ 0xa9a9a9, "13|-12|0xa9a9a9,32|-20|0xa9a9a9", 90, 115, 506, 293, 560}
	t['弹窗_微博登录_界面_完成']={ 0x007aff, "28|-19|0x007aff", 90, 610, 578, 747, 921}
	t['弹窗_微博登录_界面_登录']={ 0xfffefd, "5|-38|0xff8200,-78|-2|0xff8200,1|43|0xff8200", 90, 163, 462, 644, 995}
t['弹窗_微博登录_安全验证']={ 0xfa8200, "411|400|0x333333,577|346|0x666666,461|-69|0x252731", 90, 3, 4, 743, 616}
t['弹窗_微博登录_授权登录']={ 0xff8200, "-171|-353|0x000000,-174|-371|0xf4161e,39|-363|0xf02054,46|-363|0x22f3f2", 90, 12, 43, 706, 991}
t['弹窗_微博登录_绑定跳过']={{706,76,0xffffff}, {449,282,0xf3efff}, {377,792,0xa430fa}, {393,793,0xa430fb}, }









































