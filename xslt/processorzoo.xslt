<!DOCTYPE stylesheet [
  <!ENTITY % w3centities-f PUBLIC "-//W3C//ENTITIES Combined Set//EN//XML"
      "http://www.w3.org/2003/entities/2007/w3centities-f.ent">
  %w3centities-f;
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="time" select="'ARGH'"/>
<xsl:output method="html" indent="yes"/>
<xsl:template match="/">
<html lang="en" xml:lang="en" xmlns:fb="http://ogp.me/ns/fb#">
	<head>
		<title>The Processor Zoo</title>
		<style type="text/css" media="screen">
			html { color: #000; background: #fff; }
			a:link { color: royalpurple; }
			a:visited { color: darkgreen; }
			table { background: #000; }
			tr { background: #fff; }
			th { background: #ccc; }
			.bus { text-transform: uppercase; }
			.family { text-transform: capitalize; }
			.main { text-align: justify; max-width: 800px; }
			.run { font-weight: bold; }
			.g-plusone { float: left; }
			a.uarchlink:link {color: darkgreen;}
			a.uarchlink:visited {color: darkgreen;}
		</style>
		<link rel="publisher" href="https://plus.google.com/118052647816244613292" />
		<meta property="fb:admins" content="690107717" />
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
		<div class="main">
		<h3><a href="https://nick-black.com">nick black</a> presents&hellip;</h3>
		<center><h1>THE PROCESSOR ZOO</h1></center>
		<div class="bigcount">
		<center><b>Currently showing <xsl:value-of select="count(//processor)"/>
		processors and
		<xsl:value-of select="count(//uarch)"/>
		&mu;architectures.
		</b></center>
		</div>
		<br/>
The Processor Zoo aims to be as complete and thorough as possible an open
source <a href="http://www.w3.org/XML/Core/#Publications">XML</a>
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
Alternatively, send <a href="mailto:dank@qemfd.net">me</a>
patches against the current git tree. Please provide appropriate citations
with data.
		</div>
		<br/>
     <div class="blogrec">
      <div class="g-plusone" data-annotation="inline"></div>
      <script type="text/javascript">
(function() {
var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
po.src = 'https://apis.google.com/js/plusone.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
      </script>
      <fb:like style="float: left;" href="http://nick-black.com/processorzoo.html" send="false" width="450" show_faces="false" font="verdana"></fb:like>
      <div id="fb-root"></div>
      <script>
(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
	</script>

	</div>
		<br/>
		<table border="1">
			<tr><td class="run" colspan="14" bgcolor="lightblue">the processors</td></tr>
			<tr>
				<th class="family">Family</th>
				<th>Model</th>
				<th>&mu;architecture</th>
				<th>Address bits</th>
				<th>Base ALU (Hz)</th>
				<th>Max TDP (W)</th>
				<th>Die (mm&sup2;)</th>
				<th>Max feature (nm)</th>
				<th>Technology</th>
				<th>Transistors</th>
				<th>Package(s)</th>
				<th>Voltage</th>
				<th>Cache(s)</th>
				<th>Bus(es)</th>
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
		<xsl:choose>
			<xsl:when test="product">&nbsp;<xsl:value-of select="product"/></xsl:when>
		</xsl:choose>
	</td>
	<td><xsl:value-of select="@name"/></td>
	<td><a class="uarchlink">
		<xsl:attribute name="href">#
			<xsl:value-of select="core/@uarch"/>
		</xsl:attribute>
		<xsl:value-of select="core/@uarch"/>
	</a></td>
	<td><xsl:value-of select="addrbits"/></td>
	<td><xsl:value-of select='format-number(basehz, "#")' /></td>
	<td><xsl:value-of select="tdp"/></td>
	<td><xsl:value-of select="die/area"/></td>
	<td><xsl:value-of select="die/process"/></td>
	<td><xsl:value-of select="die/tech"/></td>
	<td>
		<xsl:choose>
			<xsl:when test="die/transistors"><xsl:value-of select='format-number(die/transistors,"#")'/></xsl:when>
		</xsl:choose>
	</td>
	<td><xsl:value-of select="die/package"/></td>
	<td><xsl:value-of select="die/volts"/></td>
	<td>
	<xsl:for-each select="cache">
		<xsl:sort select="l" />
		L<xsl:value-of select="l"/> (<xsl:value-of select="b"/>B)
	</xsl:for-each>
	</td>
	<td>
	<xsl:for-each select="bus">
		<xsl:sort select="@type" />
		<xsl:choose>
			<xsl:when test="b"><xsl:value-of select="b * 8"/>b </xsl:when>
		</xsl:choose>
		<span class="bus"><xsl:value-of select="@type"/></span>
		<xsl:choose>
			<xsl:when test="x">x<xsl:value-of select="x"/></xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="clock"> @</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="clock/mult"><xsl:value-of select="clock/mult"/>x</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="clock/basehz">
				<xsl:value-of select='format-number(clock/basehz, "#")' />Hz
			</xsl:when>
		</xsl:choose>
	</xsl:for-each>
	</td>
</tr>
</xsl:for-each>
			<tr><td class="run" colspan="14" bgcolor="lightgreen">the &mu;architectures</td></tr>
			<tr>
				<th class="family">Family</th>
				<th>Codename</th>
				<th>SMT</th>
				<th>ISA(s)</th>
				<th>Cache(s)</th>
				<th>TLB(s)</th>
				<th>Pipeline(s)</th>
				<th>Peak issue</th>
				<th>Peak retire</th>
				<th>ROB entries</th>
				<th>Phys. Regs</th>
				<th>Reservations</th>
				<th>Load bufs</th>
				<th>Store bufs</th>
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
	<xsl:sort select="@name"/>
	<xsl:value-of select="@name"/>
	<xsl:choose>
		<xsl:when test="position() &lt; last()">, </xsl:when>
		<xsl:otherwise/>
	</xsl:choose>
</xsl:for-each>
	</td>
	<td>
	<xsl:for-each select="cache">
		<xsl:sort select="l" />
		L<xsl:value-of select="l"/> (<xsl:value-of select="b"/>B)
	</xsl:for-each>
	</td>
	<td>
		<!-- handle TLBS fixme -->
	</td>
	<td>
		<xsl:value-of select="pipeline"/>
	</td>
	<td>
		<xsl:value-of select="peakissue"/>
	</td>
	<td>
		<xsl:value-of select="peakretire"/>
	</td>
	<td>
		<xsl:value-of select="rob"/>
	</td>
	<td>
		<xsl:value-of select="physregs"/>
	</td>
	<td>
		<xsl:value-of select="reservations"/>
	</td>
	<td>
		<xsl:value-of select="loadbufs"/>
	</td>
	<td>
		<xsl:value-of select="storebufs"/>
	</td>
</tr>
</xsl:for-each>
		</table>
		<hr/>
		<div class="license">
			<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/us/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/us/88x31.png" /></a><br/><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">The Processor Zoo</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Nick Black</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/us/deed.en_US">Creative Commons Attribution-ShareAlike 3.0 United States License</a>.
		</div>
		<div class="coda">
		Generated with
		<a href="https://github.com/dankamongmen/processorzoo/raw/master/xslt/processorzoo.xslt">processorzoo.xslt</a>
		at <xsl:value-of select="$time"/>. Copyright &copy; 2013 Nick Black.<br/>
		</div>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
