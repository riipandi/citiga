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
		// Session check
		if (!$this->ion_auth->logged_in()) {
			$this->session->set_flashdata('message', 'You must login first to access this page!');
			redirect('login?return_url='.urlencode('options'), 'refresh');
		} else if (!$this->ion_auth->is_admin()) {
			$this->session->set_flashdata('message', 'You must be an administrator to view that page');
			redirect($this->agent->referrer(), 'refresh');
		} // End session check

		$this->output->set_template('default');
	}
	
	public function index()
	{
		$this->data['title'] = 'Options';
		$this->data['user'] = $this->ion_auth->user()->row();

		$this->load->view('default/blank', $this->data);
	}
	
} // EndClass
