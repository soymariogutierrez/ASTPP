<?php
// ##############################################################################
// ASTPP - Open Source VoIP Billing Solution
//
// Copyright (C) 2016 iNextrix Technologies Pvt. Ltd.
// Samir Doshi <samir.doshi@inextrix.com>
// ASTPP Version 3.0 and above
// License https://www.gnu.org/licenses/agpl-3.0.html
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.
// ##############################################################################
class Lowintbalance extends CI_Controller {
	function __construct() {
		parent::__construct ();
		// if (! defined ( 'CRON' ))
			// die();
		// Kinjal issue no 2184 Crons are not running because of base_url value
		if(isset($_SERVER['REQUEST_URI'])){
			redirect(base_url().'dashboard/'); 
		}
		
		// END
		$this->load->model ( "db_model" );
		$this->load->library ( "astpp/common" );
	}
	function low_balance() {
		$where = array (
				"notify_flag" => 0,
				"deleted" => "0",
				"status" => "0" 
			);
		$entity_array = array (
				"0",
				"1",
				"3" 
			);
		$this->db->where_in ( "type", $entity_array );
		$query = $this->db_model->getSelect ( "*", "accounts", $where );
		if ($query->num_rows () > 0) {
			$account_data = $query->result_array ();
		

			foreach ( $account_data as $data_key => $accountinfo ) {
				if (($accountinfo ['posttoexternal'] == 0 && ($accountinfo ["int_balance"] <= $accountinfo ["notify_credit_limit"])) || ($accountinfo ['posttoexternal'] == 1 && ($accountinfo ["int_credit_limit"] - $accountinfo ["int_balance"]) <= $accountinfo ["notify_credit_limit"])) {
					 $this->common->mail_to_users ( "international_low_balance", $accountinfo );
				}
			}
			echo "Notifications are sended sucessfully";
		}
		die();
	}
}