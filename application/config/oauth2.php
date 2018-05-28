<?php defined('BASEPATH') OR exit('No direct script access allowed');

$config['oauth2_client'] = [
    'github' => [
        'client_id'     => 'c2431aea0a40357b4e99',
        'client_secret' => '18749a8ab876f5cf58ee7663f33b21de3aeae8e2',
        'redirect'      => site_url('oauth2/callback/github'),
    ],
    'google' => [
        'client_id'     => '255960815233-5kjkdlqlmro2roume55lq923e8e4dij2.apps.googleusercontent.com',
        'client_secret' => 'PytoOtSbLHAC9kXiVoO5-bJ2',
        'redirect'      => site_url('oauth2/callback/google'),
    ],
    'facebook' => [
        'client_id'     => '1660801877530107',
        'client_secret' => '66a23639e2cf768e461f8b31606f595a',
        'redirect'      => site_url('oauth2/callback/facebook'),
    ],
];
