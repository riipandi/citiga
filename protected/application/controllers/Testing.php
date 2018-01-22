<?php defined('BASEPATH') OR exit('No direct script access allowed');

use Box\Spout\Reader\ReaderFactory;
use Box\Spout\Writer\WriterFactory;
use Box\Spout\Common\Type;

class Testing extends CI_Controller {
	
	private $file_path = FCPATH.'../files/';

	function __construct() 
	{
		parent::__construct();
		$this->load->library(array('ion_auth'));
		$this->_init();
	}

	private function _init()
	{
		$this->output->unset_template();
	}

	public function index()
	{
		$gIDs = new \Delight\Ids\Id();
		echo $gIDs->obfuscate(9456781);
	}
	public function sendmail()
	{	
		$config = array(
			'protocol'  => $this->config->item('protocol'),
			'smtp_port' => $this->config->item('smtp_port'),
			'smtp_host' => $this->config->item('smtp_host'),
			'smtp_user' => $this->config->item('smtp_user'),
			'smtp_pass' => $this->config->item('smtp_pass'),
			'mailtype'  => 'html',
		);
		$this->load->library(['email','encrypt']);
		$this->email->initialize($config);
		$this->email->from('admin@localhost', 'Admin Sistem');
		$this->email->to('ar.is@outlook.com');
		$this->email->subject('Send Email Codeigniter');
		$this->email->message('The email send using codeigniter library');

		try {
			$this->email->send();
			echo 'Email terkirim<br><br>';
			print_r($config);
		} catch (Exception $e) {
			echo $e->getMessage();
			exit;
		}
	}

	public function excel_write()
	{
        $writer = WriterFactory::create(Type::XLSX); // File format: XLSX|CSV|ODS

        //stream to browser
        $writer->openToBrowser('testing.xlsx');

        $header = [ 'No SP', 'Tgl SP', 'Payment' ];
        $writer->addRow($header); // add a row at a time

        $rows = [
            ['SP-903923', '2017-11-12', '3895'],
            ['SP-6546ss', '2017-10-29', '7567'],
            ['SP-546546', '2017-08-29', '3453'],
            ['SP-675677', '2017-02-29', '4654'],
            ['SP-324344', '2017-12-29', '9789']
        ];

        $writer->addRows($rows); // add multiple rows at a time

        $writer->close();
	}

	public function excel_read()
	{
		try {
			$reader = ReaderFactory::create(Type::XLSX);   //set Type file xlsx
			$reader->open($this->file_path.'testing.xlsx');  //open the file

			echo "<pre>";	          
			$i = 0; 

			// Sheets Iterator. Kali aja multiple sheets
			foreach ($reader->getSheetIterator() as $sheet) {
				foreach ($sheet->getRowIterator() as $row) {
				print_r($row); ++$i;
				}
			}
			echo "<br> Total Rows : ".$i." <br>";
			$reader->close();
			echo "Peak memory:", (memory_get_peak_usage(true) / 1024 / 1024), " MB" ,"<br>";
		} catch (Exception $e) {
			echo $e->getMessage();
			exit;
		}

	}

} // EndClass
