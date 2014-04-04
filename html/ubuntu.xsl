<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:exsl="http://exslt.org/common"
                xmlns:set="http://exslt.org/sets"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="html set"
                extension-element-prefixes="exsl"
                version="1.0">

<xsl:param name="mal.if.platform" select="'platform:unity'"/>

<xsl:param name="color.gray_background" select="'#f7f6f5'"/>
<xsl:param name="color.gray_border" select="'#ccc1c1'"/>
<xsl:param name="color.blue_background" select="'#f7f6f5'"/>
<xsl:param name="color.blue_border" select="'#ccc1c1'"/>
<xsl:param name="color.yellow_background" select="'#f7f6f5'"/>
<xsl:param name="color.yellow_border" select="'#ccc1c1'"/>
<xsl:param name="color.red_background" select="'#f7f6f5'"/>
<xsl:param name="color.red_border" select="'#ccc1c1'"/>

<xsl:param name="color.text" select="'#333333'"/>
<xsl:param name="color.text_light" select="'#333333'"/>
<xsl:param name="color.link" select="'#dd4814'"/>
<xsl:param name="color.link_visited" select="'#dd4814'"/>

<!--  It seems that many color definitions above were done to force the resulting html to mimic
      the light-moin-theme, but they also broke some other things.
      So also added back, below, some realistic color definitions for possible override use in some cases.
      (Note: These defintions are the same as the Ubuntu ServerGuide and any changes should be
      made to both, for consistency. -->

<xsl:param name="color.gray_background_actually" select="'#e5e5e5'"/>
<xsl:param name="color.gray_border_actually" select="'#aaaaaa'"/>
<xsl:param name="color.blue_background_actually" select="'#bebeff'"/>
<xsl:param name="color.blue_border_actually" select="'#5050ff'"/>
<xsl:param name="color.yellow_background_actually" select="'#ffff6e'"/>
<xsl:param name="color.yellow_border_actually" select="'#ffff00'"/>
<xsl:param name="color.red_background_actually" select="'#ffbebe'"/>
<xsl:param name="color.red_border_actually" select="'#ff5050'"/>

<xsl:param name="color.text_light_actually" select="'#808080'"/>

<xsl:template name="html.css.custom">
  <xsl:param name="node" select="."/>
  <xsl:param name="direction">
    <xsl:call-template name="l10n.direction"/>
  </xsl:param>
  <xsl:param name="left">
    <xsl:call-template name="l10n.align.start">
      <xsl:with-param name="direction" select="$direction"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="right">
    <xsl:call-template name="l10n.align.end">
      <xsl:with-param name="direction" select="$direction"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:text>

/* Based on light-moin-theme from https://code.launchpad.net/ubuntu-website/light-moin-theme 
   Some tweaks and adaptation for xsl by Matthew East for Ubuntu Documentation Team
   ubuntu-doc@lists.ubuntu.com */

/* Don't forget to set a foreground and background color
 on the 'html' or 'body' element! */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dd, dl, dt, li, ol, ul, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    margin: 0;
    padding: 0;
    border: 0;
    font-weight: inherit;
    font-style: inherit;
    font-size: 100%;
    line-height: 1.5;
    font-family: inherit;
    text-align: left;
    vertical-align: baseline;
}

/* span.key is not defined in the yelp html.xsl, but it should be. Define it here because it is required. */
span.key {
  font-weight: bold;
}

/* overide the yelp html.xsl here. Why? Because the definition of text_light is wrong above, but fixing it breaks a multitude of other things. */
span.gui, span.guiseq { color: </xsl:text>
  <xsl:value-of select="$color.text_light_actually"/><xsl:text>; }

/* overide some of the yelp html.xsl here. Why? Because the definition of gray stuff wrong above, but fixing it breaks a multitude of other things. */
kbd {
  background-color: </xsl:text>
    <xsl:value-of select="$color.gray_background_actually"/><xsl:text>;
  border: solid 1px </xsl:text>
    <xsl:value-of select="$color.gray_border_actually"/><xsl:text>;
  -moz-box-shadow: 1px 1px 1px </xsl:text>
    <xsl:value-of select="$color.gray_border_actually"/><xsl:text>;
  -webkit-box-shadow: 1px 1px 1px </xsl:text>
    <xsl:value-of select="$color.gray_border_actually"/><xsl:text>;
  box-shadow: 1px 1px 1px </xsl:text>
    <xsl:value-of select="$color.gray_border_actually"/><xsl:text>;
}

