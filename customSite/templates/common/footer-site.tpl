{**
 * templates/common/footer.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 * bassed on UIN SGD OJS home site (http://journal.uinsgd.ac.id/)
 * thanks to Aldy Riady
 * Forked dan customized by Anwar Dani (custom.relawanjurnal.id)
 * Common site footer.
 *
 *}

	<script type="text/javascript" src="{$baseUrl}/plugins/themes/customSite/js/bootstrap.min.js"></script>

    </div>
</div>

    <div class="container-fluid">
        <div class="row footer-content">
			{$intro}
        </div>
        <div class="clearfix"></div>
        <div class="row copy_right" style="">
           <span>Copyright  &copy; {'Y'|date} <b>{$pageTitleTranslated}</b> - Powered by <a href="https://pkp.sfu.ca/ojs/" target="_blank">Public Knowledge Project OJS</a> - supported by <a href="http://custom.relawanjurnal.id/" target="_blank">RJI Custom Theme</a></span>
        </div>
    </div>

{call_hook name="Templates::Common::Footer::PageFooter"}

</div>

</body>
</html>
