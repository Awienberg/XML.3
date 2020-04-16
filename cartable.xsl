<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml"
				indent="yes"
				omit-xml-declaration="no"
	            doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
      <html>
        <head>
		    <title>Cars</title>
			  <meta charset="utf-8"/>
			    <style>
            body {
              margin: 50px;
              background-color: #f7f7f7;
              color: #202020;
              font: 14px 'Lucida Grande', Helvetica, Arial, sans-serif;
            }
            h1 {
              text-align: center;
              padding-bottom: 20px;
            }
            table {
              border-collapse: collapse;
              margin: 0 auto;
              background: #ffffff;
              margin: 0 auto;
              overflow: hidden;
            }
            .tablehead {
              background-color: #202020;
              color: #ffffff;
            }
            .tablebody {
              background-color: #ffffff;
              border-bottom: 1px solid #f2f2f2;
            }
            .tablebody:hover {
              background-color: #f2f2f2;
            }
            table,
            td,
            th {
              padding: 15px;
              text-align: left;
            }
            #buyback {
              text-align: center;
            }   
			    </style>
		  </head>
      <body> 
            <h1>Cars</h1> 
            <table> 
                <tr class="tablehead"> 
                    <th>Manufactorer</th> 
                    <th>Model</th> 
                    <th>Year</th> 
                    <th>KMs</th> 
                    <th>Color</th>
                    <th>Price</th>
                    <th>Buyback</th>  
                </tr> 
				
                <xsl:for-each select="cars/car">
                <xsl:sort select="@manufacturer"/>
                    <tr class="tablebody">
                        <td><xsl:value-of select="@manufacturer"/></td>
                        <td><xsl:value-of select="@model"/></td>
                        <td><xsl:value-of select="@year"/></td>
                        <td><xsl:value-of select="meter"/></td>
                        <td><xsl:attribute name="bgcolor"><xsl:value-of select="color"/></xsl:attribute></td>
                        <td><xsl:value-of select="price"/></td>
                        <td id="buyback">
                            <xsl:choose>
                                <xsl:when test="dealersecurity[@buyback='yes']">&#10003;</xsl:when>
                                <xsl:when test="dealersecurity[@buyback='no']">&#10005;</xsl:when>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:for-each>
            </table> 
        </body> 
      </html> 
   </xsl:template>  
</xsl:stylesheet>
            
