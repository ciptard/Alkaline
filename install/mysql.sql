CREATE TABLE `cities` (`city_id` int(10) unsigned NOT NULL, `city_name` varchar(200) NOT NULL, `city_state` varchar(20) default NULL, `country_code` char(2) NOT NULL, `city_name_raw` varchar(200) default NULL, `city_name_alt` varchar(4000) default NULL, `city_pop` int(10) unsigned default NULL, `city_lat` decimal(10,7) default NULL, `city_long` decimal(10,7) default NULL, `city_class` char(1) default NULL, `city_code` varchar(10) default NULL, PRIMARY KEY (`city_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `comments` (`comment_id` smallint(5) unsigned NOT NULL auto_increment, `photo_id` mediumint(8) unsigned NOT NULL, `user_id` smallint(5) unsigned default NULL, `comment_created` datetime default NULL, `comment_status` tinyint(4) default NULL, `comment_text` text, `comment_text_raw` text, `comment_author_name` varchar(64) default NULL, `comment_author_url` varchar(255) default NULL, `comment_author_email` varchar(255) default NULL, `comment_author_ip` varchar(23) default NULL, `comment_author_avatar` varchar(255) default NULL, PRIMARY KEY (`comment_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `countries` (`country_id` tinyint(3) unsigned NOT NULL auto_increment, `country_code` char(2) NOT NULL, `country_name` tinytext NOT NULL, PRIMARY KEY (`country_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `exifs` (`exif_id` int(10) unsigned NOT NULL auto_increment, `photo_id` mediumint(8) unsigned NOT NULL, `exif_key` tinytext NOT NULL, `exif_name` tinytext NOT NULL, `exif_value` blob NOT NULL, PRIMARY KEY (`exif_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `extensions` (`extension_id` smallint(5) unsigned NOT NULL auto_increment, `extension_uid` varchar(40) default NULL, `extension_class` varchar(32) default NULL, `extension_title` varchar(255) NOT NULL, `extension_status` tinyint(4) default NULL, `extension_build` smallint(5) unsigned default NULL, `extension_version` varchar(10) default NULL, `extension_hooks` text, `extension_preferences` text, `extension_folder` varchar(255) default NULL, `extension_file` varchar(255) default NULL, `extension_description` varchar(255) default NULL, `extension_creator` varchar(255) default NULL, `extension_creator_url` varchar(255) default NULL, PRIMARY KEY (`extension_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `guests` (`guest_id` smallint(5) unsigned NOT NULL auto_increment, `guest_title` varchar(255) NOT NULL, `guest_key` varchar(40) default NULL, `guest_piles` text, `guest_last_login` datetime default NULL, `guest_created` datetime default NULL, `guest_views` int(10) unsigned default NULL, PRIMARY KEY (`guest_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `links` (`link_id` int(10) unsigned NOT NULL auto_increment, `photo_id` mediumint(8) unsigned NOT NULL, `tag_id` mediumint(8) unsigned NOT NULL, PRIMARY KEY (`link_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `pages` (`page_id` smallint(5) unsigned NOT NULL auto_increment, `page_title` varchar(255) NOT NULL, `page_title_url` varchar(255) default NULL, `page_text` mediumtext, `page_text_raw` mediumtext, `page_markup` varchar(255) default NULL, `page_photos` text, `page_views` int(10) unsigned default NULL, `page_words` int(10) unsigned default NULL, `page_created` datetime default NULL, `page_modified` datetime default NULL, PRIMARY KEY (`page_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `photos` (`photo_id` mediumint(8) unsigned NOT NULL auto_increment, `user_id` smallint(5) unsigned default NULL, `right_id` tinyint(3) unsigned default NULL, `photo_ext` varchar(4) NOT NULL, `photo_mime` varchar(16) NOT NULL, `photo_title` varchar(255) default NULL, `photo_description` text, `photo_description_raw` text, `photo_privacy` tinyint(4) default NULL, `photo_name` varchar(255) default NULL, `photo_colors` varchar(255) default NULL, `photo_color_r` tinyint(3) unsigned default NULL, `photo_color_g` tinyint(3) unsigned default NULL, `photo_color_b` tinyint(3) unsigned default NULL, `photo_color_h` smallint(5) unsigned default NULL, `photo_color_s` tinyint(3) unsigned default NULL, `photo_color_l` tinyint(3) unsigned default NULL, `photo_taken` datetime default NULL, `photo_uploaded` datetime default NULL, `photo_published` datetime default NULL, `photo_updated` datetime default NULL, `photo_geo` tinytext, `photo_geo_lat` decimal(10,7) default NULL, `photo_geo_long` decimal(10,7) default NULL, `photo_views` int(10) unsigned default NULL, `photo_comment_count` smallint(5) unsigned default NULL, `photo_height` smallint(5) unsigned default NULL, `photo_width` smallint(5) unsigned default NULL, PRIMARY KEY (`photo_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `piles` (`pile_id` smallint(5) unsigned NOT NULL auto_increment, `pile_title` varchar(255) NOT NULL, `pile_title_url` varchar(255) default NULL, `pile_type` varchar(255) default NULL, `pile_description` text, `pile_photos` text, `pile_views` int(10) unsigned default NULL, `pile_photo_count` smallint(5) unsigned default NULL, `pile_call` text, `pile_modified` datetime default NULL, `pile_created` datetime default NULL, PRIMARY KEY (`pile_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `rights` (`right_id` tinyint(3) unsigned NOT NULL auto_increment, `right_title` varchar(255) NOT NULL, `right_default` tinyint(3) unsigned default NULL, `right_url` varchar(255) default NULL, `right_image` varchar(255) default NULL, `right_description` text, `right_modified` datetime default NULL, `right_photo_count` int(10) unsigned default NULL, PRIMARY KEY (`right_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `sizes` (`size_id` tinyint(3) unsigned NOT NULL auto_increment, `size_title` varchar(255) NOT NULL, `size_label` varchar(255) NOT NULL, `size_height` smallint(5) unsigned NOT NULL, `size_width` smallint(5) unsigned NOT NULL, `size_type` varchar(5) NOT NULL, `size_append` varchar(16) default NULL, `size_prepend` varchar(16) default NULL, PRIMARY KEY (`size_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `stats` (`stat_id` int(10) unsigned NOT NULL auto_increment, `stat_session` varchar(26) NOT NULL, `stat_date` datetime NOT NULL, `stat_duration` smallint(5) unsigned NOT NULL, `stat_referrer` varchar(255) default NULL, `stat_page` varchar(255) default NULL, `stat_page_type` varchar(255) default NULL, `stat_local` tinyint(3) unsigned NOT NULL, `user_id` smallint(5) unsigned default NULL, `guest_id` smallint(5) unsigned default NULL, PRIMARY KEY (`stat_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `tags` (`tag_id` mediumint(8) unsigned NOT NULL auto_increment, `tag_name` varchar(255) NOT NULL, PRIMARY KEY (`tag_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `themes` (`theme_id` tinyint(3) unsigned NOT NULL auto_increment, `theme_uid` varchar(40) default NULL, `theme_title` varchar(255) NOT NULL, `theme_default` tinyint(4) default NULL, `theme_build` smallint(5) unsigned default NULL, `theme_version` varchar(10) default NULL, `theme_folder` varchar(255) default NULL, `theme_creator` varchar(255) default NULL, `theme_creator_url` varchar(255) default NULL, PRIMARY KEY (`theme_id`)) DEFAULT CHARSET=utf8;
CREATE TABLE `users` (`user_id` smallint(5) unsigned NOT NULL auto_increment, `user_user` varchar(32) NOT NULL, `user_pass` varchar(40) NOT NULL, `user_key` varchar(40) default NULL, `user_name` varchar(64) default NULL, `user_email` varchar(255) default NULL, `user_last_login` datetime default NULL, `user_created` datetime default NULL, `user_permissions` text, `user_preferences` text, `user_photo_count` mediumint(8) unsigned default NULL, PRIMARY KEY (`user_id`)) DEFAULT CHARSET=utf8;