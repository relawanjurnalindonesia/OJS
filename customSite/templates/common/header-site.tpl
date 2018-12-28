{**
 * header.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 * bassed on UIN SGD OJS home site (http://journal.uinsgd.ac.id/)
 * thanks to Aldy Riady
 * Forked dan customized by Anwar Dani (custom.relawanjurnal.id)
 * Common site header.
 *}
{strip}
{translate|assign:"applicationName" key="common.openJournalSystems"}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}
	{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
	{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}
{/strip}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<title>{$pageTitleTranslated}</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="description" content="{$metaSearchDescription|escape}" />
	<meta name="keywords" content="{$metaSearchKeywords|escape}" />
	<meta name="generator" content="{$applicationName} {$currentVersionString|escape}" />
	{$metaCustomHeaders}
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/customSite/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/customSite/css/sitestyle.css" type="text/css" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<script type="text/javascript" src="{$baseUrl}/plugins/themes/customSite/js/jquery.min.js"></script>

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}
</head>

<body id="body-site">

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="{url page="index"}"><i class="fa fa-home"></i> {translate key="navigation.home"}</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
		<li id="about"><a href="{url page="about"}"><i class="fa fa-info-circle"></i> {translate key="navigation.about"}</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">

		{if $isUserLoggedIn}
			<li id="userHome"><a href="{url journal="index" page="user"}"><i class="fa fa-home"></i> {translate key="navigation.userHome"}</a></li>
		{else}
			<li id="login"><a href="{url page="login"}"><i class="fa fa-unlock-alt"></i> {translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
				<li id="register"><a href="{url page="user" op="register"}"><i class="fa fa-file-text-o "></i> {translate key="navigation.register"}</a></li>
			{/if}
		{/if}{* $isUserLoggedIn *}

		{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="search" op="categories"}"><i class="fa fa-folder-open-o"></i> {translate key="navigation.categories"}</a></li>
		{/if}{* $categoriesEnabled *}

		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="search"><a href="{url page="search"}"><i class="fa fa-search"></i> {translate key="navigation.search"}</a></li>
		{/if}

		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="current"><a href="{url page="issue" op="current"}"><i class="fa fa-files-o"></i> {translate key="navigation.current"}</a></li>
			<li id="archives"><a href="{url page="issue" op="archive"}"><i class="fa fa-file-archive-o"></i> {translate key="navigation.archives"}</a></li>
		{/if}

		{if $enableAnnouncements}
			<li id="announcements"><a href="{url page="announcement"}"><i class="fa fa-bullhorn"></i> {translate key="announcement.announcements"}</a></li>
		{/if}{* enableAnnouncements *}

      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><div class="container header-container">

	<div id="header">
		<div id="headerTitle">
			<h1>
				{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
					<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
				{/if}
				{if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
					<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
				{elseif $displayPageHeaderTitle}
					{$displayPageHeaderTitle}
				{elseif $alternatePageHeader}
					{$alternatePageHeader}
				{elseif $siteTitle}
					{$siteTitle}
				{else}
					{$applicationName}
				{/if}
			</h1>
			<h4>{$displayPageHeaderTitleAltText}</h4>
		</div>
	</div>
</div><!-- container -->

<div class="container">
