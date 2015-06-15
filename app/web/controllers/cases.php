<?php
/**
 * Created by PhpStorm.
 * User: Rand01ph
 * Date: 15/5/18
 * Time: 上午12:56
 */


if (!defined('BASEPATH'))
    exit ('No direct script access allowed');

class Cases extends CI_Controller
{


    /**
     * 构造函数
     *
     * @access public
     * @return void
     */
    function __construct()
    {
        parent::__construct();
        $this->load->model('cases_model');

    }

    // ------------------------------------------------------------------------

    /**
     * 默认入口
     */
    function index()
    {
        $data['cases'] = $this->cases_model->get_cases();
        $this->load->view('templates/header');
        $this->load->view('cases', $data);
        $this->load->view('templates/footer');
    }

    // ------------------------------------------------------------------------

}

