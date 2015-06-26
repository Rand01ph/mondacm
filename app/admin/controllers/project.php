<?php
if (!defined('BASEPATH'))
    exit ('No direct script access allowed');

/**
 * 后端首页幻灯片管理控制器
 *
 * @category Controllers
 * @author 　二　阳°(QQ:707069100)
 * @link http://weibo.com/513778937?topnav=1&wvr=5
 */
class Project extends Admin_Controller
{

    var $project_id = false;

    var $model_name = 'project';

    var $controller_name = 'project';

    function __construct()
    {
        parent::__construct();
        $this->load->model('project_model');
        $this->lang->load($this->controller_name);
    }

    // ------------------------------------------------------------------------

    /**
     * 首页幻灯片列表
     */
    function index()
    {
        $data ['title'] = $this->check_power(lang('project_list'));
        $this->load->helper('my_text');
        $rows = 20;
        $page = $this->input->get('page', TRUE) ? $this->input->get('page', TRUE) : 0;
        $data ['datas'] = $this->project_model->get_projects($rows, $page);
        // 加载分页
        $this->load->library('mypagination');
        $config['base_url'] = $this->config->item('admin_folder') . $this->controller_name . '?show';
        $config['total_rows'] = $this->project_model->get_count_num($this->model_name);
        $config['per_page'] = $rows;
        $this->mypagination->init($config);
        $data['pagination'] = $this->mypagination->create_links();
        $this->load->view($this->config->item('admin_folder') . 'projects', $data);
    }

    // ------------------------------------------------------------------------

    /*
     * 首页幻灯片表单
     */
    function form($id = false)
    {
        $this->check_power(lang('project_add_title'));
        $this->load->helper('form');
        $this->load->library('form_validation');

        // 获取子级类别下拉菜单数据
        $this->load->model('category_model');
        $data ['modes'] = $this->category_model->get_children_data();
        $data ['id'] = '';
        $data ['project_title'] = '';
        $data ['project_url'] = '';
        $data ['project_thumb'] = '';
        $data ['project_rank'] = '';
        $data ['project_remark'] = '';
        $data ['status'] = '';
        $data ['mode_id'] = '';


        if ($id) {
            $this->project_id = $id;
            $data ['title'] = lang('project_edit_title');
            $project = $this->project_model->get_one($this->model_name, array(
                'id' => $id
            ));
            if (!$project) {
                $this->session->set_flashdata('message', lang('data_not_found'));
                redirect($this->config->item('admin_folder') . $this->controller_name);
            }
            $data ['id'] = $project ['id'];
            $data ['project_title'] = $project ['title'];
            $data ['project_url'] = $project ['url'];
            $data ['project_thumb'] = $project ['thumb'];
            $data ['project_rank'] = $project ['rank'];
            $data ['project_remark'] = $project ['remark'];
            $data ['mode_id'] = $project ['mode_id'];
            $data ['status'] = $project ['status'];
        } else {
            $data ['title'] = lang('project_add_title');
        }

        $save ['mode_id'] = $this->input->post('mode_id');

        $this->form_validation->set_rules('title', 'lang:project_title', 'trim|required|alpha_chinese_dash_bias|max_length[50]|callback_check_title[]');
        $this->form_validation->set_rules('url', 'lang:project_url', 'trim|max_length[1000]');
        $this->form_validation->set_rules('thumb', 'lang:project_thumb', 'trim|max_length[100]');
        $this->form_validation->set_rules('rank', 'lang:project_rank', 'trim|integer|max_length[6]');
        $this->form_validation->set_rules('remark', 'lang:project_remark', 'trim|max_length[200]');
        $this->form_validation->set_rules('status', 'lang:project_status', 'trim|integer|max_length[2]');
        $this->form_validation->set_rules('mode_id', 'lang:project_mode', 'trim|required|integer');

        if ($this->form_validation->run() == FALSE) {
            if (!$id) {
                $data ['project_title'] = $this->input->post('title');
                $data ['project_url'] = $this->input->post('url');
                $data ['project_thumb'] = $this->input->post('thumb');
                $data ['project_rank'] = $this->input->post('rank');
                $data ['project_remark'] = $this->input->post('remark');
                $data ['mode_id'] = $this->input->post('mode_id');
            }
            $this->load->view($this->config->item('admin_folder') . 'project_form', $data);
        } else {
            $save ['title'] = $this->input->post('title');
            $save ['rank'] = $this->input->post('rank');
            $save ['url'] = $this->input->post('url');
            $save ['remark'] = $this->input->post('remark');
            $save ['mode_id'] = $this->input->post('mode_id');
            $save ['thumb'] = $this->input->post('thumb');

            if ($id) {
                $save ['status'] = $this->input->post('status');
                $save ['updatetime'] = now();
                $save ['updateip'] = $this->input->ip_address();
                $action = $this->project_model->update($this->model_name, $save, array(
                    'id' => $id
                ));
                $change_str = '';
                foreach ($save as $str) {
                    $change_str = $change_str . '[' . $str . ']';
                }
                $this->project_model->save_manager_activity_logging($this->_manager, lang('loggin_manager_update_data_table_span') . '(' . $this->model_name . '),' . lang('loggin_manager_update_data_span') . $change_str);
                unset ($change_str);
            } else {
                $save ['status'] = 1;
                $save ['addtime'] = now();
                $save ['addip'] = $this->input->ip_address();
                $action = $this->project_model->insert($this->model_name, $save);
                $change_str = '';
                foreach ($save as $str) {
                    $change_str = $change_str . '[' . $str . ']';
                }
                $this->project_model->save_manager_activity_logging($this->_manager, lang('loggin_manager_add_data_table_span') . '(' . $this->model_name . '),' . lang('loggin_manager_add_data_span') . $change_str);
                unset ($change_str);
            }

            if ($action) {
                $this->session->set_flashdata('message', lang('save_success'));
                redirect($this->config->item('admin_folder') . $this->controller_name);
            }

            $this->session->set_flashdata('error', lang('save_fail'));
            redirect($this->config->item('admin_folder') . 'project/form/' . $id, $data);
        }
    }

