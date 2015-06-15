<?php
/**
 * Created by PhpStorm.
 * User: Rand01ph
 * Date: 15/5/18
 * Time: 上午12:56
 */


if (!defined('BASEPATH'))
    exit ('No direct script access allowed');

class Talent extends CI_Controller
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

    }

    // ------------------------------------------------------------------------

    /**
     * 默认入口
     */
    function index()
    {
        $this->load->view('templates/header');
        $this->load->view('talent');
        $this->load->view('templates/footer');
    }

    // ------------------------------------------------------------------------

}