<?php defined('BASEPATH') OR exit('No direct script access allowed');

use Box\Spout\Reader\ReaderFactory;
use Box\Spout\Writer\WriterFactory;
use Box\Spout\Common\Type;

class Backup extends CI_Controller {

	private $backup_path = FCPATH.'../files/backup'.DIRECTORY_SEPARATOR;
	
	function __construct() 
	{
		parent::__construct();
		$this->load->library(['ion_auth']);
		$this->load->helper(['download', 'directory', 'arci']);
		$this->load->dbutil();
		$this->_init();
    }
    
	private function _init()
	{
		// Session check
		if (!$this->ion_auth->logged_in()) {
			$this->session->set_flashdata('message', 'You must login first to access this page!');
			redirect('login?return_url='.urlencode('backup'), 'refresh');
		} else if (!$this->ion_auth->is_admin()) {
			$this->session->set_flashdata('message', 'You must be an administrator to view that page');
			redirect($this->agent->referrer(), 'refresh');
		} // End session check

		$this->output->set_template('default');
		$this->load->js('assets/js/demo.js');
		
		if (!is_dir($this->backup_path)) {
			mkdir($this->backup_path, 0777, TRUE);
		
		}
	}
	
	public function index()
	{
		$files = directory_map($this->backup_path, 1);
		$this->data['backup_files'] = $files;
		$this->data['title'] = 'Backup Data';
		$this->data['user'] = $this->ion_auth->user()->row();
		$this->data['backup_path'] = $this->backup_path;
		$this->load->view('default/backupdb', $this->data);
    }
    
    public function doBackup()
	{
		$filename = 'DB-'.date('Ymd-Hi').'.sql';
		$prefs = array(
			'format'     => 'sql',
			'filename'   => $filename,
			'add_drop'   => TRUE, 
			'add_insert' => TRUE,
			'newline'    => "\n"
		);
	
		$backup = $this->dbutil->backup($prefs);
		$save = $this->backup_path.$filename;
		write_file($save, $backup);
		$this->session->set_flashdata('message', 'Database berhasil dibackup, silahkan download dibawah halaman ini');
		redirect($this->agent->referrer(), 'refresh');
	}
	
	private function doRestore($filepath = NULL) {
		$isi_file = file_get_contents($filepath);
		$string_query = rtrim( $isi_file, ";" );
		$array_query = explode(";", $string_query);
		foreach($array_query as $query) {
		  $this->db->query($query);
		}
	}

    public function restore_from_file($file = NULL)
	{
		if (!$file) {
			$this->session->set_flashdata('message', 'No file selected for data restoration!');
			redirect('backup', 'refresh');
		}
		$this->doRestore($this->backup_path.$file);
		$this->session->set_flashdata('message', 'File '.$file.' berhasil direstore');
		redirect('backup', 'refresh');
	}

	public function restore_from_upload()
	{		
		$config['upload_path']    = $this->backup_path;
		$config['allowed_types']  = '*';
		$config['max_size']       = 1024*8;

		$this->load->library('upload', $config);
		$this->upload->initialize($config);

		if($this->upload->do_upload('berkas'))
		{
			$upload_data = $this->upload->data();
			$file_name = $upload_data['file_name'];
			$filepath = $upload_data['full_path'];
			$this->doRestore($filepath);
			delete_files($filepath);
			$this->session->set_flashdata('message', 'File '.$file_name.' berhasil direstore');
			redirect('backup', 'refresh');
		} else {
			$this->session->set_flashdata('message', strip_tags($this->upload->display_errors()));
			redirect('backup', 'refresh');
		}
	}

	public function delete_all()
	{
		if (delete_files($this->backup_path, TRUE)) {
			$this->session->set_flashdata('message', 'All backup files deleted');
			redirect('backup', 'refresh');
		} else {
			$this->session->set_flashdata('message', 'Failed to delete backup files');
			redirect('backup', 'refresh');
		}
	}

} // EndClass
