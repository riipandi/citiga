<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Setting extends CI_Controller {

	function __construct() 
	{
		parent::__construct();
		$this->load->library(['ion_auth']);
		$this->_init();
	}

	private function _init()
	{
		// sessionCheck
		if (!Globals::_auth()->isLoggedIn()) {
			redirect_flash(return_login('options'), 'message', 'You must login to access this page!');
		} elseif (!Globals::_auth()->hasRole(\Delight\Auth\Role::SUPER_ADMIN)) {
			redirect_flash($this->agent->referrer(), 'message', 'You must be an administrator to view that page!');
		} // sessionCheck

		$this->output->set_template('default');
	}
	
	public function index()
	{
		$this->data['title'] = 'Option';
		$this->data['user'] = $this->ion_auth->user()->row();
		$this->output->set_title($this->data['title']);
		$this->load->view('default/blank', $this->data);
	}
	
} // EndClass
