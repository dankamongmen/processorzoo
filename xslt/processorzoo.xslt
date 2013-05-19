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
		<table>
			<tr>
				<th>Model</th>
				<th>&mu;architecture</th>
			</tr>
<xsl:for-each select="//processor">
	<xsl:sort select="@name" />
	<tr>
		<td><xsl:value-of select="@name"/></td>
		<td><xsl:value-of select="uname/@name"/></td>
	</tr>
</xsl:for-each>
		</table>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
