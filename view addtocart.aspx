<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="view addtocart.aspx.cs" Inherits="marble.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
         .Navigation 
        {            
           background-color:#f3a268;
            width:100%;
            color:white;
            font-size:20px;
            
        }
           .cart 
        {
            height: 56px; 
            width: 56px;
            border:none;
            
        }
                   .cart1 
        {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            height: 47px; 
            width: 54px;
        }
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
        .btn
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
         .footer 
        {
            position:fixed;
            width:100%;
            height:20%;
            background-color:gray;
            color:white;
            text-align:center;
            padding:20px;
        }
        .ft {
            font-size:25px;
            color:#aaa;
            text-align:center;
         
        }
        .footer-copy
        {
	        padding:0.5em 0.5em;
	        background:#333333;
	        text-align:center;
            color:#aaa;
        }
        .log1 
        {
            margin-left:1100px;
            
        }
        .menu1 {
             text-decoration:none;             
             font-size:x-large;  
             font-family:Andalus;
        }
         .new 
        {
            background-color:maroon;
            border:outset;
             color:white;
             text-align:center;
             font-size:15px;
             cursor:pointer;
             display:inline-block;
             padding:5px 5px;
        }
       

            
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contactus">
   <div class="container-fluid">
            <div class="row">
               <div class="col-md-8 offset-md-2">
                  <div class="title">
                     <h2>view cart</h2>            
                  </div>
               </div>
            </div>
          </div>
</div>
    <div>
    <br />
            <h1 align="center">View Cart</h1><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
                                Height="96px" 
                                Width="83%" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" 
                                 DataKeyNames="p_id" GridLines="none" BackColor="White" 
                                    BorderColor="#999999" BorderStyle="Ridge" BorderWidth="1px" align="center">
                                 <Columns>                                
                                     <asp:ImageField DataImageUrlField="image" ControlStyle-CssClass="img-responsive" 
                                     HeaderText="Images">
                                         <ControlStyle Height="100px" Width="100px" />
                                         <HeaderStyle BackColor="Black" />
                                     </asp:ImageField>
                                    <asp:TemplateField HeaderText="Product name" SortExpression="p_nm" HeaderStyle-BackColor="Black">
                                        <ItemTemplate>
                                            <asp:Label ID="P_name" runat="server" Text='<%# Eval("p_nm") %>'></asp:Label>
                                        </ItemTemplate>                                       
                                        <HeaderStyle BackColor="Black"></HeaderStyle>
                                    </asp:TemplateField>                                 
                                     <asp:TemplateField HeaderText="Price" SortExpression="price" HeaderStyle-BackColor="Black">
                                        <ItemTemplate>
                                            <asp:Label ID="price" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                        </ItemTemplate>                                       
                                    <HeaderStyle BackColor="Black"></HeaderStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity" SortExpression="qty" HeaderStyle-BackColor="Black">
                                        <ItemTemplate>
                                            <asp:Label ID="qut" runat="server" Text='<%# Eval("qty") %>'></asp:Label>
                                        </ItemTemplate>                                       
                                    <HeaderStyle BackColor="Black"></HeaderStyle>
                                    </asp:TemplateField>   
                                  
                                  
                                     
                                    <asp:TemplateField HeaderText="Sub Total" SortExpression="total" HeaderStyle-BackColor="Black">
                                        <ItemTemplate>
                                            <asp:Label ID="total" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                        </ItemTemplate>                                       
                                    <HeaderStyle BackColor="Black"></HeaderStyle>
                                    </asp:TemplateField>
                                  
                                     <asp:CommandField ButtonType="image" 
                                         DeleteImageUrl="~/admin/Buttons/more-btn_2.jpg" ShowDeleteButton="True">
                                         <HeaderStyle BackColor="Black" Width="30" />
                                     </asp:CommandField>
                                     
                                     </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="#CCCCCC" CssClass="G1" />
                            </asp:GridView>
    </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:mycon %>" 
                                    SelectCommand="SELECT * FROM [addtocart] WHERE ([unm] = @uid)"
                                     DeleteCommand="DELETE FROM addtocart where p_id=@p_id" ProviderName="<%$ ConnectionStrings:mycon.ProviderName %>">
                             <SelectParameters>                                       
                                        <asp:SessionParameter Name="uid" SessionField="uid" Type="String" />
                                    </SelectParameters>
                                 <DeleteParameters>
                                   <asp:Parameter Name="p_id" Type="Int32" />
                                 </DeleteParameters>
                                    
                                </asp:SqlDataSource>
      <table>
							<tr>
							<td style="float:left; margin-left:60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <h3>Total Amount:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h3>
							    
							</td>
							</tr>						
                              
							</table>
								
        <div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <asp:Button ID="Button1" CssClass="button" Width="118px" runat="server" Text="Shop More" OnClick="Button1_Click" Height="58px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button2" Width="116px" CssClass="button" runat="server" Text="Checkout"  OnClick="Button2_Click" Height="58px"/>
                            
							 </div>   
</asp:Content>

