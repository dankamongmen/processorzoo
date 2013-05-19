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
			html { color: #000; background: #eee; max-width: 800px; }
			a:link { color: royalpurple; }
			a:visited { color: darkgreen; }
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
		<h1>Nick Black's Processor Zoo</h1>
		The Processor Zoo aims to be as complete and thorough as
		possible an Open Source database of microprocessors. It also
		contains <a href="http://relaxng.org/#specs">RELAX-NG</a>
		schemata for validating the input <a href="http://www.w3.org/XML/Core/#Publications">XML</a>,
		<a href="http://www.w3.org/TR/xpath/">XPATH1</a> tools for
		querying the XML database, and <a href="http://www.w3.org/TR/xslt">XSLT</a>
		tools for transforming this data.<br/>
		<br/>
		The Processor Zoo is version controlled and archived at
		<a href="https://github.com/dankamongmen/processorzoo.git">GitHub</a>,
		and corrections or new data can be provided via pull requests.
		Alternatively, send patches against the current git tree
		to <a href="mailto:dank@qemfd.net">me</a>.<br/>
		<br/>
		This output was generated using
		<a href="https://github.com/dankamongmen/processorzoo/raw/master/xslt/processorzoo.xslt">processorzoo.xslt</a>
		on <xsl:value-of select="$time"/>.<br/>
		<br/>
		<table border="1">
			<tr bgcolor="lightblue"><td colspan="7"><b>the processors</b></td></tr>
			<tr>
				<th>Codename</th>
				<th>Model</th>
				<th>&mu;architecture</th>
				<th>Base ALU clock (Hz)</th>
				<th>Max TDP (W)</th>
				<th>Die (mm&sup2;)</th>
			</tr>
<xsl:for-each select="//codename/processor">
<xsl:sort select="../@name" />
<tr>
	<td>
		<!--<xsl:attribute name="rowspan">
			<xsl:value-of select="count(/processor)"/>
		</xsl:attribute>-->
		<xsl:value-of select="../@name"/>
	</td>
	<td><xsl:value-of select="@name"/></td>
	<td><xsl:value-of select="core/@uarch"/></td>
	<td><xsl:value-of select='format-number(basehz, "#")' /></td>
	<td><xsl:value-of select="tdp"/></td>
	<td><xsl:value-of select="die/area"/></td>
</tr>
</xsl:for-each>
			<tr bgcolor="lightgreen"><td colspan="7"><b>the &mu;architectures</b></td></tr>
		</table>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
