<?php

if (! defined ( 'DIR_CORE' )) {
    header ( 'Location: static_pages/' );
}

if(!in_array('vinacart', $this->extensions->getEnabledExtensions())) {
    $this->session->data['error'] = "Require <strong>VNC Theme Framework</strong> extension. Download <a href='https://marketplace.abantecart.com/vinacart' target='_blank'>here</a>.";
    redirect($this->html->getSecureURL('extension/extensions/extensions'));
}
if(!in_array('developer_tools', $this->extensions->getEnabledExtensions())) {
    $this->session->data['error'] = basename(__DIR__). " require developer_tools extension during import data";
    redirect($this->html->getSecureURL('extension/extensions/extensions'));
}
if(!class_exists('HW_Template') /*&& defined('HAC_EXT_PATH')*/) require_once (DIR_EXT. '/vinacart/core/autoload.php');
//else die('Error! not found vinacart extension.');
//theme name
$HAC_THEME_NAME = basename(dirname(__FILE__));
$theme_inst = HW_Template::get_theme($HAC_THEME_NAME);
$registry = Registry::getInstance();

$this->load->model('vnc/utils/ini');
$this->load->model('vnc/tool/backup');
$this->load->model('tool/developer_tools');

$meta_file  = dirname(__FILE__). '/theme.ini';
//$theme_data = dirname(__FILE__). '/data/theme_data.sql';    //replace with blocks.xml & layout.xml

/**
 * project developer tool
 */
//create new project for this template
$extension = array(
    'extension_type' => 'template',
    'extension_txt_id' => $HAC_THEME_NAME,
    'extension_title' => $HAC_THEME_NAME,
    'header_comment' => "<?php


if (! defined ( 'DIR_CORE' )) {
header ( 'Location: static_pages/' );
}",
    'route' => '',
    'languages' => array(
        'admin' => array('english/'.$HAC_THEME_NAME. '/'. $HAC_THEME_NAME)
    ),
    'install_php' => 0,
    'install_sql' => '0',
    'help_note' => '',
    'help_url' => '',
    'icon_default' => '0',
    'version' => '1.0.0',
    'category' => 'template',
    'cartversions' => array('1.2'),
    'priority' => '10',
    'views' => array('storefront' =>array()),
    //'override_exist_extension' => false
);
if($this->model_tool_developer_tools) $this->model_tool_developer_tools->saveProjectXml($extension);  //save to DIR_EXT\developer_tools\projects/

/*$dev_project_xml = 'dev_tools_project_'.$HAC_THEME_NAME. '_v1.0.0.xml';
if(!file_exists(DIR_EXT. '/developer_tools/projects/'. $dev_project_xml)) {
    copy(dirname(__FILE__). '/'. $dev_project_xml, DIR_EXT. '/developer_tools/projects/');
}*/

