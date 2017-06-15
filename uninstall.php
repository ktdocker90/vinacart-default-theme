<?php


if (! defined ( 'DIR_CORE' )) {
header ( 'Location: static_pages/' );
}

$extension_id = basename(dirname(__FILE__));
// delete template layouts
try{
    $layout = new ALayoutManager($extension_id);
    $layout->deleteTemplateLayouts();
    //delete blocks
    #$layout->deleteBlock('html_block');

}catch(AException $e){}
//delete from `settings`
$this->db->query('DELETE FROM `'.$this->db->table('settings').'` WHERE `group`= "'.$extension_id.'"');
$this->db->query('DELETE FROM `'.$this->db->table('extensions').'` WHERE `key`= "'.$extension_id.'"');

//remove custom blocks associate with this theme
$query = $this->db->query('SELECT layout_id, template_id FROM `'. $this->db->table('layouts'). '` WHERE template_id="'.$extension_id.'"');
foreach($query->rows as $row) {
    $row[''];
}
//get block layouts
$sql = "SELECT bl.instance_id,bl.custom_block_id FROM `". $this->db->table('block_layouts'). "` bl
    INNER JOIN `". $this->db->table('layouts'). "` l ON l.layout_id=bl.layout_id
    WHERE l.template_id='". $extension_id ."'";
$query = $this->db->query($sql);
$instance_ids= array();
$custom_block_ids = array();

foreach($query->rows as $row) {
    $instance_ids[] = $row['instance_id'];
    if($row['custom_block_id']) $custom_block_ids[] = $row['custom_block_id'];
}
//delete block layouts
if(count($instance_ids)) {
    $this->db->query("DELETE FROM `". $this->db->table('block_layouts'). "` WHERE instance_id IN (". implode(',', $instance_ids) .")");
}

//delete custom blocks
if(count($custom_block_ids)) {
    $this->db->query("DELETE FROM `". $this->db->table('custom_blocks'). "` WHERE custom_block_id in (". implode(',', $custom_block_ids).")");
}