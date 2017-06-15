<?php

if (! defined ( 'DIR_CORE' )) {
    header ( 'Location: static_pages/' );
}
//constants
define('HAC_THEME_PATH', dirname(__FILE__));
//define('HAC_THEME_NAME', basename(dirname(__FILE__)));
$HAC_THEME_NAME = basename(dirname(__FILE__));

include_once(dirname(__FILE__). '/core/ThemeExtension.php');

$controllers = array(
    'storefront' => array(

    ),
    'admin' => array());

$models = array(
    'storefront' => array(),
    'admin' => array());

$templates = array(
    'storefront' => array(
        'blocks/account.tpl',
        'blocks/bestseller.tpl',
        'blocks/bestseller_home.tpl',
        'blocks/bestseller_menu.tpl',
        'blocks/bestseller_home_menu.tpl',
        
        'blocks/breadcrumbs.tpl',
        'blocks/cart.tpl',   
        'blocks/cart_top.tpl',
        'blocks/category.tpl',
        'blocks/category_menu.tpl',
        'blocks/category_bottom.tpl',
        'blocks/category_top.tpl',
        'blocks/category_top_menu.tpl',
        'blocks/category_menu_level3.tpl',
        'blocks/category_multilevel.tpl',
        'blocks/content.tpl',
        'blocks/content_footer.tpl',
        'blocks/content_header.tpl',
        'blocks/coupon_form.tpl',
        'blocks/credit_cards.tpl',
        'blocks/credit_cards_menu.tpl',
        'blocks/currency.tpl',
        'blocks/customer.tpl',
        'blocks/donate.tpl',
        'blocks/featured.tpl',
        'blocks/featured_home.tpl',
        'blocks/featured_menu.tpl',
        'blocks/featured_home_menu.tpl',

        'blocks/google_talk.tpl',

        'blocks/html_block.tpl',
        'blocks/html_block_content.tpl',
        'blocks/html_block_footer.tpl',
        'blocks/html_block_header.tpl',
        #'blocks/html_block/test.tpl',
        'blocks/html__block/home_slider_nivo.tpl',
        'blocks/html__block/home_slider_onebyone.tpl',
        'blocks/html__block/home_slider_touchswipe.tpl',
        'blocks/html__block/logos_slider_slick.tpl',
        'blocks/html__block/service.tpl',
        'blocks/html__block/home-promo.tpl',

        'blocks/language.tpl',
        'blocks/latest.tpl',
        'blocks/latest_home.tpl',

        'blocks/listing_block/popular_brands_content_bottom.tpl',
        'blocks/listing_block_column_left.tpl',
        'blocks/listing_block_column_right.tpl',
        'blocks/listing_block_content_bottom.tpl',
        'blocks/listing_block_content_top.tpl',
        'blocks/listing_block_footer.tpl',
        'blocks/listing_block_footer_top.tpl',
        'blocks/listing_block_header.tpl',
        'blocks/listing_block_header_bottom.tpl',

        'blocks/listing_block/main_categories.tpl', //for me
        'blocks/listing_block/main_categories_promo.tpl',
        'blocks/listing_block/test_6.tpl',
        //banner
        'blocks/banner_block/banner_block_nivoslider.tpl',

        'blocks/manufacturer.tpl',
        
        'blocks/menu.tpl',
        'blocks/menu_bottom.tpl',
        'blocks/menu_top.tpl',
        'blocks/main_menu.tpl',
        'blocks/main_menu_top.tpl',
        'blocks/main_menu_bottom.tpl',

        'blocks/comment.tpl',
        'blocks/comment_facebook.tpl',
        'blocks/comment_gplus.tpl',
        'blocks/comment_disqus.tpl',

        'blocks/newsletter_signup_column_left.tpl',
        'blocks/newsletter_signup_column_right.tpl',
        'blocks/newsletter_signup_content_bottom.tpl',
        'blocks/newsletter_signup_content_top.tpl',
        'blocks/newsletter_signup_footer.tpl',
        'blocks/newsletter_signup_footer_top.tpl',
        'blocks/newsletter_signup_header.tpl',
        'blocks/newsletter_signup_header_bottom.tpl',
        'blocks/order_summary.tpl',
        'blocks/product_list.tpl',
        'blocks/product_list_v1.tpl',
        'blocks/product_list_sidebar.tpl',
        'blocks/search.tpl',
        'blocks/search_bottom.tpl',
        'blocks/search_top.tpl',
        'blocks/special.tpl',
        'blocks/special_home.tpl',
        'blocks/listing_block/products_category_home.tpl',
        'blocks/third_party_login.tpl',
        'blocks/share_buttons.tpl',

        'common/column_left.tpl',
        'common/column_right.tpl',
        'common/content_bottom.tpl',
        'common/content_top.tpl',
        'common/footer.tpl',
        'common/footer_top.tpl',
        'common/head.tpl',
        'common/header.tpl',
        'common/header_bottom.tpl',
        'common/menu.tpl',
        'common/page.tpl',
        'common/page-checkout.tpl', //default checkout page
        'common/page-blog.tpl',
        'common/page-home.tpl',
        'common/page-contact.tpl',
        'common/page-category.tpl',
        'common/page-content.tpl',
        'common/page-product.tpl',
        //'blocks/slideshow2/slideshow2-flexslider.tpl',*/

        'common/resource_image.tpl',
        'common/success.tpl',
        'common/template_debug.tpl',
        'common/unsubscribe.tpl',
        'embed/account/account.tpl',
        'embed/account/address.tpl',
        'embed/account/addresses.tpl',
        'embed/account/create.tpl',
        'embed/account/download.tpl',
        'embed/account/edit.tpl',
        'embed/account/forgotten.tpl',
        'embed/account/history.tpl',
        'embed/account/invoice.tpl',
        'embed/account/login.tpl',
        'embed/account/newsletter.tpl',
        'embed/account/password.tpl',
        'embed/account/subscriber.tpl',
        'embed/account/transactions.tpl',
        'embed/account/wishlist.tpl',
        //'embed/checkout/address.tpl',
        'embed/checkout/cart.tpl',
        'embed/checkout/confirm.buttons.tpl',
        'embed/checkout/confirm.tpl',
        'embed/checkout/guest_step_1.tpl',
        'embed/checkout/guest_step_2.tpl',
        'embed/checkout/payment.buttons.tpl',
        'embed/checkout/payment.tpl',
        'embed/checkout/shipping.buttons.tpl',
        'embed/checkout/shipping.tpl',
        'embed/common/success.tpl',
        'embed/content/contact.tpl',
        'embed/content/content.tpl',
        'embed/error/not_found.tpl',
        'embed/footer.tpl',
        'embed/head.tpl',
        'embed/index/home.tpl',
        'embed/index/maintenance.tpl',
        'embed/js.tpl',
        'embed/js_cart.tpl',
        'embed/js_categories.tpl',
        'embed/js_cookie_check.tpl',
        'embed/js_manufacturers.tpl',
        'embed/js_product.tpl',
        'embed/product/category.tpl',
        'embed/product/manufacturer.tpl',
        'embed/product/product.tpl',
        'embed/product/search.tpl',
        'embed/product/special.tpl',
        'form/button.tpl',
        'form/captcha.tpl',
        'form/checkbox.tpl',
        'form/checkboxgroup.tpl',
        'form/countries_zones.tpl',
        'form/date.tpl',
        'form/file.tpl',
        'form/form.tpl',
        'form/form_close.tpl',
        'form/form_field.tpl',
        'form/form_group.tpl',
        'form/form_no_group.tpl',
        'form/form_open.tpl',
        'form/hidden.tpl',
        'form/input.tpl',
        'form/pagination.tpl',
        'form/radio.tpl',
        'form/rating.tpl',
        'form/recaptcha.tpl',
        'form/selectbox.tpl',
        'form/submit.tpl',
        'form/textarea.tpl',
        'form/phone.tpl',
        'mail/contact.tpl',
        'pages/account/notification.tpl',
        'pages/account/account.tpl',
        'pages/account/address.tpl',
        'pages/account/addresses.tpl',
        'pages/account/create.tpl',
        'pages/account/download.tpl',
        'pages/account/edit.tpl',
        'pages/account/forgotten.tpl',
        'pages/account/history.tpl',
        'pages/account/invoice.tpl',
        'pages/account/login.tpl',
        'pages/account/newsletter.tpl',
        'pages/account/order.tpl',
        'pages/account/password.tpl',
        'pages/account/subscriber.tpl',
        'pages/account/transactions.tpl',
        'pages/account/wishlist.tpl',
        //'pages/checkout/address.tpl',
        'pages/checkout/cart.tpl', //extend this template from vinacart extension
        'pages/checkout/confirm.buttons.tpl',
        //dynamic active when clean_checkout_page is disabled
        'pages/checkout/address.tpl',
        'pages/checkout/confirm.tpl',
        'pages/checkout/guest_step_1.tpl',
        'pages/checkout/guest_step_2.tpl',
        'pages/checkout/payment.buttons.tpl',
        'pages/checkout/payment.tpl',
        'pages/checkout/shipping.buttons.tpl',
        'pages/checkout/shipping.tpl',

        'pages/content/contact.tpl',
        'pages/content/content.tpl',
        'pages/content/sitemap.tpl',
        'pages/error/not_found.tpl',
        'pages/index/home.tpl',
        'pages/index/maintenance.tpl',
        'pages/product/category.tpl',
        'pages/product/manufacturer.tpl',
        'pages/product/product.tpl',
        'pages/product/product_listing.tpl',
        'pages/product/search.tpl',
        'pages/product/special.tpl',
        'pages/product/specials_countdown.tpl',

        'responses/checkout/cart_details.tpl',
        'responses/checkout/no_payment.tpl',
        'responses/content/content.tpl',
        'responses/product/review.tpl',
        'responses/product/quickview.tpl',
        'responses/checkout/add_to_cart_popup.tpl',
        'responses/checkout/quick_basket.tpl',

        //blog_manager
        'pages/blog/comment.tpl',
        'pages/blog/blog.tpl',
       'pages/blog/entry.tpl',
       'pages/blog/archive.tpl',
       'pages/blog/author.tpl',
       'pages/blog/category.tpl',
       'pages/blog/account_register.tpl',
       'pages/blog/account_login.tpl',
       'pages/blog/blog_success.tpl',
       'pages/blog/account_settings.tpl',
       'pages/blog/account_author.tpl',
       'pages/blog/account_forgot.tpl',
       'pages/blog/account_password.tpl',
       'pages/blog/entry_edit.tpl',
       //'pages/blog/blog_search.tpl',
       'pages/blog/blog_list.tpl',
       'pages/blog/blog_list_small.tpl',
       //'blocks/blog_search.tpl',
       //'blocks/blog_search_top.tpl',
       'pages/account/blog_settings.tpl',
       //'blocks/blog_archive.tpl',
       //'blocks/blog_author.tpl',
       //'blocks/blog_feed.tpl',
       'blocks/blog_category.tpl',
       'blocks/blog_popular.tpl',
       'blocks/blog_popular_home.tpl',
       'blocks/blog_latest.tpl',
       'blocks/blog_latest_posts.tpl',
       'blocks/blog_latest_posts_bottom.tpl',
       //'blocks/blog_active.tpl',
       //'blocks/blog_login.tpl',
       //'blocks/blog_top_menu.tpl',
       //products_refined_search
       'pages/product/refined_search.tpl',
        'blocks/refined_search.tpl',
        'blocks/refine_category.tpl',
        'blocks/refine_manufacturer.tpl',
        'blocks/refine_price.tpl',
        'blocks/refine_tag.tpl',
        'blocks/refine_attribute.tpl',

        //viewed_products
        'blocks/viewed_products_sblock.tpl',
        'blocks/viewed_products_cblock.tpl',
        'blocks/viewed_products_tblock.tpl',

        'blocks/offers_bestseller_home.tpl',
        'blocks/offers_featured_home.tpl',
        'blocks/offers_latest_home.tpl',
        'blocks/offers_special_home.tpl',
     ),
    'admin' => array(

    ));

$languages = array(
    'storefront' => array(
        'mytheme/english',
        'mytheme/vietnamese',
    ),
    'admin' => array(
        'mytheme/mytheme',
        'mytheme/mytheme',
    ));

//custom tpl files: use other way
#if(class_exists('HW_Template')) HW_Template::add_custom_templates($templates,__FILE__);