<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/top/IFSPurchaseOrderDbAdapter" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl tns socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns0="http://www.royalihc.com/Middleware/Services/NestixReceiveMaterialService/ReceiveMaterial"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/IHC/NestixReceiveMaterialService/IFSPurchaseOrderDbAdapter"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/ReceiveMaterial.wsdl"/>
            <oracle-xsl-mapper:rootElement name="Root" namespace=""/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/IFSPurchaseOrderDbAdapter.wsdl"/>
            <oracle-xsl-mapper:rootElement name="IFSPurchaseOrderDbAdapterSelect_PONo_LineNo_RelNoInputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/IFSPurchaseOrderDbAdapter"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.3.0(XSLT Build 170820.1700.2557) AT [FRI OCT 23 16:54:27 CEST 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="POLineCounter"/>
   <xsl:template match="/">
      <tns:IFSPurchaseOrderDbAdapterSelect_PONo_LineNo_RelNoInputParameters>
         <tns:PONo>
            <xsl:value-of select="/Root/PurchaseOrder/IFS_PONumber"/>
         </tns:PONo>
         <tns:LineNo>
            <xsl:value-of select="/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]/IFS_POLNumber"/>
         </tns:LineNo>
         <tns:RelNo>
            <xsl:value-of select="(/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/IFS_Release_Nr"/>
         </tns:RelNo>
      </tns:IFSPurchaseOrderDbAdapterSelect_PONo_LineNo_RelNoInputParameters>
   </xsl:template>
</xsl:stylesheet>
