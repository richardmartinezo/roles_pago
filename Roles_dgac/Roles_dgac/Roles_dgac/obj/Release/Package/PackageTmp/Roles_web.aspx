<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Roles_web.aspx.vb" Inherits="Roles_dgac.Roles_web" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style4 {
            height: 108px;
            width: 178px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        .auto-style5 {
            width: 100%;
            font-size: x-small;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: 700;
        }
        .auto-style6 {
            width: 99%;
            font-size: x-small;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: 700;
        }
        .auto-style7 {
            width: 93%;
            font-size: medium;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: 700;
        }
        .auto-style8 {
            width: 37%;
            font-size: x-small;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: 700;
        }
        .auto-style12 {
            height: 14px;
            text-align: left;
        }
        .auto-style14 {
            height: 54px;
            text-align: justify;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
            width: 57px;
        }
        .auto-style16 {
            height: 14px;
            text-align: justify;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
            width: 283px;
        }
        .auto-style17 {
            height: 30px;
            text-align: justify;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
            width: 283px;
        }
        .auto-style18 {
            height: 30px;
            text-align: justify;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
            width: 94px;
        }
        .auto-style19 {
            height: 30px;
            text-align: center;
        }
        .auto-style20 {
            height: 88px;
            text-align: justify;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: medium;
            width: 94px;
        }
    .dxflInternalEditorTable_SoftOrange {
    width: 100%;
}
        .auto-style22 {
            width: 33%;
            font-size: medium;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: 700;
        }
        .auto-style23 {
            width: 33%;
            font-size: medium;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: 700;
            height: 69px;
        }
        .auto-style24 {
            height: 69px;
        }
        .auto-style25 {
            width: 304px;
        }
        .auto-style26 {
            height: 14px;
            text-align: left;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: small;
            width: 283px;
        }
    </style>
