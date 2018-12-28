{**
 * templates/index/site.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 * bassed on UIN SGD OJS home site (http://journal.uinsgd.ac.id/)
 * thanks to Aldy Riady
 * Forked dan customized by Anwar Dani (custom.relawanjurnal.id)
 * Site index.
 *
 *}
{strip}
{if $siteTitle}
	{assign var="pageTitleTranslated" value=$siteTitle}
{/if}
{include file="common/header-site.tpl"}
{/strip}

<div class="row" id="main-content">
<a name="journals"></a>
	{assign var=noj value=1}
	{iterate from=journals item=journal}
		<span style="display:none">{$noj}</span>

		<div class="col-md-4 col-sm-6 col-xs-12 journals">
			<div class="ro">
			<div class="col-sm-6 col-xs-6">
						<div class="cover">
								<a href="{url journal=$journal->getPath()}"  class="thumbnail">
                {if $site->getSetting('showThumbnail')}
                  {assign var="displayJournalThumbnail" value=$journal->getLocalizedSetting('journalThumbnail')}
                  {if $displayJournalThumbnail && is_array($displayJournalThumbnail)}
									    <img src="{$journalFilesPath}{$journal->getId()}/{$displayJournalThumbnail.uploadName|escape:"url"}" {if $altText != ''}alt="{$altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
								  {else}
									    <img src="{$baseUrl}/plugins/themes/customSite/css/no-cover.jpg" alt="Cover not ready at this time">
                  {/if}
								{/if}
								</a>
						</div>
										</div>
			<div class="col-sm-6 col-xs-6" style="overflow:hidden">
				<div style="height: 70px">
					<h4 style="padding: 0;margin: 0;font-size: 1.12em;color: #555">
					{if $site->getSetting('showTitle')}
						{$journal->getLocalizedTitle()|escape}
					{/if}
					</h4>
				</div>

				<p>
				<a href="{url journal=$journal->getPath()}" class="act btn btn-info"><span class="fa fa-folder-open"></span> View Journal</a>
				<a href="https://journal.uinsgd.ac.id/index.php/ijni/issue/current" class="act btn btn-info"><span class="fa fa-archive"></span> Current Issue</a>
				<a href="javascript:void(0)" class="act btn btn-info" data-toggle="modal" data-target="#myModal{$noj}"><span class="fa fa-file-text-o"></span> Description</a>
			</div>
			</div>
		</div>

		  <!-- Modal -->
	  <div class="modal fade" id="myModal{$noj}" role="dialog">
		<div class="modal-dialog">

		  <!-- Modal content-->
		  <div class="modal-content">
			<div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			  <h4 class="modal-title">Description</h4>
			</div>
			<div class="modal-body">
        {if $site->getSetting('showDescription')}
      		{if $journal->getLocalizedDescription()}
      			<div class="journalDescription" id="journalDescription-{$journal->getId()|escape}">
      				{$journal->getLocalizedDescription()|nl2br}
      			</div>
      		{/if}
      	{/if}
			</div>
		  </div>

		</div>
	  </div>
	  {assign var=noj value=$noj+1}
	{/iterate}

</div>


{if $journals->wasEmpty()}
	{translate key="site.noJournals"}
{/if}

{include file="common/footer-site.tpl"}