    // ------------------------------------------------------------------------

    /**
     * 检查名称
     */
    function check_title($str)
    {
        $title = $this->project_model->check_table_field($this->model_name, 'title', $str, $this->project_id);

        if ($title) {
            $this->form_validation->set_message('check_title', lang('error_project_title_taken'));
            return FALSE;
        } else {
            return TRUE;
        }
    }
    // ------------------------------------------------------------------------
    /**
     * 删除首页幻灯片
     */
    public function delete($id)
    {
        $data ['title'] = $this->check_power(lang('project_list'));
        if ($this->input->is_ajax_request()) {
            if ($id = 1) {
                redirect($this->config->item('admin_folder') . $this->controller_name);
            }
            $del_data = $this->project_model->get_one($this->model_name, array(
                'id' => $id
            ));
            if ($del_data) {
                if ($del_data && $this->project_model->update($this->model_name, array('status' => -1), array(
                        'id' => $del_data ['id']
                    ))
                ) {
                    $this->session->set_flashdata('message', lang('delete_success'));
                    $change_str = '';
                    foreach ($del_data as $str) {
                        $change_str = $change_str . '[' . $str . ']';
                    }
                    $this->project_model->save_manager_activity_logging($this->_manager, lang('loggin_manager_delete_data_table_span') . '(' . $this->model_name . '),' . lang('loggin_manager_delete_data_span') . $change_str);
                    unset ($change_str);
                } else {
                    $this->session->set_flashdata('message', lang('delete_fail'));
                }
            } else {
                $this->session->set_flashdata('message', lang('data_not_found'));
            }
            redirect($this->config->item('admin_folder') . $this->controller_name);
        } else {
            show_404();
        }
    }

    // ------------------------------------------------------------------------
    /**
     * 删除首页幻灯片 用于ajax
     */
    public function del()
    {
        $data ['title'] = $this->check_power(lang('project_list'));
        if ($this->input->is_ajax_request()) {
            $del_data = $this->project_model->get_one($this->model_name, array(
                'id' => $this->uri->segment(3)
            ));
            if ($del_data) {
                if ($del_data && $this->project_model->update($this->model_name, array('status' => -1), array(
                        'id' => $del_data ['id']
                    ))
                ) {
                    $msg = array(
                        'msg' => 1,
                        'info' => lang('delete_success')
                    );
                    $change_str = '';
                    foreach ($del_data as $str) {
                        $change_str = $change_str . '[' . $str . ']';
                    }
                    $this->project_model->save_manager_activity_logging($this->_manager, lang('loggin_manager_delete_data_table_span') . '(' . $this->model_name . '),' . lang('loggin_manager_delete_data_span') . $change_str);
                    unset ($change_str);
                } else {
                    $msg = array(
                        'msg' => 0,
                        'info' => lang('delete_fail')
                    );
                }
            } else {
                $msg = array(
                    'msg' => 2,
                    'info' => lang('data_not_found')
                );
            }
            echo json_encode($msg);
        } else {
            show_404();
        }
    }

    // ------------------------------------------------------------------------

    /**
     * 回收站
     */
    function recycle_bin()
    {
        $data ['title'] = $this->check_power(lang('project_recycle_bin'));
        $this->load->helper('my_text');
        $offset = $this->input->get('page', TRUE) ? $this->input->get('page', TRUE) : 0;
        $data ['datas'] = $this->project_model->get_projects(-1, 20, $offset);
        // 加载分页
        $this->load->library('mypagination');
        $config['base_url'] = $this->config->item('admin_folder') . $this->controller_name . '?show';
        $config['total_rows'] = $this->project_model->get_count_num($this->model_name);
        $this->mypagination->init($config);
        $data['pagination'] = $this->mypagination->create_links();
        $this->load->view($this->config->item('admin_folder') . 'projects_recycle_bin', $data);
    }

    // ------------------------------------------------------------------------
}

// ------------------------------------------------------------------------

/* End of file project.php */
/* Location: ./app/admin/controllers/project.php */
