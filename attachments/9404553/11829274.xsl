<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:tns="http://cmanagepurchaseorder.webservices.ifsworld.com/"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/IFSPurchaseOrderDbAdapter"
                exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns1 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/IHC/NestixReceiveMaterialService/IFSPurchaseOrderDbAdapter"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns0="http://www.royalihc.com/Middleware/Services/NestixReceiveMaterialService/ReceiveMaterial"
                xmlns:wsp1_2="http://schemas.xmlsoap.org/ws/2004/09/policy" xmlns:wsp="http://www.w3.org/ns/ws-policy"
                xmlns:wsam="http://www.w3.org/2007/05/addressing/metadata"
                xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ReceiveMaterial.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Root" namespace=""/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/IFSPurchaseOrderDbAdapter.wsdl"/>
        <oracle-xsl-mapper:rootElement name="CPurchaseInfoCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/IFSPurchaseOrderDbAdapter"/>
        <oracle-xsl-mapper:param name="invoke_IFSPurchaseOrderDb_OutputVariable.CPurchaseInfoCollection"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/IFS/WSDL/CManagePurchaseOrder.wsdl"/>
        <oracle-xsl-mapper:rootElement name="receivePurchaseOrderLine"
                                       namespace="http://cmanagepurchaseorder.webservices.ifsworld.com/"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.3.0(XSLT Build 170820.1700.2557) AT [WED JUN 05 14:00:03 CEST 2019].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="invoke_IFSPurchaseOrderDb_OutputVariable.CPurchaseInfoCollection"/>
  <xsl:param name="POLineCounter"/>
  <xsl:template match="/">
    <tns:receivePurchaseOrderLine>
      <Site>156A</Site>
      <xsl:if test="/Root/PurchaseOrder/IFS_PONumber">
        <OrderNo>
          <xsl:value-of select="/Root/PurchaseOrder/IFS_PONumber"/>
        </OrderNo>
      </xsl:if>
      <xsl:if test="/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]/IFS_POLNumber">
        <LineNo>
          <xsl:value-of select="/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]/IFS_POLNumber"/>
        </LineNo>
      </xsl:if>
      <xsl:if test="(/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/IFS_Release_Nr">
        <ReleaseNo>
          <xsl:value-of select="(/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/IFS_Release_Nr"/>
        </ReleaseNo>
      </xsl:if>
      <xsl:if test="(/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/ReceivedWeight">
        <QtyArrived>
          <xsl:value-of select="(/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/ReceivedWeight"/>
        </QtyArrived>
      </xsl:if>
      <ReceiveCase>Receive into Arrival</ReceiveCase>
      <PartNo>
        <xsl:value-of select="$invoke_IFSPurchaseOrderDb_OutputVariable.CPurchaseInfoCollection/ns1:CPurchaseInfoCollection/ns1:CPurchaseInfo/ns1:partNo"/>
      </PartNo>
      <xsl:if test="(/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/ReceivingDate">
        <ArrivalDate>
          <xsl:value-of select="substring-before((/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/ReceivingDate,'T')"/>
        </ArrivalDate>
      </xsl:if>
      <xsl:if test="(/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/ReceivingDate">
        <DeliveryDate>
          <xsl:value-of select="substring-before((/Root/PurchaseOrder/PurchaseOrderLine[$POLineCounter]//Plate|//Profile)/ReceivingDate,'T')"/>
        </DeliveryDate>
      </xsl:if>
      <LocationNo>NESTIX</LocationNo>
      <LotBatchNo>*</LotBatchNo>
      <SerialNo>*</SerialNo>
      <WaivDevReiNo>*</WaivDevReiNo>
    </tns:receivePurchaseOrderLine>
  </xsl:template>
</xsl:stylesheet>
