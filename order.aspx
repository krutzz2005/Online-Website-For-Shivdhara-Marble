<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="marble.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
     .button 
         {
             background-color: #808080;
             border:outset;
             color:white;
             text-align:center;
             font-size:15px;
             cursor:pointer;
             display:inline-block;
             padding:5px 5px;
         }
       
         .auto-style3 {
            height: 26px;
        }
        .cart1 
        {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            height: 47px; 
            width: 54px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="contactus">
   <div class="container-fluid">
            <div class="row">
               <div class="col-md-8 offset-md-2">
                  <div class="title">
                     <h2>Check Out</h2>            
                  </div>
               </div>
            </div>
          </div>
</div>
    <div>
      <h4 style="font-size:2em;" align="center"> Shopping Detail</h4>						
                             <table border="0"  align="center" width="100%">

                                  <tr style="float:left; margin-bottom:2%;">
                       <td align="center">
                            <asp:Label ID="Label1" runat="server" Text="id :" Width="204px"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="TextBox5" runat="server" Width="290px"  ForeColor="Black"></asp:TextBox>
                        </td>
                        
                    </tr>

                    <tr style="float:left; margin-bottom:2%;">
                       <td align="center">
                            <asp:Label ID="lblUser" runat="server" Text="Name :" Width="204px"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="TextBox1" runat="server" Width="290px"  ForeColor="Black"></asp:TextBox>
                        </td>
                        
                    </tr>
                    
                    <tr style="float:left; margin-bottom:2%;">
                        <td align="center" class="auto-style3">
                            <asp:Label ID="lblEmail" runat="server" Text="Email :" Width="204px"></asp:Label>
                        </td>
                        <td align="left" class="auto-style3">
                            <asp:TextBox ID="TextBox2" runat="server" Width="290px"  ForeColor="Black"></asp:TextBox>
                        </td>
                       
                    </tr>
                    <tr style="float:left; margin-bottom:2%;">
                <td align="center">
                    <asp:Label ID="lblContact" runat="server" Text="Mobile No.:" Width="204px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Width="290px"  ForeColor="Black"></asp:TextBox>
                </td>
               
            </tr>
                    <tr style="float:left; margin-bottom:2%;">
                     <td align="center">
                            <asp:Label ID="lblCmnt" runat="server" Text="Address :" Width="204px"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="290px"  ForeColor="Black"></asp:TextBox>
                        </td>
                       
                    </tr>
                    <tr style="float:left">
                        <td align="center"><asp:Label ID="Label4" runat="server" Text="Selected Product :" Width="204px"></asp:Label></td>
                        <td align="center">
                            <table style="border:2px solid #204056;" width="130%">
                                <tr style="border:2px solid #204056;">
                                    <td><b>Product Name</b></td>
                                    <td><b>Quantity</b></td>
                                    <td><b>Total</b></td>
                                    
                                </tr>
                                
                                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>    
                                
                            
                            
                        </td>
                        
                    </tr>
                                 </table>
                                  <table border="0"  align="center" width="100%">
                                 <tr>
                                <td align="right">
                                    <h4>Total Amount:</h4>
                                </td>
                                <td align="left">
                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <h4>Payment Metod :-</h4>
                                </td>
                                <td  align="left">
                                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Cash On Delivery" GroupName="p1" AutoPostBack="true" OnCheckedChanged="RadioButton1_CheckedChanged"/>
                                    <br />
                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="QR Code" GroupName="p1" AutoPostBack="true" OnCheckedChanged="RadioButton2_CheckedChanged"/>
                                </td>
                            </tr>

                             <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label2" runat="server" Text="QR Code :" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Text="Cash On Delivery :-" Font-Bold="True" Font-Size="Large" ForeColor="Black"></asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <asp:Image ID="Image1" runat="server" Height="127px" Width="164px" />
                                    <asp:Label ID="Label6" runat="server" Text="Place Order" Font-Bold="True" Font-Size="X-Large" ForeColor="Green"></asp:Label> 
                                </td>
                            </tr>
                          
                   
                                 
                        <table align=""><tr><td>
                        <h3 style="width: 511px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Amount:</h3>
                           <td> 
                               <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                           </td>
                       
                      </table>
                       
                                 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSubmit" runat="server" Text="Confirm" CssClass="button" 
                                 onclick="btn1" Height="45px" align="center" Width="114px"/>
                            &nbsp;
                      
                        <td align="center" >
                        </td>
                    </tr>
                </table>  
          
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:mycon %>" 
                            SelectCommand="SELECT [p_nm], [qty], [total] FROM [addtocart]" ProviderName="<%$ ConnectionStrings:mycon.ProviderName %>"></asp:SqlDataSource>
    </div>
</asp:Content>
