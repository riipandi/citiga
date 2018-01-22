<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Arci_model extends CI_Model {

    public function count_row($table){
        return $this->db->count_all_results($table);
    }

} // EndClass