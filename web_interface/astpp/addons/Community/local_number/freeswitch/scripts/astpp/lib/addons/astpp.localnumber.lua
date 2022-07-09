
function check_local_number(xml,destination_number,callerid_array,accountcode)

	local query  = "SELECT count(id) as id FROM local_number WHERE number ="..destination_number;    
		Logger.debug("[GET get_acc_info] Query :" .. query)
		assert (dbh:query(query, function(u)
		    localnumber_id = u
	   	end))
	local tmp = {}
--Logger.info("localnumber :" ..localnumber_id['id'])
	if (tonumber(localnumber_id['id']) > 0) then
		Logger.info("=============== local number ===================")
		Logger.debug("[GET get_acc_info] Query :" .. query)
		Logger.info("destination number : "..destination_number)  
		Logger.info("caller id name : "..callerid_array['cid_name'])
		Logger.info("caller id number : "..callerid_array['cid_number'])
		local caller_ids_arr=get_ani(callerid_array['cid_number'])
		if(caller_ids_arr ~= nil)then
			local speed_dial_number=get_speeddial_number(destination_number,caller_ids_arr['accountid'])
			
			Logger.info("accountid : "..caller_ids_arr['accountid'])
			Logger.info("speed_dial number : "..speed_dial_number)
			Logger.info("Destination number : "..destination_number)
			Logger.info("========================================================")  
			if (tonumber(speed_dial_number) ~= tonumber(destination_number)) then
				--local account_code_inb=''
				local query  = "SELECT number FROM accounts WHERE id ="..caller_ids_arr['accountid'].." limit 1";    
					Logger.debug("[GET get_acc_info] Query :" .. query)
					assert (dbh:query(query, function(u)
					    account_code_inb = u
				   	end))
				Logger.info("[Accountcode sandip : ".. account_code_inb['number'] .."]" );
				destination_number = speed_dial_number
				accountcode = account_code_inb['number']
				tmp[1] = destination_number
				tmp[2] = accountcode
				tmp[3]='true';
				return tmp
			else
				tmp[5]=caller_ids_arr['accountid']
				tmp[4]='NO_ROUTE_DESTINATION'
				return tmp
			end
		else
			tmp[3]='no_calller'
			return tmp
		end
	else
		tmp[3]='false'
		return tmp
    	end

	
	--error_xml_without_cdr("","ACCOUNT_EXPIRE","ASTPP-CALLINGCARD",config['playback_audio_notification'])
end
