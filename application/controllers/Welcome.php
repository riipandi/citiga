<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	function __construct() 
	{
		parent::__construct();
		$this->load->library(['session']);
		$this->load->helper(['globals', 'dante']);
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

	private function policy() 
    {
		$policy = new \Delight\PrivacyPolicy\Language\EnglishPrivacyPolicy();
		$policy->setLastUpdated(1393372800);
		$policy->setVersionName('v3.1.4');
		$policy->setExpiration(1395792000);
		$policy->setCanonicalUrl(site_url('privacy'));
		$policy->setContactEmail('privacy@example.com');
		$policy->setContactUrl(site_url('contact'));

		$policy->setUserDataTraded(false);
		$policy->setDataMinimizationGoal(true);
		$policy->setChildrenMinimumAge(13);
		$policy->setPromotionalEmailOptOut(true);
		$policy->setFirstPartyCookies(true);
		$policy->setThirdPartyCookies(true);
		$policy->setAccountDeletable(false);
		$policy->setPreservationInBackups(true);
		$policy->setThirdPartyServiceProviders(true);
		$policy->setTransferUponMergerOrAcquisition(true);
		$policy->setTlsEverywhere(true);
		$policy->setRightToInformation(true);
		$policy->setNotificationPeriod(30);
        return $policy;
    }
	
	public function index()
	{
		$this->output->cache(3600);
		$this->output->unset_template();
		$this->load->view('default/welcome');
	}
	
	public function privacy()
	{
		$this->output->cache(3600);
		$this->output->unset_template();
        echo $this->policy()->toHtml();
	}

	public function dashboard()
	{
		// sessionCheck
		if (!Globals::_auth()->isLoggedIn()) {
			redirect_flash(return_login('dashboard'), 'message', 'You must login to access this page!');
		} // sessionCheck
		
		$this->data['title'] = 'Dashboard';
		$this->data['user'] = Globals::_auth();

		// Count records
		//$this->load->model('dante_model');
		
		if (file_exists(APPPATH.'views/'.SESSNAME.'.php')) {
			$viewfile = SESSNAME;
		} else {
			$viewfile = 'default/dashboard';
		}

		// Render the view
		$this->load->js('assets/js/demo.js');
		$this->output->set_title($this->data['title']);
		$this->load->view($viewfile, $this->data);
	}

	public function robotxt()
	{
		$this->output->cache(3600);
		$this->output->unset_template();
		$this->output->set_content_type('text/plain');
        echo "User-agent: *\nDisallow: /";
	}
	
} // EndClass
