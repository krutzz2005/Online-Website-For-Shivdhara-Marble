<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addto.aspx.cs" Inherits="marble.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   

    <style type="text/css">
        .auto-style1 {
            width: 324px;
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
        }
        .button {
            background-color: #808080;
            border: outset;
            color: white;
            text-align: center;
            font-size: 15px;
            cursor: pointer;
            display: inline-block;
            padding: 5px 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="products-grids">
        <div class="col-md-8 products-grid-left">
            <div class="products-grid-lft">
                <div class="product-grd">
                    <div class="p-one simpleCart_shelfItem prd">
                        <h4 style="font-size:2em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Product View&nbsp;</h4>
                        <table align="center" style="margin-left:20%; width:100%;">
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Image ID="Image1" runat="server" Width="253px" Height="281px" BorderColor="#333333" BorderStyle="Solid" />
                                </td>
                            </tr>
                            <br />
                            <tr>
                                <td align="center" class="auto-style1">
                                    <asp:Label ID="Label1" runat="server" Text="Product Id : " ForeColor="Black"></asp:Label>
                                </td>
                                <td class="auto-style2">
                                    &nbsp;<asp:Label ID="Label2" runat="server" ForeColor="#204056"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style1">
                                    <asp:Label ID="Label3" runat="server" Text="Product Name : " ForeColor="Black"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="#204056"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style1">
                                    <asp:Label ID="Label5" runat="server" Text="Price : " ForeColor="Black"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;<asp:Label ID="Label6" runat="server" ForeColor="#204056"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style1">
                                    <asp:Label ID="Label7" runat="server" Text="Stock : " ForeColor="Black"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;<asp:Label ID="Label8" runat="server" ForeColor="#204056"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style1">
                                    <asp:Label ID="Label12" runat="server" Text="Quantity : " ForeColor="Black"></asp:Label>
                                </td>
                                <td colspan="2">&nbsp;
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator1" 
                                        runat="server" 
                                        ControlToValidate="TextBox6" 
                                        InitialValue="0" 
                                        ErrorMessage="Enter Quantity" 
                                        Text="*" ForeColor="Red" />

                                    <asp:CompareValidator 
                                        ID="CompareValidator1" 
                                        runat="server" 
                                        ControlToValidate="TextBox6" 
                                        ValueToCompare="0" 
                                        Type="Integer" 
                                        Operator="GreaterThan" 
                                        ErrorMessage="Please enter a quantity greater than 0" 
                                        ForeColor="Red" />

                                    <asp:RegularExpressionValidator 
                                        ID="RegularExpressionValidator1" 
                                        runat="server" 
                                        ControlToValidate="TextBox6" 
                                        ErrorMessage="Enter only numbers" 
                                        ValidationExpression="^\d+$" 
                                        Text="*" 
                                        ForeColor="Red" />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" style="color: blue" align="left">Cash On Delivery<br>
                                    Shipping Charge 100<br>
                                    Shipping 10 days
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button 
                                        ID="Button1" 
                                        runat="server" 
                                        Text="Add To Cart" 
                                        OnClick="Button1_Click1" 
                                        Height="51px" 
                                        CssClass="button" 
                                        Width="145px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button 
                                        ID="Button2" 
                                        runat="server" 
                                        Text="Buy Now" 
                                        CssClass="button" 
                                        Height="52px" 
                                        OnClick="Button2_Click" />
                                </td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
