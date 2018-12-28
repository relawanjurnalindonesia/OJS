<?php

/**
 * @file plugins/themes/mpg/customSiteThemePlugin.inc.php
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class customSiteThemePlugin
 * @ingroup plugins_themes_custom_site
 *
 * @brief "mpg" theme plugin
 */

import('classes.plugins.ThemePlugin');

class customSiteThemePlugin extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'customSiteThemePlugin';
	}

	function getDisplayName() {
		return 'RJI Custom Site Theme';
	}

	function getDescription() {
		return 'rji layout';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}

	function activate(&$templateMgr) {
		$templateMgr->template_dir[0] = Core::getBaseDir() 
										. DIRECTORY_SEPARATOR 
										. 'plugins' 
										. DIRECTORY_SEPARATOR 
										. 'themes' 
										. DIRECTORY_SEPARATOR 
										. 'customSite' 
										. DIRECTORY_SEPARATOR 
										. 'templates';   
											      
		$templateMgr->compile_id = 'customSiteTheme';
	}
}

?>