a img, :link img, :visited img {
    border: 0;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}

ol, ul {
    list-style: none;
}

q:before, q:after, blockquote:before, blockquote:after {
    content: "";
}

/* moin specific overrides go below */
.clear { clear: both; }
#fullsearch { display: none; }

body {
    background-image: url("img/bg_dotted.png");
}

#main-menu a {
    padding: 24px 8px;
}

#search-box {
    margin-left: 650px;
    -moz-border-radius: 0px 0px 4px 4px;
    -webkit-border-bottom-left-radius: 4px;
    -webkit-border-bottom-right-radius: 4px;
    -moz-box-shadow: #bbb 0px 0px 2px;
    -webkit-box-shadow: #bbb 0px 0px 2px;
    background-color: #F2F2F2;
    width: 290px;
    height: 33px;
    padding: 7px 0 0 10px;
}

#search-box #searchinput {
    float: left;
    width: 172px;
    height: 20px;
    margin: 8px 0 0 8px;
    padding: 3px 0 1px 4px;
    font-size: 11px;
    border: 1px solid #ccc;
}
#search-box #titlesearch {
    float: left;
    background: url("img/search_button_sprite.png") transparent;
    width: 24px;
    height: 24px;
    margin: 8px 0 0 8px;
    padding: 0;
    border: none;
    cursor: pointer;
	text-indent: 50px;
}

#search-box button span {
    position: absolute;
    overflow: hidden;
    text-indent: -9999px;
}

#subheader ul {
	display: inline;
	float: left;
}
#title span {
	color: #333;
}

/* fix TOC styles */
#cwt-content table li {
    margin-left: 1.5em;
    line-height: 18px;
}
#cwt-content table ol {
    list-style-type: decimal;
}

/* fix wiki styles */
#cwt-content pre {
    line-height: 16px;
    margin-bottom: 8px;
}
#cwt-content h1 {
    margin-bottom: 8px;
}

#cwt-content dt {
    font-weight: bold;
    margin-top: 10px;
}
#cwt-content dt, #cwt-content dd {
    line-height: 18px;
    font-size: 14px;
}

#footer {
	margin: 0;
	font-size: 90%;
	color: #444;
}

/* edit form */
#editor-textarea {
    width: 100%;
    font-size: 14px;
    padding: 4px;
}
#cwt-content input[type=text] {
    width: 100%;
}

/* moin's msg dialog */
#message {
    padding: 16px;
    margin: 8px 0;
    border: 20px #F1F1ED solid;
    font-size: 14px;
    background-color: white;
}
#message p {
    font-size: 14px;
    font-weight: bold;
}

/* tables need a little spacing */
#cwt-content td, #cwt-content th {
    margin: 1px;
    padding: 4px;
}
#cwt-content td, #cwt-content th {
    border: 1px solid #E9E9E9;
}
#cwt-content ol, #cwt-content ul, #cwt-content dl {
    margin-bottom: 8px;
    list-style-type: decimal;
}
#cwt-content li, #cwt-content dd, #cwt-content dt {
    line-height: 14px;
}
#cwt-content ol li {
    margin-left: 18px;
}
#cwt-content tt {
    font-family: monospace;
}

