<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dante_model extends CI_Model {

    public function count_row($table){
        return $this->db->count_all_results($table);
    }

} // EndClass