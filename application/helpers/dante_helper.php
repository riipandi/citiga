<?php defined('BASEPATH') OR exit('No direct script access allowed');

use MatthiasMullie\Minify;

if(! function_exists('dante_helper'))
{
    function json_output($statusHeader,$response)
	{
		$ci =& get_instance();
		$ci->output->set_content_type('application/json');
		$ci->output->set_status_header($statusHeader);
		$ci->output->set_output(json_encode($response));
    }

    function redirect_flash($uri, $item, $value)
	{
		$ci =& get_instance();
		$ci->session->set_flashdata($item, $value);
		redirect($uri, 'refresh');
    }

    function return_login($url = NULL) 
    {
        $url = (!empty($url) ? $url : '');
        return 'signin?return_url='.urlencode($url);
    }

	function minify_css_file($file = NULL) 
	{
        if (empty($file)) {
    		return new Minify\CSS($file);
        }
	}

    function is_email($email = NULL) 
    {
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    function tanggal_indo($tanggal, $cetak_hari = false)
    {
        $hari = array ( 1 =>    'Senin',
                    'Selasa',
                    'Rabu',
                    'Kamis',
                    'Jumat',
                    'Sabtu',
                    'Minggu'
                );
                
        $bulan = array (1 =>   'Januari',
                    'Februari',
                    'Maret',
                    'April',
                    'Mei',
                    'Juni',
                    'Juli',
                    'Agustus',
                    'September',
                    'Oktober',
                    'November',
                    'Desember'
                );
        $split 	  = explode('-', $tanggal);
        $tgl_indo = $split[2] . ' ' . $bulan[ (int)$split[1] ] . ' ' . $split[0];
        
        if ($cetak_hari) {
            $num = date('N', strtotime($tanggal));
            return $hari[$num] . ', ' . $tgl_indo;
        }
        return $tgl_indo;
    }
    
	function rupiah($val)
    {
        return 'Rp. '.strrev(implode('.',str_split(strrev(strval($val)),3)));
    }
    
    /**
     *
     * @param string $val
     * @return integer
     *
     * Usage example:
     * echo convert_to_number("Rp. 10.000.000"); -> 10000000
     */ 
     
    function convert_to_number($val)
    {
        return intval(preg_replace('/,.*|[^0-9]/', '', $val));
    }

    function human_filesize($bytes, $decimals = 2)
    {
        $size = array('B','kB','MB','GB','TB','PB','EB','ZB','YB');
        $factor = floor((strlen($bytes) - 1) / 3);
        return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$size[$factor];
    }

    // Konversi dari "Ymd-Hi" jadi "d M Y H:i"
    // Contoh: DB-20180119-0008.sql -> 19 Jan 2018 00:10
    function human_mydate($date, $start)
    {
        $y = substr($date,$start,4);
        $m = substr($date,$start+4,2);
        $d = substr($date,$start+6,2);
        $h = substr($date,$start+9,2);
        $i = substr($date,$start+11,2);
        $t = strtotime($y.$m.$d.$h.$i);
        return date('d M Y H:i', $t);
    }

    if (!function_exists('encode')) {

        function encode($string) {
            return encrypt_decrypt('encrypt', $string);
        }
    
    }
    
    if (!function_exists('decode')) {
    
        function decode($string) {
            return encrypt_decrypt('decrypt', $string);
        }
    
    }
    
    if (!function_exists('encrypt_decrypt')) {
    
        function encrypt_decrypt($action, $string) {
            $output = false;
            $encrypt_method = "AES-256-CBC";
            $secret_key = 'sambalado';
            $secret_iv  = 'jangkrik';
    
            // hash
            $key = hash('sha256', $secret_key);
    
            // iv - encrypt method AES-256-CBC expects 16 bytes - else you will get a warning
            $iv = substr(hash('sha256', $secret_iv), 0, 16);
    
            if ($action == 'encrypt') {
                $output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
                $output = base64_encode($output);
            } else if ($action == 'decrypt') {
                $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
            }
    
            return $output;
        }
    
    }
    
    function number($val) {
        $value = number_format($val, settings('number_of_decimal'), settings('separator_decimal'), settings('separator_thousand'));
        return $value;
    }
    
    function parse_number($number, $dec_point = null) {
        $dec_point = settings('separator_decimal');
        if (empty($dec_point)) {
            $locale = localeconv();
            $dec_point = $locale['decimal_point'];
        }
        return floatval(str_replace($dec_point, '.', preg_replace('/[^\d' . preg_quote($dec_point) . ']/', '', $number)));
    }
    
    function get_date($date) {
        $format = settings('date_format');
        $timestamp = strtotime($date);
        return date($format, $timestamp);
    }
    
    function get_date_mysql($date) {
        return date_format(date_create_from_format(settings('date_format'), $date), 'Y-m-d');
    }
    
    function get_month($month) {
        $CI = get_instance();
        return $CI->lang->line($month);
    }
    
    function trx_code($type) {
        $CI = get_instance();
        $CI->load->database();
        $format = settings('code_format_' . $type);
        if ($type == 'cash_in') {
            $table = 'cash';
            $CI->db->where('type', 'in');
        } elseif ($type == 'cash_out') {
            $table = 'cash';
            $CI->db->where('type', 'out');
        } elseif ($type == 'pos') {
            $table = 'sales';
            $CI->db->where('pos', 1);
        } else {
            $table = $type;
        }
        $month = date('m');
        $year = date('y');
        $my = $month . $year;
        $in = $CI->db->where('YEAR(date)', date('Y'))->count_all_results($table);
        $in = ($in == 0) ? 1 : $in + 1;
        if ($in < 10) {
            $in = '000' . $in;
        } elseif ($in < 100) {
            $in = '00' . $in;
        } elseif ($in < 1000) {
            $in = '0' . $in;
        }
        $code = str_replace('[IN]', $in, $format);
        $code = str_replace('[MONTH]', $month, $code);
        $code = str_replace('[YEAR]', $year, $code);
        $code = str_replace('[MY]', $my, $code);
        return $code;
    }
    
    function remove_space($string) {
        return str_replace(' ', '', $string);
    }
    
    function settings($key) {
        if ($key) {
            $CI = get_instance();
            $CI->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
            //$CI->cache->delete('settings');
            if ($CI->cache->get('settings')) {
                return $CI->cache->get('settings')[$key];
            } else {
                $CI->load->database();
                $settings = $CI->db->get('settings');
                foreach ($settings->result() as $setting) {
                    $data[$setting->key] = $setting->value;
                }
                $CI->cache->save('settings', $data, 7200);
                return $data[$key];
                $query = $CI->db->get_where('settings', array('key' => $key));
                if ($query->num_rows() > 0) {
                    return $query->row()->value;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }

    function excerp($asal,$length,$ellipsis='') {
        $text = trim($asal);
        $text = strip_tags($text);
        $text = str_ireplace(' ', ' ', $text); 
        $text = preg_replace('`\[[^\]]*\]`','',$text);
        $text = str_replace(array("\r", "\n"), '', $text);
        //$text = preg_replace('/[^a-zA-Z0-9\s]/', '', $text);
        $text = substr($text, 0, $length);
        $text = substr($text, 0, strripos($text, " "));
        $text = $text.$ellipsis;
        return $text;
    }

    /**
     * Contoh:
     *   load_rss('http://sukabumitoday.com/feed');
    */
    function load_rss($res_uri,$api_endpoint='http://rss2json.com/api.json?rss_url=') {
        $data = json_decode( file_get_contents($api_endpoint . urlencode($res_uri)) , true );
    
        if($data['status'] == 'ok'){
            echo "<h1> {$data['feed']['title']} </h1> ";
            echo '<ul>';
            foreach ($data['items'] as $item) {
                echo '<li><a target="_blank" href="'.$item['link'].'">'.$item['title'].'</a><br />';
                echo 'Tanggal: '.date("d-m-Y", strtotime($item['pubDate'])).'<br />';
                echo substr($item['content'], 0, 300);  
                echo '</li>';
            }
            echo '</ul>';
        } else {
            echo 'not ok';
        }
    }
}