body {
    font-family: "Ubuntu", "Ubuntu Beta", "Bitstream Vera Sans", DejaVu Sans, Tahoma, sans-serif;
    color: #333;
    background: white url(img/bg_dotted.png);
    font-size: 13px;
    line-height: 1.5;
    margin: 0px;
    padding: 0px;
}
#container {
    background: #f7f6f5;
    margin: 0px auto 20px;
    padding: 0px;
    width: 976px;
}
#container-inner {
    background-color: #fff;
}
#header, #container-inner {
    -moz-border-radius: 0px 0px 5px 5px;
    -webkit-border-bottom-left-radius: 5px;
    -webkit-border-bottom-right-radius: 5px;
    -moz-box-shadow: #bbb 0px 0px 5px;
    -webkit-box-shadow: #bbb 0px 0px 5px;
}
#header {
    background: #dd4814 url(img/header_bg.png) top left repeat-x;
    height: 64px;
    margin: 0px;
    padding: 0px;
    position: relative;
}

#mothership ul {
    margin: 0;
    padding: 0;
    list-style-type: none;
    height: 20px;
}

#mothership li {
    float: right;
    padding: 3px 0;
    margin: 0 16px 0 0;
    font-size: 10px;
    line-height: 14px;
}

#mothership a {
    color: #333;
}

#menu-search {
    height: 40px;
    margin: 0 16px;
}

#cwt-content {
    width: 850px;
    padding: 16px 40px 16px 40px;
    margin: 0 16px 16px;
    background-color: #ffffff;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
}

#end-content {
    clear: both;
}

.box-944 {
    background: #ffffff;
    width: 944px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
}
.box-304 {
    background: #ffffff;
    width: 304px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
}
.box-624 {
    background: #ffffff;
    width: 304px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
}

.content-box {
    width: 912px;
    padding: 16px;
}

#ubuntu-header {
    background-image: url(img/header_logo.png);
    background-repeat: no-repeat;
    height: 32px;
    right: 16px;
    margin: 0;
    padding: 0;
    position: absolute;
    top: 16px;
    width: 292px;
    overflow: hidden;
    text-indent: -9999px;
}

#ubuntu-header a {
    display: block;
    height: 100%;
    width: 100%;
}

#footer {
    padding-top: 16px;
}

#footer p {
    margin: 0;
    padding-bottom: 16px;
    border-bottom: 1px dotted #aea79f;
    text-align: center;
}

#main-menu {
    list-style: none;
    margin: 0;
    margin-left: 16px;
    padding: 0;
    height: 100%;
    background: url(img/topnav_divider.png) no-repeat scroll left top transparent !important;
}
#main-menu li {
    float: left;
    margin: 0;
    padding: 0;
    height: 64px;
    font-size: 14px;
    line-height: 16px;
    background: url(img/topnav_divider.png) no-repeat scroll right top transparent !important;
}
#main-menu a {
    display: block;
    float: left;
    margin: 0;
    padding: 24px 8px;
    text-decoration: none;
    color: #fff;
    text-shadow: #000 0px 1px;
}

.main-menu-item.current,
#main-menu a:hover, #main-menu a.active {
    background: url(img/topnav_active_bg.png) no-repeat right top transparent !important;
}

h1, h2, h3, h4, h5 {
    color: #333;
    padding: 0;
    margin: 0;
    font-weight: normal;
    margin-top: 1em;
}
h1 {
    font-size: 28px;
    line-height: 32px;
    margin-top: 0em;
}
h2 {
    font-size: 24px;
    line-height: 28px;
    margin-bottom: 8px;
}
h3 {
    font-size: 16px;
    line-height: 20px;
    margin-bottom: 8px;
}
h3.link-other {
    color: #333;
}
h3.link-services {
    color: #fff;
}
h4 {
    font-size: 12px;
    line-height: 14px;
}
h4.link-news {
    color: #ef5a29;
}
h4.link-ubuntu {
    color: #dd4814;
}
h4.partners {
    color: #333;
    font-size: 16px;
    line-height: 20px;
}
h5 {
    color: #333;
    font-size: 10px;
    line-height: 14px;
}
p {
    font-size: 13px;
    line-height: 1.5;
    margin-bottom: 8px;
}
pre {
    background-color:#F3F3F3;
    border:1px dashed #C1B496;
    font-family:UbuntuMono,courier,monospace;
    padding:4pt;
    white-space:pre-wrap;
    word-wrap:break-word;
}
tt {
    font-family:UbuntuMono,courier,monospace;
}

strong {
    font-weight: bold;
}

