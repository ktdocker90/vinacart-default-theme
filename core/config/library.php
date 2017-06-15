<?php
return array(
    'ui/bootstrap' => array(
        'styles' => array(
            'bootstrap.min.css' => array(
                'file' => 'bootstrap.min.css',
                'required' => 1
            )
        )
    ),
    'menu/smartmenus' => array(
        'scripts'=> array(
            'jquery.smartmenus.min.js'=> array(
                'file'=> 'jquery.smartmenus.min.js',
                'required'=> 1,
                'bottom'=> 1
            ),
            'jquery.smartmenus.bootstrap.js'=> array(
                'file' => 'addons/bootstrap/jquery.smartmenus.bootstrap.min.js',
                'required'=> 1,
                'bottom'=> 1
            )
        ),
        'styles'=> array(
            'sm-core-css.css'=> array(
                'file'=> 'css/sm-core-css.css',
                'required'=> 1
            ),
            'jquery.smartmenus.bootstrap.css' => array(
                'file'=> 'addons/bootstrap/jquery.smartmenus.bootstrap.css',
                'required'=> 1
            ),
            'sm-blue.css'=> array(
                'file'=> 'css/sm-blue/sm-blue.css',
                'required'=> 0
            ),
            'sm-clean.css' => array(
                'file'=> 'css/sm-clean/sm-clean.css',
                'required'=> 1
            ),
            'sm-mint' => array(
                'file'=> 'css/sm-mint/sm-mint.css',
                'required'=> 0
            ),
            'sm-simple' => array(
                'file'=> 'css/sm-simple/sm-simple.css',
                'required'=> 0
            )
        )
    ),
    'menu/meanmenu' => array(
        'scripts'=> array(
            'jquery.meanmenu.min.js' => array(
                'file' => 'jquery.meanmenu.min.js',
                'bottom' => 1
            )
        ),
        'styles' => array(
            'meanmenu.min.css' => array(
                'file' => 'meanmenu.min.css',
                'bottom' => 1
            )
        )
    ),
    'carousel/owl' => array(
        'scripts'=> array(
            'owl.carousel.min.js' => array(
                'file' => 'owl.carousel.min.js',
                'bottom'=> 1
            )
        ),
        'styles' => array(
            'owl.carousel.css' => array(
                'file' => 'css/owl.carousel.css'
            ),
            'owl.theme.css' => array(
                'file' => 'css/owl.theme.css'
            ),
            'owl.transitions.css' => array(
                'file' => 'css/owl.transitions.css'
            ),

        )
    ),
    'animation/wow' => array(
        'scripts'=> array(
            'wow.min.js' => array(
                'file' => 'wow.min.js',
                'bottom'=> 1
            )
        )
    ),
    'zoom/cloud-zoom' => array(
        'scripts'=> array(
            'cloud-zoom.js' => array(
                'file'=> 'cloud-zoom.js'
            )
        ),
        'styles'=> array(

        )
    ),
    'sliders/custom_flexslider'=> array(
        'scripts'=> array(
            'jquery.flexslider.js' => array(
                'file' => 'jquery.flexslider.js'
            )
        ),
        'styles' => array(
            'flexslider.css' => array(
                'file' => 'flexslider.css'
            )
        )
    )
);