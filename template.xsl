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

<xsl:template name="jsonList">
	<exsl:document href="list.json" method='text'>
	{"images":[
			<xsl:for-each select="collections/collection">	
				<xsl:variable name="folder" select="fileName"/>
				<xsl:for-each select="image">
					{
						"filename":"<xsl:value-of select="$folder"/>/<xsl:value-of select="full/@fileName"/>",
						"title":"<xsl:value-of select="title"/>",
						"description":"<xsl:value-of select="translate(description,'&#xA;',' ')"/>",
						"width":"<xsl:value-of select="full/@width"/>",
						"height":"<xsl:value-of select="full/@height"/>",
						"date":"<xsl:value-of select="date"/>"
					}
					<xsl:if test="not(position() = last())">,</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		]}
	</exsl:document>
</xsl:template>

<xsl:template name="index">
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
					<div id='scrollbar' class="scrollbar">
						<div class="handle">
							<div class="mousearea"></div>
						</div>
					</div>

					<div class="frame" id="frame">
						<ul id="items" class="items clearfix">
						</ul>
					</div>

					<div class="controls center">
						<button id="prev"><i class="icon-chevron-left"></i><xsl:value-of select="$i18nPrevious"/></button>
						<button id="next"><xsl:value-of select="$i18nNext"/><i class="icon-chevron-right"></i></button>
					</div>
				</div>
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template name="style">
	<exsl:document href="slyde.css" method='text'>
body { background: #0; }
.container { margin: 0 auto; }

.wrap {
	position: relative;
	margin: 3em 0;
}

.frame {
	height: 800px;
	line-height: 800px;
	overflow: hidden;
}
.frame ul {
	list-style: none;
	margin: 0;
	padding: 0;
}
.frame ul li {
	float: left;
	width: 1280;
	margin: 0 1px 0 0;
	padding: 0;
	background: #0;
	color: #0;
	text-align: center;
	cursor: pointer;
}
.frame ul li div {
	position: relative;
}
.frame ul li div img {
	width: auto;
	height: 800px;
}
.frame ul li div:hover .hide{
	display:block;
}
.frame ul li div .hide{
	display:none;
}
.frame ul li div h2{                                                                           
    position: absolute;                                                                        
    top: 10%;                                                                                  
    left:10%;                                                                                  
    padding: 10px;                                                                             
    color: white;                                                                              
    font: bold 24px Sans-Serif;                                                                
    background: rgb(0, 0, 0);                                                                  
    background: rgba(0, 0, 0, 0.7);                                                            
}                                                                                              
.frame ul li div p{                                                                            
    position: absolute;                                                                        
    bottom: 10%;                                                                               
    padding: 10px;                                                                             
    color: white;                                                                              
    font: bold 18px Sans-Serif;                                                                
    background: rgb(0, 0, 0);                                                                  
    background: rgba(0, 0, 0, 0.7);                                                            
}  

/* Scrollbar */
.scrollbar {
	margin: 0 0 1em 0;
	height: 2px;
	background: #ccc;
	line-height: 0;
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
	margin: 25px 0; text-align: center;
}
	</exsl:document>
</xsl:template>

<xsl:template match="/">
	<xsl:call-template name="jsonList"/>
	<xsl:call-template name="style"/>
	<xsl:call-template name="index"/>
</xsl:template>

</xsl:stylesheet>
