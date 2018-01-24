<?php defined('BASEPATH') OR exit('No direct script access allowed');

use Gregwar\Captcha\CaptchaBuilder;

class Auth extends CI_Controller {

	private $tmpdir = FCPATH.'temp'.DIRECTORY_SEPARATOR;

	function __construct() 
	{
		parent::__construct();
		$this->load->database();
		$this->load->library(array('ion_auth', 'form_validation'));
		$this->load->helper(array('url', 'language', 'dante'));
		$this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));
		$this->lang->load('auth');
		$this->_init();
	}

	private function _init()
	{
		$this->output->set_template('auth');
	}
	
	private function _get_csrf_nonce()
	{
		$this->load->helper('string');
		$key = random_string('alnum', 8);
		$value = random_string('alnum', 20);
		$this->session->set_flashdata('csrfkey', $key);
		$this->session->set_flashdata('csrfvalue', $value);

		return array($key => $value);
	}

	/**
	 * @return bool Whether the posted CSRF token matches
	 */
	private function _valid_csrf_nonce()
	{
		$csrfkey = $this->input->post($this->session->flashdata('csrfkey'));
		if ($csrfkey && $csrfkey === $this->session->flashdata('csrfvalue'))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}

	public function index()
	{
		// SessionCheck
		if ($this->ion_auth->logged_in()) {
			$this->session->set_flashdata('message', 'Welcome back, you have already logged in');
			redirect('dashboard', 'refresh');
		} //End SessionCheck
		
		$this->data['title'] = 'Login';
		
		// Gogole reCaptcha
		if (($this->config->item('use_recaptcha') == TRUE) && (RECAPTCHA_SITEKEY != '')) {
			$this->data['captcha'] = new \AlbertCht\InvisibleReCaptcha\InvisibleReCaptcha(
				RECAPTCHA_SITEKEY, RECAPTCHA_SECRETKEY,
				$this->config->item('recaptcha.options')
			);
		}
		
		// Proses login
		$this->form_validation->set_rules('identity', str_replace(':', '', $this->lang->line('login_identity_label')), 'required');
		$this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required');

		if ($this->form_validation->run() === TRUE) {
			$remember = (bool)$this->input->post('remember');
			
			if ($this->ion_auth->login($this->input->post('identity'), $this->input->post('password'), $remember)) {
				$this->session->set_flashdata('message', strip_tags($this->ion_auth->messages()));
				$this->output->unset_template(); echo 'ok';
				/*
				if (!empty($this->input->post('return_url'))) {
					redirect(urldecode($this->input->post('return_url')), 'refresh');
				} else {
					redirect('dashboard', 'refresh');
				}
				*/
			} else {
				$this->session->set_flashdata('message', strip_tags($this->ion_auth->errors()));
				//redirect('login', 'refresh');
			}
		} else {
			$this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
			$this->data['identity'] = array('name' => 'identity',
				'id' => 'identity',
				'type' => 'text',
				'value' => $this->form_validation->set_value('identity'),
			);
			$this->data['password'] = array('name' => 'password',
				'id' => 'password',
				'type' => 'password',
			);

			if (!empty($this->input->get('return_url'))) {
				$this->data['return_url'] = $this->input->get('return_url');
			}
			
			// Render the view
			$this->output->set_title($this->data['title']);
			$this->load->view('auth/login', $this->data);
		}
	}

	public function logout()
	{
		$this->data['title'] = "Logout";
		$logout = $this->ion_auth->logout();
		$this->session->set_flashdata('message', strip_tags($this->ion_auth->messages()));
		redirect('login', 'refresh');
	}

	public function lostpass()
	{
		if ($this->ion_auth->logged_in()) { redirect('dashboard', 'refresh'); } // Session check

		$this->data['title'] = 'Forgot Password';

		if ($this->config->item('identity', 'ion_auth') != 'email') {
			$this->form_validation->set_rules('identity', $this->lang->line('forgot_password_identity_label'), 'required');
		} else {
			$this->form_validation->set_rules('identity', $this->lang->line('forgot_password_validation_email_label'), 'required|valid_email');
		}

		if ($this->form_validation->run() === FALSE) {
			$this->data['type'] = $this->config->item('identity', 'ion_auth');
			$this->data['identity'] = array('name' => 'identity',
				'id' => 'identity',
			);

			if ($this->config->item('identity', 'ion_auth') != 'email') {
				$this->data['identity_label'] = $this->lang->line('forgot_password_identity_label');
			} else {
				$this->data['identity_label'] = $this->lang->line('forgot_password_email_identity_label');
			}

			// set any errors and display the form
			$this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
			$this->output->set_title($this->data['title']);
			$this->load->view('auth/lostpass', $this->data);
		} else {
			$identity_column = $this->config->item('identity', 'ion_auth');
			$identity = $this->ion_auth->where($identity_column, $this->input->post('identity'))->users()->row();

			if (empty($identity)) {
				if ($this->config->item('identity', 'ion_auth') != 'email') {
					$this->ion_auth->set_error('forgot_password_identity_not_found');
				} else {
					$this->ion_auth->set_error('forgot_password_email_not_found');
				}
				$this->session->set_flashdata('message', strip_tags($this->ion_auth->errors()));
				//redirect("lostpass", 'refresh');
				echo 'bad';
			}

			$forgotten = $this->ion_auth->forgotten_password($identity->{$this->config->item('identity', 'ion_auth')});

			if ($forgotten) {
				$this->session->set_flashdata('message', strip_tags($this->ion_auth->messages()));
				//redirect("login", 'refresh');
				echo 'ok';
			} else {
				$this->session->set_flashdata('message', strip_tags($this->ion_auth->errors()));
				//redirect("lostpass", 'refresh');
				echo 'bad';
			}
		}
	}

	public function user_list()
	{
		$this->data['title'] = 'Users';

		if (!$this->ion_auth->logged_in()) {
			redirect('login?return_url='.urlencode('users'), 'refresh');
		} else if (!$this->ion_auth->is_admin()) {
			$this->session->set_flashdata('message', 'You must be an administrator to view that page');
			redirect($this->agent->referrer(), 'refresh');
		}
		$this->data['user'] = $this->ion_auth->user()->row();
		$this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

		$this->data['users'] = $this->ion_auth->users()->result();
		foreach ($this->data['users'] as $k => $user) {
			$this->data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
		}
		
		// For user add form
		// display the create user form, set the flash data error message if there is one
		
		$identity_column = $this->config->item('identity', 'ion_auth');
		$this->data['identity_column'] = $identity_column;
		$this->data['groups'] = $this->ion_auth->groups()->result_array();

		$this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

		// display the create user form		
		$this->data['first_name'] = array(
			'name' => 'first_name',
			'id' => 'first_name',
			'type' => 'text',
			'value' => $this->form_validation->set_value('first_name'),
		);
		$this->data['last_name'] = array(
			'name' => 'last_name',
			'id' => 'last_name',
			'type' => 'text',
			'value' => $this->form_validation->set_value('last_name'),
		);
		$this->data['identity'] = array(
			'name' => 'identity',
			'id' => 'identity',
			'type' => 'text',
			'value' => $this->form_validation->set_value('identity'),
		);
		$this->data['email'] = array(
			'name' => 'email',
			'id' => 'email',
			'type' => 'text',
			'value' => $this->form_validation->set_value('email'),
		);
		$this->data['company'] = array(
			'name' => 'company',
			'id' => 'company',
			'type' => 'text',
			'value' => $this->form_validation->set_value('company'),
		);
		$this->data['phone'] = array(
			'name' => 'phone',
			'id' => 'phone',
			'type' => 'text',
			'value' => $this->form_validation->set_value('phone'),
		);
		$this->data['password'] = array(
			'name' => 'password',
			'id' => 'password',
			'type' => 'password',
			'value' => $this->form_validation->set_value('password'),
		);
		$this->data['password_confirm'] = array(
			'name' => 'password_confirm',
			'id' => 'password_confirm',
			'type' => 'password',
			'value' => $this->form_validation->set_value('password_confirm'),
		);
		
		// display the create group form
		$this->data['group_name'] = array(
			'name'  => 'group_name',
			'id'    => 'group_name',
			'type'  => 'text',
			'value' => $this->form_validation->set_value('group_name'),
		);
		$this->data['description'] = array(
			'name'  => 'description',
			'id'    => 'description',
			'type'  => 'text',
			'value' => $this->form_validation->set_value('description'),
		);

		// Render the view
		$this->output->set_template('default');
		$this->output->set_title($this->data['title']);
		$this->load->view('auth/user_list', $this->data);
	}

	public function user_delete($id = NULL) {
		if (!$this->ion_auth->logged_in() || !$this->ion_auth->is_admin()) {
			$this->session->set_flashdata('message', 'You must be an administrator to view that page');
			redirect($this->agent->referrer(), 'refresh');
		}

		$id = (int)$id;
		if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
			$this->ion_auth->delete_user($id);
			$this->session->set_flashdata('message', 'Berhasil menghapus pengguna');
			redirect($this->agent->referrer(), 'refresh');
		}
	}

	public function user_add()
	{
		$this->data['title'] = $this->lang->line('create_user_heading');
		$this->data['user'] = $this->ion_auth->user()->row();
		
		if (!$this->ion_auth->logged_in() || !$this->ion_auth->is_admin()) {
			redirect('login', 'refresh');
		}

		$tables = $this->config->item('tables', 'ion_auth');
		$identity_column = $this->config->item('identity', 'ion_auth');
		$this->data['identity_column'] = $identity_column;

		// validate form input
		$this->form_validation->set_rules('first_name', $this->lang->line('create_user_validation_fname_label'), 'trim|required');
		$this->form_validation->set_rules('last_name', $this->lang->line('create_user_validation_lname_label'), 'trim|required');
		if ($identity_column !== 'email')
		{
			$this->form_validation->set_rules('identity', $this->lang->line('create_user_validation_identity_label'), 'trim|required|is_unique[' . $tables['users'] . '.' . $identity_column . ']');
			$this->form_validation->set_rules('email', $this->lang->line('create_user_validation_email_label'), 'trim|required|valid_email');
		}
		else
		{
			$this->form_validation->set_rules('email', $this->lang->line('create_user_validation_email_label'), 'trim|required|valid_email|is_unique[' . $tables['users'] . '.email]');
		}
		$this->form_validation->set_rules('phone', $this->lang->line('create_user_validation_phone_label'), 'trim');
		$this->form_validation->set_rules('company', $this->lang->line('create_user_validation_company_label'), 'trim');
		$this->form_validation->set_rules('password', $this->lang->line('create_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password_confirm]');
		$this->form_validation->set_rules('password_confirm', $this->lang->line('create_user_validation_password_confirm_label'), 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$email = strtolower($this->input->post('email'));
			$identity = ($identity_column === 'email') ? $email : $this->input->post('identity');
			$password = $this->input->post('password');

			$additional_data = array(
				'first_name' => $this->input->post('first_name'),
				'last_name' => $this->input->post('last_name'),
				'company' => $this->input->post('company'),
				'phone' => $this->input->post('phone'),
			);
		}
		if ($this->form_validation->run() === TRUE && $this->ion_auth->register($identity, $password, $email, $additional_data)) {
			$this->session->set_flashdata('message', strip_tags($this->ion_auth->messages()));
			redirect($this->agent->referrer(), 'refresh');
		} else {
			$this->session->set_flashdata('message', strip_tags($this->ion_auth->messages()));
			redirect($this->agent->referrer(), 'refresh');
		}
	}

	public function user_edit()
	{
		if ($this->uri->segment(1) == 'profile') {
			$this->data['title'] = "User Profile";
			$return_url = 'profile';
			if ($this->ion_auth->logged_in()) {
				$id = $this->ion_auth->user()->row()->id;
			}
		} else {
			$this->data['title'] = "Edit User";
			if (($this->ion_auth->logged_in()) && (!$this->ion_auth->is_admin())) {
				$this->session->set_flashdata('message', 'You must be an administrator to view that page');
				redirect('users', 'refresh');
			}
			$id = $this->uri->segment(3);
			$return_url = 'user/edit/'.$id;
		}

		if (!$this->ion_auth->logged_in()) {
			$this->session->set_flashdata('message', 'You must login first to access this page!');
			redirect('login?return_url='.urlencode($return_url), 'refresh');
		}

		$user = $this->ion_auth->user($id)->row();
		$groups = $this->ion_auth->groups()->result_array();
		$currentGroups = $this->ion_auth->get_users_groups($id)->result();

		// validate form input
		$this->form_validation->set_rules('first_name', $this->lang->line('edit_user_validation_fname_label'), 'trim|required');
		$this->form_validation->set_rules('last_name', $this->lang->line('edit_user_validation_lname_label'), 'trim|required');
		$this->form_validation->set_rules('phone', $this->lang->line('edit_user_validation_phone_label'), 'trim|required');
		$this->form_validation->set_rules('company', $this->lang->line('edit_user_validation_company_label'), 'trim|required');

		if (isset($_POST) && !empty($_POST)) {
			if ($this->_valid_csrf_nonce() === FALSE || $id != $this->input->post('id')) {
				show_error($this->lang->line('error_csrf'));
			}

			// update the password if it was posted
			if ($this->input->post('password')) {
				$this->form_validation->set_rules('password', $this->lang->line('edit_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password_confirm]');
				$this->form_validation->set_rules('password_confirm', $this->lang->line('edit_user_validation_password_confirm_label'), 'required');
			}

			if ($this->form_validation->run() === TRUE) {
				$data = array(
					'first_name' => $this->input->post('first_name'),
					'last_name' => $this->input->post('last_name'),
					'company' => $this->input->post('company'),
					'username' => $this->input->post('identity'),
					'email' => $this->input->post('email'),
					'phone' => $this->input->post('phone'),
				);

				// update the password if it was posted
				if ($this->input->post('password')) {
					$data['password'] = $this->input->post('password');
				}

				// Only allow updating groups if user is admin
				if ($this->ion_auth->is_admin()) {
					$groupData = $this->input->post('groups');
					if (isset($groupData) && !empty($groupData)) {
						$this->ion_auth->remove_from_group('', $id);
						foreach ($groupData as $grp) {
							$this->ion_auth->add_to_group($grp, $id);
						}

					}
				}

				// check to see if we are updating the user
				if ($this->ion_auth->update($this->input->post('id'), $data)) {
					$this->session->set_flashdata('message', strip_tags($this->ion_auth->messages()));
					redirect($return_url, 'refresh');
				} else {
					$this->session->set_flashdata('message', strip_tags($this->ion_auth->errors()));
					redirect($this->agent->referrer(), 'refresh');
				}

			}
		}

		// display the edit user form
		$this->data['csrf'] = $this->_get_csrf_nonce();

		// set the flash data error message if there is one
		$this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

		// pass the user to the view		
		$this->data['user'] = $user;
		$this->data['groups'] = $groups;
		$this->data['currentGroups'] = $currentGroups;

		$this->data['first_name'] = [
			'name'  => 'first_name',
			'id'    => 'first_name',
			'type'  => 'text',
			'value' => $this->form_validation->set_value('first_name', $user->first_name),
		];
		$this->data['last_name'] = [
			'name'  => 'last_name',
			'id'    => 'last_name',
			'type'  => 'text',
			'value' => $this->form_validation->set_value('last_name', $user->last_name),
		];
		$this->data['identity'] = [
			'name'  => 'identity',
			'id'    => 'identity',
			'type'  => 'text',
			'value' => $this->form_validation->set_value('identity', $user->username),
		];
		$this->data['email'] = [
			'name'  => 'email',
			'id'    => 'email',
			'type'  => 'email',
			'value' => $this->form_validation->set_value('email', $user->email),
		];
		$this->data['company'] = [
			'name'  => 'company',
			'id'    => 'company',
			'type'  => 'text',
			'value' => $this->form_validation->set_value('company', $user->company),
		];
		$this->data['phone'] = [
			'name'  => 'phone',
			'id'    => 'phone',
			'type'  => 'text',
			'value' => $this->form_validation->set_value('phone', $user->phone),
		];
		$this->data['password'] = [
			'name' => 'password',
			'id'   => 'password',
			'type' => 'password'
		];
		$this->data['password_confirm'] = [
			'name' => 'password_confirm',
			'id'   => 'password_confirm',
			'type' => 'password'
		];

		// Render the view
		$this->output->set_template('default');
		$this->output->set_title($this->data['title']);
		$this->load->view('auth/user_edit', $this->data);
	}
	
	public function activate($id, $code = FALSE)
	{
		if ($code !== FALSE) {
			$activation = $this->ion_auth->activate($id, $code);
		} else if ($this->ion_auth->is_admin()) {
			$activation = $this->ion_auth->activate($id);
			$this->session->set_flashdata('message', 'Berhasil mengaktifkan pengguna');
			redirect($this->agent->referrer(), 'refresh');
		}

		if ($activation) {
			$this->session->set_flashdata('message', strip_tags($this->ion_auth->messages()));
			redirect("auth", 'refresh');
		} else {
			$this->session->set_flashdata('message', strip_tags($this->ion_auth->errors()));
			redirect("lostpass", 'refresh');
		}
	}

	public function deactivate($id = NULL) {
		if (!$this->ion_auth->logged_in() || !$this->ion_auth->is_admin()) {
			$this->session->set_flashdata('message', 'You must be an administrator to view that page');
			redirect($this->agent->referrer(), 'refresh');
		}

		$id = (int)$id;
		if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
			$this->ion_auth->deactivate($id);
			$this->session->set_flashdata('message', 'Berhasil menonaktifkan pengguna');
			redirect($this->agent->referrer(), 'refresh');
		}
	}

	public function group_add()
	{
		$this->data['title'] = 'Create Group';		

		if (!$this->ion_auth->logged_in() || !$this->ion_auth->is_admin()) {
			redirect($this->agent->referrer(), 'refresh');
		}

		// validate form input
		$this->form_validation->set_rules('group_name', $this->lang->line('create_group_validation_name_label'), 'trim|required|alpha_dash');

		if ($this->form_validation->run() === TRUE) {
			$new_group_id = $this->ion_auth->create_group($this->input->post('group_name'), $this->input->post('description'));
			if ($new_group_id) {
				$this->session->set_flashdata('message', $this->ion_auth->messages());
				redirect($this->agent->referrer(), 'refresh');
			}
		} else {
			//$this->_render_page('auth/create_group', $this->data);
			redirect('users', 'refresh');
		}
	}

} // EndClass
