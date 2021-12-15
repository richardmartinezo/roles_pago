<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="usuarios.aspx.vb" Inherits="Roles_dgac.usuarios" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style8 {
            width: 37%;
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
        .auto-style4 {
            height: 99px;
            width: 183px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Roles_dgacConnectionString %>" DeleteCommand="DELETE FROM [funcionarios] WHERE [CEDULA] = @CEDULA" InsertCommand="INSERT INTO funcionarios(CEDULA, APELLIDOS_NOMBRES, NOMBRES_APELLIDOS, APELLIDOS, NOMBRES, ALIAS, CORREOS, PASSWORD, REGISTRADO, FECHA_NACIMIENTO, ADMINISTRADOR) VALUES (@CEDULA, @APELLIDOS_NOMBRES, @NOMBRES_APELLIDOS, @APELLIDOS, @NOMBRES, @ALIAS, @CORREOS, @PASSWORD, @REGISTRADO, @FECHA_NACIMIENTO, @ADMINISTRADOR)" SelectCommand="SELECT * FROM [funcionarios]" UpdateCommand="UPDATE funcionarios SET APELLIDOS_NOMBRES = @APELLIDOS_NOMBRES, NOMBRES_APELLIDOS = @NOMBRES_APELLIDOS, APELLIDOS = @APELLIDOS, NOMBRES = @NOMBRES, ALIAS = @ALIAS, CORREOS = @CORREOS, PASSWORD = @PASSWORD, REGISTRADO = @REGISTRADO, FECHA_NACIMIENTO = @FECHA_NACIMIENTO, ADMINISTRADOR = @ADMINISTRADOR, CEDULA = @CEDULA WHERE (CEDULA = @CEDULA)">
            <DeleteParameters>
                <asp:Parameter Name="CEDULA" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CEDULA" Type="String" />
                <asp:Parameter Name="APELLIDOS_NOMBRES" Type="String" />
                <asp:Parameter Name="NOMBRES_APELLIDOS" Type="String" />
                <asp:Parameter Name="APELLIDOS" Type="String" />
                <asp:Parameter Name="NOMBRES" Type="String" />
                <asp:Parameter Name="ALIAS" Type="String" />
                <asp:Parameter Name="CORREOS" Type="String" />
                <asp:Parameter Name="PASSWORD" Type="String" />
                <asp:Parameter Name="REGISTRADO" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="FECHA_NACIMIENTO" />
                <asp:Parameter Name="ADMINISTRADOR" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="APELLIDOS_NOMBRES" Type="String" />
                <asp:Parameter Name="NOMBRES_APELLIDOS" Type="String" />
                <asp:Parameter Name="APELLIDOS" Type="String" />
                <asp:Parameter Name="NOMBRES" Type="String" />
                <asp:Parameter Name="ALIAS" Type="String" />
                <asp:Parameter Name="CORREOS" Type="String" />
                <asp:Parameter Name="PASSWORD" Type="String" />
                <asp:Parameter Name="REGISTRADO" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="FECHA_NACIMIENTO" />
                <asp:Parameter Name="CEDULA" Type="String" />
                <asp:Parameter Name="ADMINISTRADOR" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Roles DGAC" Theme="Moderno" Width="827px">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style8">
                <img alt="" class="auto-style1" src="imagenes/empresarial.jpg" width="180" />
                            </td>
                            <td class="auto-style6"><strong><span class="auto-style7">Sistema de Consulta de Roles de Pago Empleados DGAC&nbsp;<br />
                                <br />
                                <dx:ASPxButton ID="ASPxButton2" runat="server" Height="38px" Text="Salir del Sistema" Width="163px" Theme="Moderno">
                                </dx:ASPxButton>
                                </span></strong></td>
                            <td>
                <img alt="" class="auto-style4" src="imagenes/sello.png" />
                            </td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="CEDULA" Theme="Moderno">
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="CEDULA" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="APELLIDOS_NOMBRES" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NOMBRES_APELLIDOS" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="APELLIDOS" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NOMBRES" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ALIAS" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CORREOS" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PASSWORD" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="ADMINISTRADOR" VisibleIndex="9" Caption="ADMINISTRADOR">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataDateColumn FieldName="FECHA_NACIMIENTO" VisibleIndex="10">
                </dx:GridViewDataDateColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
        </dx:ASPxGridView>
    </form>
</body>
</html>
