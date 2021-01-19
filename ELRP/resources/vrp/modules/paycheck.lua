local Proxy = module("vrp", "lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Police Department",false,"Payday: ~g~$2000"})
	end		
	-- EMS Paychecks	
	if vRP.hasPermission(user_id,"nhschief.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£75,000"})
	end
	if vRP.hasPermission(user_id,"nhsadvisor.paycheck") then
		vRP.giveBankMoney(user_id,70000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£70,000"})
	end
	if vRP.hasPermission(user_id,"nhsdeputy.paycheck") then
		vRP.giveBankMoney(user_id,65000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£65,000"})
	end
	if vRP.hasPermission(user_id,"nhsassistant.paycheck") then
		vRP.giveBankMoney(user_id,60000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£60,000"})
	end
	if vRP.hasPermission(user_id,"nhscaptain.paycheck") then
		vRP.giveBankMoney(user_id,50000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£50,000"})
	end
	if vRP.hasPermission(user_id,"nhsconsultant.paycheck") then
		vRP.giveBankMoney(user_id,45000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£45,000"})
	end
	if vRP.hasPermission(user_id,"nhsseniordoctor.paycheck") then
		vRP.giveBankMoney(user_id,40000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£40,000"})
	end
	if vRP.hasPermission(user_id,"nhsdoctor.paycheck") then
		vRP.giveBankMoney(user_id,35000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£35,000"})
	end
	if vRP.hasPermission(user_id,"nhsjuniordoctor.paycheck") then
		vRP.giveBankMoney(user_id,30000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£30,000"})
	end
	if vRP.hasPermission(user_id,"nhsparamedic.paycheck") then
		vRP.giveBankMoney(user_id,25000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£25,000"})
	end
	if vRP.hasPermission(user_id,"nhstrainee.paycheck") then
		vRP.giveBankMoney(user_id,20000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"NHS",false,"Salary: ~g~£20,000"})
	end

	-- end EMS Paychecks
	
	-- PD Paychecks
	if vRP.hasPermission(user_id,"commissioner.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£130,000"})
	end
	if vRP.hasPermission(user_id,"depcommissioner.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~120,000"})
	end
	if vRP.hasPermission(user_id,"asscommissioner.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£115,000"})
	end
	if vRP.hasPermission(user_id,"chiefsuperintendent.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£70,000"})
	end
	if vRP.hasPermission(user_id,"superintendent.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£60,000"})
	end
	if vRP.hasPermission(user_id,"chiefinpesctor.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£50,000"})
	end
	if vRP.hasPermission(user_id,"inpesctor.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£45,000"})
	end
	if vRP.hasPermission(user_id,"sergeant.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£40,000"})
	end
	if vRP.hasPermission(user_id,"seniorconstbale.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£30,000"})
	end
	if vRP.hasPermission(user_id,"policeconstbale.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£20,000"})
	end
	if vRP.hasPermission(user_id,"pcso.paycheck") then
		vRP.giveBankMoney(user_id,75000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_FLEECA",1,"MET PD",false,"Salary: ~g~£15,000"})
	end

	-- Civ Jobs
	if vRP.hasPermission(user_id,"repair.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Repair Company",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"mafia.paycheck") then
		vRP.giveMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Mafia",false,"Stolen money: ~g~$10000"})
	end	
	if vRP.hasPermission(user_id,"uber.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"UBER",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"Lawyer.paycheck") then
		vRP.giveBankMoney(user_id,4000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Lawyer",false,"Payday: ~g~$4000"})
	end
	if vRP.hasPermission(user_id,"delivery.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Delivery Company",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"citizen.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"",false,"Payday: ~g~$2000"})
	end
	-- if vRP.hasPermission(user_id,"santa.paycheck") then
		-- vRP.giveBankMoney(user_id,2000)
		-- vRPclient.notify(source,{"Payday: $2000"})
	-- end
	if vRP.hasPermission(user_id,"bankdriver.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Bank Driver",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"pilot.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Airline Company",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"ups.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"UPS Company",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"air.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Airline Company",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"trash.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Trash Collector",false,"Payday: ~g~$2000"})
	end
end)