//append to settings table
$exist_setting = $this->db->query('SELECT * FROM `'.$this->db->table('settings').'` WHERE `group`="'.$HAC_THEME_NAME.'"');
if(!$exist_setting->num_rows) {
    $sql = 'INSERT INTO `'.$this->db->table('settings').'` (`group`, `key`, `value`) VALUES
    ("'.$HAC_THEME_NAME.'", "'.$HAC_THEME_NAME.'_status", "1"),
    ("'.$HAC_THEME_NAME.'", "'.$HAC_THEME_NAME.'_layout", ""),
    ("'.$HAC_THEME_NAME.'", "'.$HAC_THEME_NAME.'_priority", "0"),
    ("'.$HAC_THEME_NAME.'", "'.$HAC_THEME_NAME.'_date_installed", now()),
    ("'.$HAC_THEME_NAME.'", "'.$HAC_THEME_NAME.'_refresh_data", "0"),
    ("'.$HAC_THEME_NAME.'", "'.$HAC_THEME_NAME.'_sort_order", ""),
    ("'.$HAC_THEME_NAME.'", "store_id", 0);
    ';
    $this->db->query($sql);
}
//register new extension
$exist_ext = $this->db->query('SELECT * FROM `'.$this->db->table('extensions').'` WHERE `key`="'.$HAC_THEME_NAME.'"');
if(!$exist_ext->num_rows) {
    $this->db->query("INSERT INTO ".$this->db->table('extensions')."
    (`type`, `key`, `category`, `status`, `priority`, `version`, `license_key`, `date_installed`, `date_added`, `date_modified`)
    VALUES('template','$HAC_THEME_NAME','template','1','10','".HAC_VERSION."','',now(),now(),now())");
}

//### update template icon
$icons = array($HAC_THEME_NAME.'_logo' => 'icon.png');
$language_list = $this->model_localisation_language->getLanguages();
$rm = new AResourceManager();
$rm->setType('image');

foreach($icons as $k => $icon_name){
    //copy file into RL-directory from extension directory
    $result = copy(DIR_EXT.$HAC_THEME_NAME.'/image/'.$icon_name, DIR_RESOURCE.'image/'.$icon_name);

    $resource = array( 'language_id' => $this->config->get('storefront_language_id'),
        'name' => array(),
        'title' => $HAC_THEME_NAME,
        'description' => 'images of '.$HAC_THEME_NAME.' set extension',
        'resource_path' => $icon_name,
        'resource_code' => '');

    foreach($language_list as $lang){
        $resource['name'][$lang['language_id']] = $icon_name;
    }
    $resource_id = $rm->addResource($resource);

    if ( $resource_id ) {
        // $extension_id - known id from parent method "install" of extension manager
        $rm->mapResource('extensions', $extension_id, $resource_id);
        // get hexpath of resource (RL moved given file from rl-image-directory in own dir tree)
        $resource_info = $rm->getResource($resource_id, $this->config->get('admin_language_id'));
        // write it path in settings (array from parent method "install" of extension manager)
        $settings[$k] =  'image/'.$resource_info['resource_path'];

        $registry->get('db')->query("UPDATE " . DB_PREFIX . "settings SET `value` = '" . $settings[$k] . "' WHERE `key` = '" . $k . "' ");
    }
}


/*load layout wxr
//$layout = new ALayoutManager($HAC_THEME_NAME);  //don't because new theme has no layouts
$layout = new ALayoutManager();


//$file = dirname(__FILE__) . '/layout.xml';
//$file = DIR_EXT . str_replace('../', '', (string)$config->id) . '/data/layout.xml';
*/
$this->model_vnc_tool_backup->import_theme_data_xml($theme_inst);


//custom my blocks, no nerver build layout for this template
//HW_Template::custom_blocks(__FILE__, $layout);

//HW_Template::save_custom_page_layout();
//file_put_contents(DIR_ROOT.'/system/logs/1.txt', 'sad');

//create new block
/*
$block_home_icon = array(
    'block_txt_id' => 'html_block', //should't override html_block
    #'block_name' => 'home-icon',   //wrong
    'controller' => 'blocks/html_block',
    'templates' => array(
        array(
            'parent_block_txt_id' => 'header',
            'template' => 'blocks/html_block.tpl',
        ),
        array(
            'parent_block_txt_id' => 'header_bottom',
            'template' => 'blocks/html_block_header.tpl',
        ),
        array(
            'parent_block_txt_id' => 'column_left',
            'template' => 'blocks/html_block.tpl',
        ),
        array(
            'parent_block_txt_id' => 'column_right',
            'template' => 'blocks/html_block.tpl',
        ),
        array(
            'parent_block_txt_id' => 'content_top',
            'template' => 'blocks/html_block.tpl',
        ),
        array(
            'parent_block_txt_id' => 'content_bottom',
            'template' => 'blocks/html_block_content.tpl',
        ),
        array(
            'parent_block_txt_id' => 'footer_top',
            'template' => 'blocks/html_block.tpl',
        ),
        array(
            'parent_block_txt_id' => 'footer',
            'template' => 'blocks/html_block_footer.tpl',
        ),

    ),
);
$layout->saveBlock( $block_home_icon );
*/

//no, template setting form not load install.php, see: hooks/design/template.php
/*if(!empty($this->request->post[$HAC_THEME_NAME.'_refresh_data'])) {
    $this->model_vnc_tool_backup->import_theme_data($theme_inst); //if new theme own layouts , replace with new one
}*/

