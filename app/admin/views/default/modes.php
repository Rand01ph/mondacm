<?php
echo $this->load->view('header');
?>
<!--头部开始-->
<div>
    <ul class="breadcrumb">
        <li><a href="<?php echo site_url('main'); ?>"><?php echo lang('set_system'); ?></a><span
                class="divider">/</span></li>
        <li><a
                href="<?php echo site_url($this->config->item('admin_folder') . 'mode'); ?>"><?php echo $title; ?></a>
        </li>
    </ul>
</div>
<!--头部结束-->
<?php
if ($this->session->flashdata('message')) {
    $message = $this->session->flashdata('message');
}
if ($this->session->flashdata('error')) {
    $error = $this->session->flashdata('error');
}
if (function_exists('validation_errors') && validation_errors() != '') {
    $error = validation_errors();
}
?>

<?php if (!empty($message)): ?>
    <div class="alert alert-info">
        <a class="close" data-dismiss="alert">×</a>
        <?php echo $message; ?>
    </div>
<?php endif; ?>
<?php if (!empty($error)): ?>
    <div class="alert alert-error">
        <a class="close" data-dismiss="alert">×</a>
        <?php echo $error; ?>
    </div>
<?php endif; ?>

<!--模块列表开始-->
<div class="row-fluid">
    <div class="box span12">
        <div class="box-header well">
            <h2>
                <i class="icon-info-sign"></i> <?php echo lang('mode_list'); ?></h2>

            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i
                        class="icon-chevron-up"></i></a> <a href="#"
                                                            class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <table
                class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                <tr>
                    <th><?php echo lang('mode_status'); ?></th>
                    <th><?php echo lang('mode_name'); ?></th>
                    <th><?php echo lang('mode_rank'); ?></th>
                    <th><?php echo lang('mode_remark'); ?></th>
                    <th><?php echo lang('mode_handle'); ?></th>
                </tr>
                </thead>
                <tbody>
                <?php if ($datas): ?>
                    <?php foreach ($datas as $n => $mode_datas): ?>
                        <tr>
                            <td><?php if ($mode_datas['status'] == 1): ?><span
                                    title="<?php echo lang('mode_status_open'); ?>"
                                    class="icon icon-unlocked"></span><?php else: ?><span
                                    title="<?php echo lang('mode_status_close'); ?>"
                                    class="icon icon-locked"></span><?php endif; ?></td>
                            <td><?php echo $mode_datas['name']; ?>    </td>
                            <td><?php echo $mode_datas['rank']; ?></td>
                            <td><?php echo $mode_datas['remark'] == null ? '无' : word_limiter($mode_datas['remark'], 38); ?></td>
                            <td>
                                <a
                                    href="<?php echo site_url($this->config->item('admin_folder') . 'mode/form/' . $mode_datas['id']); ?>"
                                    title="<?php echo lang('mode_edit'); ?>"><span
                                        title="<?php echo lang('mode_edit'); ?>"
                                        class="icon  icon-wrench"></span></a>
                                <a
                                    href="javascript:void(0);"
                                    onclick="return show_delete_confirm('<?php echo lang('delete_message'); ?>','<?php echo lang('delete_message_confirm'); ?>', '<?php echo site_url($this->config->item('admin_folder') . 'mode/del/' . $mode_datas['id']); ?>');"
                                    title="<?php echo lang('mode_delete'); ?>"> <span
                                        title="<?php echo lang('mode_delete'); ?>"
                                        class="icon  icon icon-close"></span></a>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="5">
                            <div class="center"><h4>无任何数据</h4></div>
                        </td>
                    </tr>
                <?php endif; ?>
            </table>
            <?php if ($pagination): ?>
                <div class="pagination pagination-centered">
                    <?php echo $pagination; ?>

                </div>
            <?php endif; ?>
        </div>
    </div>
</div>
<!--模块列表结束-->
<?php
echo $this->load->view('footer');
?>
</body>
</html>
