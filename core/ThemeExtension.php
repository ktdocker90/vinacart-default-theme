<?php
/**
 * Class ExtensionMytheme
 * @category Extension
 */
if(class_exists('HW_Extension')) :
class ExtensionMytheme extends HW_Extension {

    /**
     * @var HW_Template
     */
    protected $theme;

    /**
     * @var
     */
    private $user;

    public function __construct() {
        parent::__construct();

        //load additional library for this theme
        $js_libs = $this->get_config_data('library');
        if(is_array($js_libs))
        foreach($js_libs as $name => $data) {
            HW_Libraries::register($name, $data);
        }
    }
    private function isCurrentTheme() {
        return $this->config->get('config_storefront_template')=== $this->getCurrentExtensionName();
    }
    //frontend hook
    /*public function onControllerPagesIndexHome_InitData($method) {
        #$this->registry->set('template', 'home');
    }*/

    /**
     * @param $method
     */
    public function onControllerCommonPage_InitData($method) {
        //$this->baseObject->_load->library('helper/vinacart'); //deprecated

        $this->user = $this->baseObject->user ;
        //init controller data
        HW_Template::init($this, $this->baseObject, $this->registry);   //for both storefront & admin
        //allow custom templates in admin at design/blocks/edit|insert
        if(!$this->is_admin(1) && $this->isCurrentTheme()) {
            /*$lang = $this->baseObject->language->language_details['filename'];    //@deprecated do in core/vinacart.php
            $this->baseObject->loadLanguage('_'. $lang);*/
            $theme_name = basename(dirname(dirname(__FILE__)));
            $this->theme = HW_Template::get_theme($theme_name);   //initialized
            if($this->theme && $this->getCurrentExtensionName()== $this->theme->get('theme_name')) {
                $this->theme->set('extension', $this);
                $this->theme->add_custom_templates();
            }

        }

    }

    /**
     * page layout template switching
     * @param $method
     */
    public function onControllerCommonPage_UpdateData($method) {
        if($this->is_admin(1) ) return ;
        if($this->theme) {
            if($this->theme->get('loaded_asset')) return ;
            $this->theme->set('loaded_asset', 1);
        }

        #$this->registry->set('a1','A');
        $is_current = $this->theme && $this->theme->isCurrentTheme($this);

        #HW::_print($this->baseObject->loadModel('')->rewrite('?rt=content/content&content_id=1'));
        //note make sure to add script before get it, because this hook call before add child common/footer
        if( !$this->is_admin() && $is_current) {
            //custom block template in different page
            if($this->theme) $this->theme->blocks_template_include();
            //$hook = $this->get_hooks('common/page', true);
            //$generic_pages = $this->hw->extension->get_rt_settings('common/page', 'generic_pages'); //hw_extensionObject()
            //$rt = trim($this->baseObject->request->get['rt'], '/');

            //if(!in_array($rt, $generic_pages) && !is_page('tool/develop_theme/configuration')) {    //!$hook || !$hook->is_genericPages()
                $this->theme->load_assets();
            //}

        }

        //redirect template
        if($is_current) $this->theme->template_include();
    }

    /**
     * @param $method
     */
    /*public function beforeControllerPagesIndexHome_InitData($method) {
        #$t=new ExtensionTest();
        #$this->ExtensionsApi->hw_InitData($t);
    }*/

    /**
     * @param $method
     */
    /*public function onControllerCommonHead_UpdateData($method) {

    }*/

    /**
     * @param $method
     */
    /*public function onControllerCommonHead_InitData($method) {
        #$this->baseObject->document->addScriptBottom();
        #$filename = DIR_EXT . str_replace('../', '', $this->request->get['extension']) . '/config.xml';
        #HW::_print($this->baseObject->config->get('config_url') );
        $this->theme->load_assets();
    }*/
    //language hook
    /*public function onALanguageLoad($block, $mode) {

    }*/

}
    //class_alias('ExtensionMytheme', HW_Extension::rt2name('Extension/'.ucfirst($HAC_THEME_NAME)));
    else:
        echo 'Please install/enable <a href="https://marketplace.abantecart.com/vinacart"><strong>vinacart</strong></a> extension.';
        die;
endif;