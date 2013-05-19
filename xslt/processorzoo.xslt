<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
	<head>
		<title>The Processor Zoo</title>
	</head>
	<body>
		<table>
<xsl:for-each select="//processor">
	<xsl:sort select="@name" />
	<tr>
		<td>
			<xsl:value-of select="@name"/>
		</td>
	</tr>
</xsl:for-each>
		</table>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
