<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Listado Movies</title>
      </head>
      <body>
        <h2>
          <b>LISTADO MOVIES:</b>
        </h2>
        <ol>
          <xsl:for-each select="movies/movie">
            <li>
              <p>
                <b> Titulo: <a href="#">
                    <xsl:value-of select="title" />
                  </a>
                </b>
                <br />
                <b>Director:</b>
                <xsl:value-of select="director" />
                <br />
                <b>Productor:</b>
                <xsl:choose>
                  <xsl:when test="producer/name">
                    <xsl:value-of select="producer/name" /> 
										<xsl:value-of select="producer/surname" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:for-each select="producer">
                      <xsl:value-of select="." />
											<xsl:if test="position() != last()">, </xsl:if>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
                <br />
                <b>Actores</b>
                <ul>
                  <xsl:for-each select="actor">
                    <li>
                      <xsl:value-of select="." />
                    </li>
                  </xsl:for-each>
                </ul>
              </p>
            </li>
          </xsl:for-each>
        </ol>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>