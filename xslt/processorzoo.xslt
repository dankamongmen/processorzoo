<!DOCTYPE stylesheet [
  <!ENTITY % w3centities-f PUBLIC "-//W3C//ENTITIES Combined Set//EN//XML"
      "http://www.w3.org/2003/entities/2007/w3centities-f.ent">
  %w3centities-f;
]>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
	<head>
		<title>The Processor Zoo</title>
	</head>
	<body>
		<table border="1">
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
		</table>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
