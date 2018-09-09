require("TSLib")
require("ALZ")
--require("haoi23")
require("tsp")
require("今日头条阅读量")
require("PL")

ALZ()
--//输入私人库






function beforeUserExit()
	close_VPN()
end

function ms(n)
	mSleep(1000* n)
end

function reg()

	计时 = os.time()
	超时 = 60 * 3
	手机号 = true
	while os.time() - 计时 < 超时 do
		if active(app)then
			ms(5)
		elseif c_pic(page['主页']['未登录'],'未登录',true)then
		elseif c_pic(page['主页']['手机'],'手机',true)then
		elseif done(page['注册页面']['注册弹窗'],'注册弹窗')then

			if c_pic(page['注册页面']['手机号'],'手机号',true)then
				ms(1)
				out_time = os.time()
				while os.time() - out_time < 10 do
					if GET_Phone(id,token)then
						input(phone)
						delay(1)
						break
					end
					delay(1)
				end
			end
			
			if c_pic(page['注册页面']['发送验证码'],'发送验证码',true)then
				delay(8)
				if c_pic(page['注册页面']['发送验证码'],'发送验证码',false)then
					toast('验证码发送失败',3)
					return false
				else
					if c_pic(page['注册页面']['请输入验证码'],'请输入验证码',true)then
						get_message = 0
						while true do
							if getMessage(id,phone)then
								input(dxyzm)
								ms(2)
								break
							end
							get_message = get_message + 1
							if get_message > 20 then
								log('获取短信超时',true,2)
								closeX(app)
								return false
							end
						end
					end
				end
			end
			
			if c_pic(page['注册页面']['进入头条'],'进入头条',true)then
				addBlacklist(id,phone)
				ms(5)
				if c_pic(page['注册页面']['请输入用户名'],'请输入用户名',true)then
					input(user_names[rd(1,#user_names)].. myRand(7,1))
					c_pic(page['注册页面']['完成'],'完成',true)
				end
				ms(5)
				return true
			end
			
		end
	end
	
end

function awz()
	openURL("IGG://cmd/newrecord");
	mSleep(3000)
	logTxt = '/var/mobile/iggresult.txt'
	out_time = os.time()
	while os.time()-out_time <= 10 do
		if file_exists(logTxt)then
			local new = readFile(logTxt)[1]
			if new == "1" then
				toast('一键新机成功',3)
				return true
			elseif new == "3" then
				toast('IP-->重复请注意',1)
				return true
			elseif new == '2' then
				nLog('指令正在执行过程中，还未完成')
			end
			mSleep(2000)
		else
			toast('一键新机',3)
			mSleep(1000* 3)
		end
	end
end