</head>
<body>
    

       <script type="text/javascript">
           var lastCountry = null;
           function Onmes(mes) {
               comborol.PerformCallback(mes.GetValue().toString());
           }
           function OnEndCallback(s, e) {
               // if (lastCountry) {
               //    cmbCity.PerformCallback(lastCountry);
               //   lastCountry = null;
               //}
           }
    </script>

       <form id="form2" runat="server">
           <div>
    
        <br />
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Roles DGAC" Theme="Default" Width="100%" CornerRadius="10px">
            <HeaderStyle Font-Bold="True" Font-Size="Medium" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style8">
                <img alt="" class="auto-style1" src="imagenes/empresarial.jpg" width="180" />
                            </td>
                            <td class="auto-style6"><strong><span class="auto-style7">Sistema de Consulta de Roles de Pago Empleados DGAC&nbsp;<br />
                                <br />
                                </span>
                                <dx:ASPxButton ID="ASPxButton2" runat="server" Height="38px" Text="Salir del Sistema" Width="163px" Theme="Moderno">
                                </dx:ASPxButton>
                                </strong></td>
                            <td>
                <img alt="" class="auto-style4" src="imagenes/sello.png" />
                            </td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
               <dx:ASPxButton ID="button_admin" runat="server" AutoPostBack="False" Text="Administración de usuarios" Visible="False" Theme="Moderno">
               </dx:ASPxButton>
               <br />
               <br />
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Telef" Theme="Moderno" Width="100%" CornerRadius="10px" HorizontalAlign="Left">
            <HeaderTemplate>
                <img alt="" class="auto-style14" src="imagenes/cisco.jpg" />
                &nbsp;&nbsp; <span class="auto-style20"><strong>Datos de Contacto</strong></span>
            </HeaderTemplate>
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="dxflInternalEditorTable_MetropolisBlue">
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style16">Dependencia en la que labora:</td>
                            <td class="auto-style12">
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" DropDownWidth="1500px" Font-Size="Small" Height="19px" TextFormatString=" {3}; {4}" Width="700px" ValueField="ID" ValueType="System.Int32">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Ciudad" FieldName="CIUDAD" Width="25px" />
                                        <dx:ListBoxColumn Caption="Lugar" FieldName="LUGAR" Width="40px" />
                                        <dx:ListBoxColumn Caption="Proceso" FieldName="NIVEL" Width="40px" />
                                        <dx:ListBoxColumn Caption="Dirección" FieldName="UNIDAD" />
                                        <dx:ListBoxColumn Caption="Subproceso" FieldName="SUBPROCESO" />
                                    </Columns>
                                    <Items>
                                        <dx:ListEditItem Text="ListEditItem" Value="0" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16">Email Institucional:</td>
                            <td class="auto-style12">
                                <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Height="19px" Width="294px">
                                    <ValidationSettings CausesValidation="True">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                    <table class="dxflInternalEditorTable_MetropolisBlue">
                        <tr>
                            <td class="auto-style16">Email Personal:</td>
                            <td class="auto-style12">
                                <dx:ASPxTextBox ID="ASPxTextBox_email" runat="server" Height="19px" Width="294px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16">Piso en el que trabaja:</td>
                            <td class="auto-style12">
                                <dx:ASPxTextBox ID="ASPxTextBox4" runat="server" Height="19px" Width="294px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                    <table class="dxflInternalEditorTable_MetropolisBlue">
                        <tr>
                            <td class="auto-style26">Dir. Domicilio Completa: Calle principal / calle secundaria, Número de casa:</td>
                            <td class="auto-style12">
                                <dx:ASPxTextBox ID="ASPxTextBox_dirdom" runat="server" Height="19px" Width="294px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16">Num. Tel. Celular:</td>
                            <td class="auto-style12">
                                <dx:ASPxTextBox ID="ASPxTextBox_celu" runat="server" Height="19px" Width="294px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26">Num. Tel. Convencional:</td>
                            <td class="auto-style12">
                                <dx:ASPxTextBox ID="ASPxTextBox_telcon" runat="server" Height="19px" Width="294px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                    <table class="dxflInternalEditorTable_MetropolisBlue">
                        <tr>
                            <td class="auto-style16">Num. Dosis Vacunas:</td>
                            <td class="auto-style12" colspan="2">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <dx:ASPxRadioButtonList ID="ASPxRadioButtonList_vacunas" runat="server" ClientInstanceName="ASPxRadioButtonList_vacunas" EnableClientSideAPI="True" ValueType="System.Int16">
                                            <Items>
                                                <dx:ListEditItem Text="0 Dosis / No vacunado" Value="0" />
                                                <dx:ListEditItem Text="1 Dosis" Value="1" />
                                                <dx:ListEditItem Text="2 Dosis" Value="2" />
                                            </Items>
                                        </dx:ASPxRadioButtonList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16">Marca Vacuna:</td>
                            <td class="auto-style12" colspan="2">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                    <ContentTemplate>
                                        <dx:ASPxComboBox ID="ASPxComboBox_vacuna" runat="server" AutoPostBack="True" EnableClientSideAPI="True" SelectedIndex="0">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
  
}" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Sinovac" Value="Sinovac" />
                                                <dx:ListEditItem Text="Pfizer" Value="Pfizer" />
                                                <dx:ListEditItem Text="AstraZeneca" Value="AstraZeneca" />
                                                <dx:ListEditItem Text="Sputnik V" Value="Sputnik V" />
                                                <dx:ListEditItem Text="CanSino" Value="CanSino" />
                                                <dx:ListEditItem Text="Johnson &amp; Johnson" Value="J &amp; J" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">Extensión Telefónica:</td>
                            <td class="auto-style18">
                                <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td class="auto-style19">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <strong>
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" Height="38px" Text="Actualizar Datos Contacto" Theme="Moderno" Width="163px">
                                            <ClientSideEvents Click="function(s, e) {
		ASPxPopupControl1.Show(); 

}" />
                                        </dx:ASPxButton>
                                        </strong>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Roles_dgacConnectionString %>" SelectCommand="SELECT distinct(TIPO_NOMINA)  FROM roles_funcionarios WHERE (NUMERO_DOCUMENTO = @numero_documento) AND (MES = @mes) AND (EJERCICIO = @año)">
                                    <SelectParameters>
                                        <asp:Parameter Name="numero_documento" />
                                        <asp:Parameter Name="mes" />
                                        <asp:Parameter Name="año" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Roles_dgacConnectionString %>" EnableCaching="True" SelectCommand="SELECT * FROM [ubicaciones]" CacheDuration="60"></asp:SqlDataSource>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
    
                    <table class="auto-style5">
                        <tr>
                            <td>Año<dx:ASPxComboBox ID="comboaño" runat="server" SelectedIndex="6" Theme="Moderno" ValueType="System.Int32">
                                <Items>
                                    <dx:ListEditItem Text="2015" Value="2015" />
                                    <dx:ListEditItem Text="2016" Value="2016" />
                                    <dx:ListEditItem Text="2017" Value="2017" />
                                    <dx:ListEditItem Text="2018" Value="2018" />
                                    <dx:ListEditItem Text="2019" Value="2019" />
                                    <dx:ListEditItem Text="2020" Value="2020" />
                                    <dx:ListEditItem Selected="True" Text="2021" Value="2021" />
                                    <dx:ListEditItem Text="2022" Value="2022" />
                                    <dx:ListEditItem Text="2023" Value="2023" />
                                    <dx:ListEditItem Text="2024" Value="2024" />
                                    <dx:ListEditItem Text="2025" Value="2025" />
                                </Items>
                                </dx:ASPxComboBox>
                            </td>
                            <td>Mes<dx:ASPxComboBox ID="combomes" runat="server" ClientInstanceName="cmes" DropDownStyle="DropDown" EnableCallbackMode="True" EnableClientSideAPI="True" EnableTheming="True" SelectedIndex="0" Theme="Moderno" ValueType="System.Int32">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
