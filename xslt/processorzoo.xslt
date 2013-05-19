<!DOCTYPE stylesheet [
  <!ENTITY % w3centities-f PUBLIC "-//W3C//ENTITIES Combined Set//EN//XML"
      "http://www.w3.org/2003/entities/2007/w3centities-f.ent">
  %w3centities-f;
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="time" select="'ARGH'"/>
<xsl:output method="html" indent="yes"/>
<xsl:template match="/">
<html>
	<head>
		<title>The Processor Zoo</title>
		<style type="text/css" media="screen">
			html { color: #000; background: #fff; max-width: 800px; }
			a:link { color: royalpurple; }
			a:visited { color: darkgreen; }
			table { background: #000; }
			tr { background: #fff; }
			th { background: #ccc; }
			.family { text-transform: capitalize; }
			.main { text-align: justify; }
			.run { font-weight: bold; }
			a.uarchlink:link {color: darkgreen;}
			a.uarchlink:visited {color: darkgreen;}
		</style>
		<script type="text/javascript">
<!--
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-28599323-1']);
_gaq.push(['_setDomainName', 'sprezzos.com']);
_gaq.push(['_trackPageview']);
(function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
//-->
		</script>
	</head>
	<body>
		<h3><a href="https://nick-black.com">nick black</a> presents&hellip;</h3>
		<center><h1>THE PROCESSOR ZOO</h1></center>
		<div class="main">
The Processor Zoo aims to be as complete and thorough as possible an Open
Source <a href="http://www.w3.org/XML/Core/#Publications">XML</a>
database of microprocessors. It also contains
<a href="http://relaxng.org/#specs">RELAX-NG</a> schemata for validating
the input, <a href="http://www.w3.org/TR/xpath/">XPATH1</a> tools for querying
the database, and <a href="http://www.w3.org/TR/xslt">XSLT</a> tools for
transforming this data. Later, an open source library will be built combining
this information with runtime architecture detection to provide a complete,
portable hardware modeling interface suitable for compiler authors and
programmers concerned with system-specific performance.<br/>
<br/>
The Processor Zoo is version controlled and archived at
<a href="https://github.com/dankamongmen/processorzoo.git">GitHub</a>,
and corrections or new data can be provided via pull requests.
Alternatively, send patches against the current git tree
to <a href="mailto:dank@qemfd.net">me</a>.
		</div>
		<br/>
		<table border="1">
			<tr><td class="run" colspan="6" bgcolor="lightblue">the processors</td></tr>
			<tr>
				<th class="family">Family</th>
				<th>Model</th>
				<th>&mu;architecture</th>
				<th>Base ALU (Hz)</th>
				<th>Max TDP (W)</th>
				<th>Die (mm&sup2;)</th>
			</tr>
<xsl:for-each select="//codename/processor">
<xsl:sort select="../@name" />
<xsl:sort select="@name" />
<tr>
	<td class="family">
		<!--<xsl:attribute name="rowspan">
			<xsl:value-of select="count(/processor)"/>
		</xsl:attribute>-->
		<xsl:value-of select="../@name"/>
	</td>
	<td><xsl:value-of select="@name"/></td>
	<td><a class="uarchlink">
		<xsl:attribute name="href">#
			<xsl:value-of select="core/@uarch"/>
		</xsl:attribute>
		<xsl:value-of select="core/@uarch"/>
	</a></td>
	<td><xsl:value-of select='format-number(basehz, "#")' /></td>
	<td><xsl:value-of select="tdp"/></td>
	<td><xsl:value-of select="die/area"/></td>
</tr>
</xsl:for-each>
			<tr><td class="run" colspan="6" bgcolor="lightgreen">the &mu;architectures</td></tr>
			<tr>
				<th class="family">Family</th>
				<th>Codename</th>
				<th>SMT</th>
				<th>ISA(s)</th>
				<th>Cache(s)</th>
				<th>TLB(s)</th>
			</tr>
<xsl:for-each select="//uarchfam/uarch">
<xsl:sort select="../@name" />
<xsl:sort select="@name" />
<tr>
	<td class="family">
		<a name="@name">
			<xsl:value-of select="../@name"/>
		</a>
	</td>
	<td><xsl:value-of select="@name"/></td>
	<td>
	<xsl:choose>
		<xsl:when test="smt"><xsl:value-of select="smt"/></xsl:when>
		<xsl:otherwise>1</xsl:otherwise>
	</xsl:choose>
	</td>
	<td>
<xsl:for-each select="isa">
	<xsl:value-of select="@name"/>
	<xsl:choose>
		<xsl:when test="position() &lt; last()">, </xsl:when>
		<xsl:otherwise/>
	</xsl:choose>
</xsl:for-each>
	</td>
	<td></td>
	<td></td>
</tr>
</xsl:for-each>
		</table>
		Generated with
		<a href="https://github.com/dankamongmen/processorzoo/raw/master/xslt/processorzoo.xslt">processorzoo.xslt</a>
		at <xsl:value-of select="$time"/>.<br/>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