a {
    color: #DD4814;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

ul {
    margin-bottom: 16px;
}
ul li {
    margin-left: 2.4em;
    margin-bottom: 8px;
    line-height: 14px;
}
ul li:last-child {
    margin-bottom: 0px;
}

p.call-to-action {
    color: #333;
}
p.case-study {
    color: #333;
}
p.highlight {
    font-size: 16px;
    line-height: 20px;
}
p.introduction {
    color: #333;
    font-size: 16px;
    line-height: 20px;
}
p.services {
    color: #fff;
}
#pageinfo {
    font-size: 70%;
    padding: 0 16px 12px;
    text-align: right;
}
p.small-text {
    color: #333;
    font-size: 10px;
}

.newsfeed {
    background: url(img/news_feed_bg.png) no-repeat scroll right top transparent;
    padding: 0 20px 0 0;
}

/* Clearing floats without extra markup
Based on How To Clear Floats Without Structural Markup by PiE
[http://www.positioniseverything.net/easyclearing.html] */
.clearfix:after {
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
}
.clearfix {
    display: inline-block;
}  /* for IE/Mac */

div.trail {
  font-size: 100%;
  text-indent: -1em;
  color: #aea79f;
}

/* Form related styling */
input, select {
    /* Override mozilla's default form css inherited from the system */
    font-size: 100%;
}
.wForm form label {
    display: block;
    padding-bottom: 3px;
    color: black;
}
.wForm form input[type=text],
.wForm form input[type=password],
.wForm form textarea {
    border: 1px solid #c7c7c7;
    padding: 2px;
    color: black;
    background: #fff;
}
.wForm form input[type=text]:focus,
.wForm form input[type=password]:focus,
.wForm form textarea:focus {
    border: 1px solid #dd4814;
    outline: 1px solid #dd4814;
}
/* Override FormAssembly formatting */
.wFormContainer {
    padding: 0;
    width: 100%;
}
.wForm form {
    margin: 0;
}
.wForm form .actions {
    text-align: right;
}
.wForm form .actions .primaryAction {
    background-color: #dd4814;
    color: #fff;
    border: 0;
    cursor: pointer;
    font-weight: normal;
    font-size: 16px;
    padding: 4px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    text-shadow: #333 0px 1px;
    margin: 10px 8px 10px 8px;
}
.wForm form input[type=text].errFld {
    border: 2px solid #dd4814;
}
.wForm form .errMsg {
    color: #dd4814 !important;
}
.wForm form .oneChoice {
    display: block;
}
.wForm form .oneField {
    padding: 0 8px;
    margin-bottom: 8px;
}
.wForm form span.reqMark {
    color: #dd4814 !important;
    font-weight: bold !important;
}
.wForm fieldset {
    border: none;
    padding: 0;
    background: #dfdcd9;
}
.wForm input[type=text],
.wForm input[type=password],
.wForm select,
.wForm textarea {
    width: 290px;
}
.wForm legend {
    padding: 8px;
    font-size: 16px;
    font-weight: normal !important;
    background: #aea79f;
    width: 100%;
    color: #fff;
    margin-bottom: 8px;
}
.wForm label.preField,
.wForm .labelsLeftAligned label.preField,
.wForm .labelsRightAligned label.preField  {
    float: none;
    padding-bottom: 4px;
}
.wForm label.postField {
    display: inline;
}
/* Hack for WebKit based browsers to display the fieldset properly */
@media screen and (-webkit-min-device-pixel-ratio:0) {
    .wForm fieldset {
        padding: 8px 8px .1px 0px;
    }
    .wForm legend {
        padding: 8px 0px 8px 8px;
    }
}

</xsl:text>
</xsl:template>