Onmes(s);
LoadingPanel.Show();
}" />
                                <Items>
                                    <dx:ListEditItem Text="Enero" Value="1" Selected="True" />
                                    <dx:ListEditItem Text="Febrero" Value="2" />
                                    <dx:ListEditItem Text="Marzo" Value="3" />
                                    <dx:ListEditItem Text="Abril" Value="4" />
                                    <dx:ListEditItem Text="Mayo" Value="5" />
                                    <dx:ListEditItem Text="Junio" Value="6" />
                                    <dx:ListEditItem Text="Julio" Value="7" />
                                    <dx:ListEditItem Text="Agosto" Value="8" />
                                    <dx:ListEditItem Text="Septiembre" Value="9" />
                                    <dx:ListEditItem Text="Octubre" Value="10" />
                                    <dx:ListEditItem Text="Noviembre" Value="11" />
                                    <dx:ListEditItem Text="Diciembre" Value="12" />
                                </Items>
                                </dx:ASPxComboBox>
                            </td>
                            <td>Rol<dx:ASPxComboBox ID="comborol" runat="server" ClientInstanceName="comborol" DataSourceID="SqlDataSource1" EnableClientSideAPI="True" EnableTheming="True" Theme="Moderno" Width="452px" ValueField="TIPO_NOMINA">
                                <ClientSideEvents EndCallback="function(s, e) {
	LoadingPanel.Hide();
}" />
                                <Columns>
                                    <dx:ListBoxColumn Caption="Tipo Rol" FieldName="TIPO_NOMINA" />
                                </Columns>
                                </dx:ASPxComboBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="LoadingPanel" Theme="MetropolisBlue" Modal="True">
                                </dx:ASPxLoadingPanel>
                                <br />
                                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Ver Confidencial" Theme="Moderno">
                                    <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
                                </dx:ASPxButton>
                                <br />
                                <br />
                                <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" Theme="Moderno">
                                    <SettingsReportViewer EnableRequestParameters="False" />
                                    <StylesViewer>
                                        <Paddings Padding="10px" />
                                    </StylesViewer>
                                    <StylesReportViewer>
                                        <Paddings Padding="10px" />
                                    </StylesReportViewer>
                                    <ClientSideEvents EndCallback="function(s, e) {

}" PageLoad="function(s, e) {
	LoadingPanel.Hide();
	}" />
                                </dx:ASPxDocumentViewer>
                                <br />
                                <br />
                                <br />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
        <br />
        <br />
        <br />
                        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Salvar Datos" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="511px" ClientInstanceName="ASPxPopupControl1" CloseOnEscape="True" EnableClientSideAPI="True">
                            <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table class="dxflInternalEditorTable_SoftOrange">
        <tr>
            <td class="auto-style22">
                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/imagenes/disco.png" ShowLoadingImage="True" Height="123px" Width="119px">
                </dx:ASPxImage>
            </td>
            <td>Actualizar su información de Contacto?<br />
                <br />
                Recuerde actualizar su información cada vez<br /> que existan cambios.</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23"></td>
            <td class="auto-style24">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <dx:ASPxButton ID="ASPxButton7" runat="server" EnableTheming="True" Height="33px" Text="Aceptar !" Theme="SoftOrange" Width="104px">
                            <ClientSideEvents Click="function(s, e) {
ASPxPopupControl1.Hide();	
}" />
                        </dx:ASPxButton>
                        &nbsp;&nbsp;&nbsp;
                        <dx:ASPxButton ID="ASPxButton8" runat="server" EnableTheming="True" Height="33px" Text="Cancelar" Theme="Glass" Width="104px">
                            <ClientSideEvents Click="function(s, e) {
ASPxPopupControl1.Hide();	
}" />
                        </dx:ASPxButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
            </td>
            <td class="auto-style24"></td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
                                </dx:PopupControlContentControl>
</ContentCollection>
                        </dx:ASPxPopupControl>
           <br />
                        <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" HeaderText="Mensaje" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="511px" ClientInstanceName="ASPxPopupControl2" CloseOnEscape="True" EnableClientSideAPI="True">
                            <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table class="dxflInternalEditorTable_SoftOrange">
        <tr>
            <td class="auto-style22">
                <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/imagenes/Warning.png" ShowLoadingImage="True" Height="47px" Width="42px">
                </dx:ASPxImage>
            </td>
            <td class="auto-style25"><strong>Estimado usuario por favor actualice su información de Contacto.<br /> </strong>&nbsp;<br /> Son necesarios los campos: Dependencia en la que Labora, Extensión Telefónica, Dir Domicicio.<br />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style25">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <dx:ASPxButton ID="ASPxButton9" runat="server" EnableTheming="True" Height="33px" Text="Aceptar !" Theme="SoftOrange" Width="104px">
                            <ClientSideEvents Click="function(s, e) {
ASPxPopupControl2.Hide();
}" />
                        </dx:ASPxButton>
                        &nbsp;&nbsp;&nbsp;
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
                                </dx:PopupControlContentControl>
</ContentCollection>
                        </dx:ASPxPopupControl>
        <br />
        <br />
        <br />
    </form>
   
    
</body>
</html>
