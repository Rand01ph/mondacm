<?php

class Cases_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
    }

    public function get_cases($slug = FALSE)
    {
        if ($slug === FALSE) {
            $query = $this->db->get('cn_project');
            return $query->result_array();
        }
        $query = $this->db->get_where('cn_project', array('slug' => $slug));
        return $query->row_array();
    }
}


