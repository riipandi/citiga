<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Filemanager extends CI_Controller {

    function __construct() 
	{
		parent::__construct();
		$this->load->helper(['url']);
        $this->output->unset_template();
    }
    
    public function index()
    {
        $data['connector'] = site_url('filemanager/connector');
        $this->load->view('default/elfinder', $data);
    }
    
    public function connector()
    {
            $opts = array(
            'roots' => array(
                array( 
                    'driver'        => 'LocalFileSystem',
                    'path'          => FCPATH.'../files',
                    'URL'           => base_url('files'),
                    'uploadDeny'    => array('all'),                  // All Mimetypes not allowed to upload
                    'uploadAllow'   => array('image', 'text/plain', 'application/pdf'),// Mimetype `image` and `text/plain` allowed to upload
                    'uploadOrder'   => array('deny', 'allow'),        // allowed Mimetype `image` and `text/plain` only
                    'accessControl' => array($this, 'elfinderAccess'),// disable and hide dot starting files (OPTIONAL)
                    // more elFinder options here
                ) 
            ),
        );
        $connector = new elFinderConnector(new elFinder($opts));
        $connector->run();
    }
    
    private function elfinderAccess($attr, $path, $data, $volume, $isDir, $relpath)
    {
        $basename = basename($path);
        return $basename[0] === '.'                  // if file/folder begins with '.' (dot)
                    && strlen($relpath) !== 1        // but with out volume root
            ? !($attr == 'read' || $attr == 'write') // set read+write to false, other (locked+hidden) set to true
            :  null;                                 // else elFinder decide it itself
    }
}