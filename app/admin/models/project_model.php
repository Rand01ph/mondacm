<?php
if (!defined('BASEPATH'))
    exit ('No direct script access allowed');

/**
 * 后台首页幻灯片管理模型
 *
 * @category Models
 * @author 二　阳°(QQ:707069100)
 * @link http://weibo.com/513778937?topnav=1&wvr=5
 */
class Project_model extends Base_model
{

    var $model_table = 'project';

    function __construct()
    {
        parent::__construct();
    }

    // ------------------------------------------------------------------------


    /**
     * 获得所有首页幻灯片
     *
     * @access public
     * @return object
     */
    public function get_projects($rows, $page)
    {
        if (!empty($rows)) {
            $this->db->limit($rows);
        }

        if (!empty($page)) {
            $this->db->offset($page);
        }
        $table_project = $this->db->dbprefix($this->model_table);
        $table_mode = $this->db->dbprefix('category');
        return $this->db->select("$table_project.id as id, $table_project.title as title ,$table_mode.name as mode,$table_project.url as url,
                                     $table_project.thumb as thumb,$table_project.rank as rank,$table_project.remark as remark,
                                     $table_project.addtime as addtime,$table_project.updatetime as updatetime,
                                    $table_project.addip as addip,$table_project.updateip as updateip,
                                    $table_project.addip_address as addip_address,$table_project.updateip_address as updateip_address,$table_project.status as status ")
            ->from($table_project)->join($table_mode, "$table_mode.id = $table_project.mode_id", 'left')
            ->order_by('id desc,addtime desc,updatetime desc')->get()->result_array();
    }

    // ------------------------------------------------------------------------


}

// ------------------------------------------------------------------------

/* End of file project_model.php */
/* Location: ./app/admin/models/project_model.php */
