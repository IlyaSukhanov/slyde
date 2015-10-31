<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE stylesheet [<!ENTITY raquo "&#187;">]>

<xsl:stylesheet 
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	extension-element-prefixes="exsl"
	exclude-result-prefixes="exsl"
>
<xsl:output/>


<xsl:template name="index">
	<!--<xsl:param name="galleryName" select="foo"/>-->
	<html>
		<head>
			<title><xsl:value-of select="$galleryName"/></title>
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
			<meta name="viewport" content="width=device-width"/>
			<link rel="stylesheet" href="slyde.css"/>
			<script src="slyde/scripts/jquery-1.10.2.min.js"/>
			<script src="slyde/scripts/sly.min.js"/>
			<script src="slyde/scripts/easing.js"/>
			<script src="slyde/scripts/slyde.js"/>
		</head>
		<body>
			<div class="container">
				<div class="wrap">
					<h1><xsl:value-of select="$galleryName"/></h1>

					<div class="controls">
						<button id="prev"><i class="icon-chevron-left"></i><xsl:value-of select="$i18nPrevious"/></button>
						<button id="next"><xsl:value-of select="$i18nNext"/><i class="icon-chevron-right"></i></button>
					</div>

					<div id='scrollbar' class="scrollbar">
						<div class="handle">
							<div class="mousearea"></div>
						</div>
					</div>

					<div class="frame" id="frame">
						<ul id="items" class="items clearfix">
							<xsl:for-each select="collections/collection">	
								<xsl:variable name="folder" select="fileName"/>
								<xsl:for-each select="image">
									<xsl:sort select="date" order="descending"/>
									<xsl:variable name="filename" select="full/@fileName"/>
									<xsl:variable name="width" select="full/@width"/>
									<xsl:variable name="height" select="full/@height"/>
									<xsl:variable name="id" select="full/@fileName"/>
										<li>
										<div class='image'>
										<h2 class='hide'><a href='#{$id}'><xsl:value-of select="title"/></a></h2>
										<img id='{$id}' class="slyde" data-src="{$folder}/{$filename}"/>
										<noscript><img src="{$folder}/{$filename}"/></noscript>
										<p class='hide'><xsl:value-of select="translate(description,'&#xA;',' ')"/></p>
										</div>
										</li>
									<xsl:if test="not(position() = last())"></xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template name="style">
	<!--<xsl:param name="maxHeight" select="800"/>
	<xsl:param name="maxWidth" select="800"/>-->
	<exsl:document href="slyde.css" method='text'>
body {
    background: #0;
}

h1{
    font-size: 6vh;
    margin-top: 2vh;
    margin-left: 2vh;
    margin-bottom: 1vh;
}
a:link{
	color:lightblue;
}
a:hover{
	color:cornflowerblue;
}
a:visited{
	color:burlywood;
}

.container {
    margin: 0 auto;
}

.wrap {
	position: relative;
	margin: 0;
}
.frame {
	overflow: hidden;
    height: 80vh;
}
.frame ul {
	list-style: none;
	margin: 0;
	padding: 0;
}
.frame ul li {
	float: left;
    height: 80vh;
	margin: 0;
	padding: 0;
	text-align: center;
	cursor: pointer;
}
.frame ul li div {
	/* This height migh seem redundant, but because its possible for
	the div to appear empty it can get collapsed causing havoc with
	sly. Specifying height here ensures it does not get collapsed */
	width: 65vw;
	position: relative;
    height: 80vh;
    vertical-align: middle;
}
.frame ul li div img.slyde {
	max-width: 60vw;
	max-height: 80vh;
	opacity:0.3;
	transition: opacity .5s ease-in-out;
	-moz-transition: opacity .5s ease-in-out;
	-webkit-transition: opacity .5s ease-in-out;
}
.frame ul li.active div img.slyde {
	opacity:1;
	transition: opacity .5s ease-in-out;
	-moz-transition: opacity .5s ease-in-out;
	-webkit-transition: opacity .5s ease-in-out;
}
.frame ul li div:hover .hide{
	display:block;
}
.frame ul li div .hide{
	display:none;
}
.frame ul li div h2{
    position: absolute;
    top: 4vh;
    border-radius: 1vh;
    /*
    left: 10vw;
    */
    padding: 10px;
    color: white;
    font: bold 3vh Sans-Serif;
    background: rgb(0, 0, 0);
    background: rgba(0, 0, 0, 0.7);
}
.frame ul li div p{
    position: absolute;
    border-radius: 1vh;
    bottom: 4vh;
    padding: 10px;
    color: white;
    font: bold 2vh Sans-Serif;
    background: rgb(0, 0, 0);
    background: rgba(0, 0, 0, 0.7);
}

/* Scrollbar */
.scrollbar {
    width: 100%;
	margin: 0;
	height: .5vh;
	background: #ccc;
	line-height: 0;
    margin-bottom: 2vh;
}
.scrollbar .handle {
	width: 100px;
	height: 100%;
	background: #292a33;
	cursor: pointer;
}
.scrollbar .handle .mousearea {
	position: absolute;
	top: -9px;
	left: 0;
	width: 100%;
	height: 20px;
}
/* Controls */
.controls {
    position: absolute;
    top: 0;
    right: 0;
	margin: 0;
    text-align: center;
    border-radius: 1vh;
}

.controls button {
    border-radius: 1vh;
}
	</exsl:document>
</xsl:template>

<xsl:template match="/">
	<xsl:call-template name="style"/>
	<xsl:call-template name="index"/>
</xsl:template>

</xsl:stylesheet>
