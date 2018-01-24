<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	function __construct() 
	{
		parent::__construct();
		$this->load->library(['ion_auth']);
		$this->_init();
	}

	/*
	 * 
	 * This init function used to load extra css and js, 
	 * use this with specific page or controller. 
	 * 
	 * Example rendering template:
	 *   $this->output->set_template('simple');
	 *   $this->load->view('default/example_2');
	 * 
	 * Example render with sidebar:
	 *   $this->load->section('sidebar', 'default/sidebar');
	 *   $this->load->view('default/example_3');
	 * 
	 * Example render without template:
	 *   $this->output->unset_template();
	 *   $this->load->view('default/example_4');
	*/
	private function _init()
	{
		$this->output->set_template('default');
		$this->load->js('assets/js/chart.min.js');
	}
	
	public function index()
	{
		if ($this->ion_auth->logged_in()) {
			$this->session->set_flashdata('message', 'Welcome back, you have already logged in');
			redirect('dashboard', 'refresh');
		}
		//$this->output->cache(3600);
		$this->output->unset_template();
		$this->load->view('default/welcome');
	}
	
	public function dashboard()
	{
		// Session check
		if (!$this->ion_auth->logged_in()) {
			$this->session->set_flashdata('message', 'You must login first to access this page!');
			redirect('login?return_url='.urlencode('dashboard'), 'refresh');
		} // End session check
		
		$this->data['title'] = 'Dashboard';
		$this->data['user'] = $this->ion_auth->user()->row();

		// Count records
		$this->load->model('dante_model');
		
		// Render the view
		$this->load->js('assets/js/demo.js');
		$this->output->set_title($this->data['title']);
		$this->load->view('default/dashboard1', $this->data);
	}

} // EndClass
