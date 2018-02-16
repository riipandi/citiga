<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Oauth2 extends CI_Controller {

	function __construct() 
	{
		parent::__construct();
		$this->load->helper(['dante']);
		$this->_init();
	}

	private function _init()
	{
		$this->output->unset_template();
	}

	private function oauth2_client()
	{
		$request = new Request();
		$this->config->load('oauth2');
		return new Overtrue\Socialite\SocialiteManager($this->config->item('socialite'), $request);
	}

	private function logger()
	{
		$logger  = new Monolog\Logger('auth');
		$logfile = TEMP_PATH.SESSNAME.'-'.date('ymd').'.log';
		return $logger->pushHandler(new Monolog\Handler\StreamHandler($logfile));
	}

	public function index()
	{
		$this->session->set_flashdata('message', 'You must select a provider');
		redirect('signin', 'refresh');
	}

	public function authorize($driver = NULL)
	{
		if (!$driver) {
			$this->session->set_flashdata('message', 'You must select a provider');
			redirect('signin', 'refresh');
		}
		$response = $this->socialite()->driver($driver)->redirect();
		echo $response; // or $response->send();
	}

	public function callback($driver = NULL)
	{
		if (!$driver) {
			$this->session->set_flashdata('message', 'You must select a provider');
			redirect('signin', 'refresh');
		}
		return json_output($this->socialite()->driver($driver)->user());
		// $user->getId();        // 1472352
		// $user->getNickname();  // "overtrue"
		// $user->getName();      // "安正超"
		// $user->getEmail();     // "anzhengchao@gmail.com"
		// $user->getProviderName(); // GitHub
	}

} // EndClass