<xsl:template name="html.page">
  <xsl:param name="node" select="."/>
  <html>
    <head>
      <title>
        <xsl:apply-templates mode="html.title.mode" select="$node"/>
      </title>
      <xsl:call-template name="html.css"/>
      <xsl:call-template name="html.js"/>
      <xsl:call-template name="html.head.custom"/>
    </head>
    <body id="home">

      <xsl:apply-templates mode="html.body.attr.mode" select="$node"/>
      <script src="https://ssl.google-analytics.com/urchin.js"
      type="text/javascript"></script>
      <script type="text/javascript">
      _uacct = "UA-1018242-8";
      urchinTracker();
      </script>


    <div id="leftbanner">
    </div>
    <div id="rightbanner">
    </div>
    <div id="container">
        <div id="container-inner">
	    <div id="mothership">
		<ul>
	            <li><a href="http://www.ubuntu.com/partners">Partners</a> </li>
        	    <li><a href="http://www.ubuntu.com/support">Support</a></li>
        	    <li><a href="http://www.ubuntu.com/community">Community</a></li>
        	    <li><a href="http://www.ubuntu.com">Ubuntu.com</a></li>
	        </ul>
	    </div>
            <div id="header">
                <h1 id="ubuntu-header"><a href="https://help.ubuntu.com/">Ubuntu Documentation</a></h1>
                <ul id="main-menu">
                    <li><a class="main-menu-item current" href="https://help.ubuntu.com/">Official Documentation</a></li>
                    <li><a href="https://help.ubuntu.com/community">Community Help Wiki</a></li>
                </ul>
            </div>
            <div id="menu-search">
                <div id="subheader"> 
                    <div class="subheader-menu"> 
                    </div> 
                </div>
                <div id="search-box">
		<noscript>
		<form action="https://www.google.com/cse" id="cse-search-box">
		    <div>
		     <input type="hidden" name="cx" value="003883529982892832976:e2vwumte3fq" />
 		    <input type="hidden" name="ie" value="UTF-8" />
 		    <input type="text" name="q" size="21" />
 		    <input type="submit" name="sa" value="Search" />
 		    </div>
		</form>
		</noscript>

		<script>
		 document.write('<form action="https://help.ubuntu.com/search.html" id="cse-search-box">');
		 document.write('  <div>');
		 document.write('    <input type="hidden" name="cof" value="FORID:9" />');
		 document.write('    <input type="hidden" name="cx" value="003883529982892832976:e2vwumte3fq" />');
		 document.write('    <input type="hidden" name="ie" value="UTF-8" />');
		 document.write('    <input type="text" name="q" size="21" />');
		 document.write('    <input type="submit" name="sa" value="Search" />');
		 document.write('  </div>');
		 document.write('</form>');
		</script>
		</div>
            </div>
        <xsl:apply-templates mode="html.header.mode" select="$node"/>
        <div id="cwt-content" class="clearfix content-area">
	    <div id="page">
	        <div id="content">
		    <xsl:apply-templates mode="html.body.mode" select="$node"/>
		</div>
		<div id="pagebottom">
		</div>
	    </div>
        </div>
    </div>
    <div id="footer">
	<p>The material in this document is available under a free license, see <a href="/legal.html">Legal</a> for details<br /> For information on contributing see the <a href="https://wiki.ubuntu.com/DocumentationTeam">Ubuntu Documentation Team wiki page</a>. To report errors in this documentation, <a href="https://bugs.launchpad.net/ubuntu/+source/ubuntu-docs">file a bug</a>.</p>
	<p>关于 Ubuntu Kylin 相关文档的缺陷请提交到 <a href="https://bugs.launchpad.net/ubuntu/+source/ubuntu-docs">Ubuntu Kylin 主页</a>。</p>
    </div>
    </div>

  <!-- IE6 hacks -->
  <!--[if IE 6 ]>
          <script src="js/pngFix.js"></script>
          <script> DD_belatedPNG.fix('.png'); </script>
  <![endif]-->
</body>
</html>

</xsl:template>

<xsl:template name="mal2html.page.linktrails.trail.prefix">
  <xsl:param name="node" select="."/>
  <a href="https://help.ubuntu.com/14.04" class="trail">Ubuntu 14.04</a>
  <xsl:variable name="direction">
    <xsl:call-template name="l10n.direction"/>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$direction = 'rtl'">
      <xsl:text>&#x00A0;« </xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>&#x00A0;» </xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
