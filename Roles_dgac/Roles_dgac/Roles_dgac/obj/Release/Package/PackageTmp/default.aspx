<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="Roles_dgac._default" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    



    <title></title>
    <style type="text/css">

        .auto-style2 {
            width: 330px;
        }
        .auto-style4 {
            width: 231px;
            height: 138px;
        }
        .auto-style3 {
            width: 355px;
            height: 250px;
        }
        .auto-style5 {
        }
        .auto-style6 {
            width: 6px;
        }
        .auto-style7 {
            width: 189px;
        }
        .auto-style8 {
            width: 268435456px;
        }
        .auto-style9 {
            height: 28px;
        }
        .auto-style10 {
            width: 268435456px;
            height: 28px;
        }
        .auto-style11 {
            font-size: large;
        }
        .auto-style12 {
            font-size: xx-small;
        }
        #I1 {
            height: 206px;
            width: 98%;
        }
        .auto-style13 {
            width: 22px;
        }
        </style>




</head>
<!-- Piwik -->
<!--<script type="text/javascript">
    var _paq = _paq || [];
    _paq.push(['trackPageView']);
    _paq.push(['enableLinkTracking']);
    (function () {
        var u = "//172.20.17.242/";
        _paq.push(['setTrackerUrl', u + 'piwik.php']);
        _paq.push(['setSiteId', 2]);
        var d = document, g = d.createElement('script'), s = d.getElementsByTagName('script')[0];
        g.type = 'text/javascript'; g.async = true; g.defer = true; g.src = u + 'piwik.js'; s.parentNode.insertBefore(g, s);
    })();
</script>
<noscript><p><img src="//172.20.17.242/piwik.php?idsite=2" style="border:0;" alt="" /></p></noscript>-->
<!-- End Piwik Code -->

                <body>

                        <script language="jscript" type="text/jscript">
                            function check() {

                                ASPxPopupControl1.Hide();


                            }

              </script>

                    <form id="form1" runat="server">

                                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
                                </asp:ScriptManager>

        <table border="0" width="100%">
            <tr>
                <td width="100%">
                    <table align="center" border="0">
                        <tr>
                            <td class="auto-style2">

        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Height="417px" style="margin-left: 0px" Width="885px" HeaderText="Consulta roles" Theme="SoftOrange">
                <PanelCollection>
<dx:PanelContent runat="server">
    <table class="dxflInternalEditorTable">
        <tr>
            <td>
                <img alt="" class="auto-style4" src="imagenes/sello.png" />
                &nbsp;&nbsp; </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span class="auto-style11"> <span class="auto-style7">Sistema de Consulta de Roles de Pago Empleados DGAC&nbsp;</span></span></strong></td>
        </tr>
    </table>
    <br />
    <table class="dxflInternalEditorTable">
        <tr>
            <td rowspan="6" class="auto-style13">&nbsp;&nbsp;
                <img alt="" class="auto-style3" src="imagenes/empresa.jpg" />
            </td>
            <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td>Usuario:<br /> </td>
            <td>
                <dx:ASPxTextBox ID="Textuser" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Clave:</td>
            <td>
                <dx:ASPxTextBox ID="Textpass" runat="server" Width="170px" Password="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <dx:ASPxButton ID="ASPxButton2" runat="server" Height="29px" Text="Ingresar" Theme="SoftOrange" Width="88px" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	

}" />
                        </dx:ASPxButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">Nota: Si es su primer ingreso al sistema<br /> la clave es la fecha de su nacimiento<br /> en formato día/mes/año: 1/3/1970<br /> <strong>Nota: No incluir 0 en el día o Mes</strong></td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/Warning.png" />
    Advertencia: La información contenida en este sistema es para uso exclusivo del servidor(a) propietario de los datos, en caso de ingresos no autorizados, estos serán reportados a su cuenta de correo electrónico institucional.<br />
    <br />
    <span class="auto-style12">Dirección de Tic&#39;s DGAC.</span><br />
    <div id="widgetIframe">
    </div>
    <br />
                        </dx:PanelContent>
</PanelCollection>
            </dx:ASPxRoundPanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
                        <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" HeaderText="Error credenciales no válidas!" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="511px">
                            <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table class="dxflInternalEditorTable_SoftOrange">
        <tr>
            <td class="auto-style7">
                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/imagenes/usererror.png" ShowLoadingImage="True">
                </dx:ASPxImage>
            </td>
            <td>Error credenciales de usuario No reconocidas!</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <dx:ASPxButton ID="ASPxButton7" runat="server" EnableTheming="True" Height="33px" Text="Aceptar !" Theme="SoftOrange" Width="104px">
                            <ClientSideEvents Click="function(s, e) {
ASPxPopupControl2.Hide();	
}" />
                        </dx:ASPxButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
                                </dx:PopupControlContentControl>
</ContentCollection>
                        </dx:ASPxPopupControl>
                        <dx:ASPxCallback ID="cbTestdac" runat="server" ClientInstanceName="cbTest">
                            <ClientSideEvents EndCallback="function(s, e) {check();}" />
                        </dx:ASPxCallback>
                        <asp:Panel ID="Panel1" runat="server">
                            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Cambio de clave en el sistema" Height="230px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="646px" CloseOnEscape="True" EnableClientSideAPI="True" LoadContentViaCallback="OnPageLoad" PopupAction="None" PopupAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <table class="dxflInternalEditorTable_SoftOrange">
                                                    <tr>
                                                        <td colspan="3">
                                                            <br />
                                                            <img alt="" class="auto-style4" src="imagenes/CLAVE.jpg" />
                                                            <br />
                                                            <br />
                                                        </td>
                                                        <td class="auto-style5" colspan="3">Confirme su Nueva contraseña en el sistema:</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style5">Ingrese su nueva contraseña:</td>
                                                        <td colspan="3">
                                                            <dx:ASPxTextBox ID="pass1" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style9">Confirme la Nueva contraseña</td>
                                                        <td colspan="3" class="auto-style9">
                                                            <dx:ASPxTextBox ID="pass2" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td class="auto-style9"></td>
                                                        <td class="auto-style10"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style5">
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <br />
                                                        </td>
                                                        <td>
                                                            <dx:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" Height="29px" Text="Confirmar" Theme="SoftOrange" Width="88px">
                                                                <ClientSideEvents Click="function(s, e) {
  	}" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td class="auto-style6" colspan="2">
                                                            <dx:ASPxButton ID="ASPxButton4" runat="server" AutoPostBack="False" ClientInstanceName="bot1" EnableClientSideAPI="True" Height="29px" Text="Cancelar" Theme="SoftOrange" Width="88px">
                                                                <ClientSideEvents Click="function(s, e) {
	ASPxPopupControl1.Hide();
}" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </asp:Panel>
    </form>
</body>

</html>
