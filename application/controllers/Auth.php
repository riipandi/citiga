<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	function __construct() 
	{
		parent::__construct();
		$this->load->library(['session']);
		$this->load->helper(['globals', 'dante']);
		$this->_init();
	}

	private function _init()
	{
		$this->output->set_template('auth');
	}
	
	public function index()
	{
		$this->data['title'] = 'Sign In';

		// sessionCheck
		if (Globals::_auth()->isLoggedIn()) {
			redirect_flash('dashboard', 'message', 'Welcome back, you are already logged in!');
		} // sessionCheck

		// Validate Login
		if (isset($_POST) && !empty($_POST)) {
			// Google reCaptcha
			if (($this->config->item('use_recaptcha') == TRUE) && (RECAPTCHA_SITEKEY != '')) {
				Globals::_recaptcha()->verifyResponse($this->input->post('g-recaptcha-response'));
			}

			$user     = $this->input->post('identity');
			$pass     = $this->input->post('password');
			$remember = $this->input->post('rememberme');
			$rememberDuration = ($remember == 1) ? (int) (60 * 60 * 24 * 365.25) : null;
			$this->output->unset_template();

			try {
				if (is_email($user)) {
					Globals::_auth()->login($user, $pass, $rememberDuration);
				} else {
					Globals::_auth()->loginWithUsername($user, $pass, $rememberDuration);
				}
				$this->session->set_flashdata('message', 'Hello '.Globals::_auth()->getUsername().', how are you?');
				json_output(200, 'ok');
			}
			catch (\Delight\Auth\UnknownUsernameException $e) {
				redirect_flash('signin', 'message', 'Account not found');
			}
			catch (\Delight\Auth\InvalidEmailException $e) {
				redirect_flash('signin', 'message', 'Account not found');
			}
			catch (\Delight\Auth\AmbiguousUsernameException $e) {
				redirect_flash('signin', 'message', 'Ambiguous username');
			}
			catch (\Delight\Auth\InvalidPasswordException $e) {
				redirect_flash('signin', 'message', 'Check your credential');
			}
			catch (\Delight\Auth\EmailNotVerifiedException $e) {
				redirect_flash('signin', 'message', 'Email not verified');
			}
			catch (\Delight\Auth\TooManyRequestsException $e) {
				redirect_flash('signin', 'message', 'Too many requests');
			}
		}
		else 
		{
			// Google reCaptcha
			if (($this->config->item('use_recaptcha') == TRUE) && (RECAPTCHA_SITEKEY != '')) {
				$this->data['captcha'] = Globals::_recaptcha();
			}

			$this->data['social_login'] = ($this->config->item('enable_social_login') == TRUE) ?? TRUE;
			$this->data['csrf_name']    = $this->security->get_csrf_token_name();
			$this->data['csrf_hash']    = $this->security->get_csrf_hash();

			Globals::_logger('public')->addInfo('Opening login page');
			$this->output->set_title($this->data['title']);
			$this->load->view('auth/login', $this->data);
		}
	}

	public function signout()
	{
		$this->data['title'] = "Sign Out";
		Globals::_logger('auth')->addInfo('User logout');
		Globals::_auth()->logOut();
		redirect_flash('signin', 'message', 'You are now logged out');
	}

	public function signup()
	{
		$this->data['title'] = "Sign Up";
		Globals::_logger('auth')->addInfo('User logout');
		Globals::_auth()->logOut();
		redirect_flash(return_login(), 'message', 'You are now logged out!');
	}

	public function lostpass()
	{
		$this->data['title'] = 'Forgot Password';
	}

	public function user_list()
	{
		$this->data['title'] = 'Users';
	}

	public function user_delete($id = NULL) {
		$this->data['title'] = 'Delete User';
	}

	public function user_add()
	{
		$this->data['title'] = 'Add User';
	}

	public function user_edit()
	{
		$this->data['title'] = "Edit User";
	}

	public function user_profile()
	{
		// sessionCheck
		if (!Globals::_auth()->isLoggedIn()) {
			redirect_flash(return_login('profile'), 'message', 'You must login to access this page!');
		} // sessionCheck
		
		// Title and User Session Variable
		$this->data['title'] = "User Profile";
		$this->data['user'] = Globals::_auth();
		
		$this->data['firstname']   = Globals::_auth()->getUsername();
		$this->data['lastname']    = Globals::_auth()->getUsername();
		$this->data['username']    = Globals::_auth()->getUsername();
		$this->data['mailaddress'] = Globals::_auth()->getEmail();

		// Render the view
		$this->output->set_template('default');
		$this->output->set_title($this->data['title']);
		$this->load->view('auth/user_edit', $this->data);
	}

	public function activate($id, $code = FALSE)
	{
		$this->data['title'] = "User Activation";
		if ($code !== FALSE) {
			// do activate
		} else if ($this->ion_auth->is_admin()) {
			// not admin
		}
	}

	public function deactivate($id = NULL) {
		$this->data['title'] = "Deactivate User";
	}

} // EndClass
