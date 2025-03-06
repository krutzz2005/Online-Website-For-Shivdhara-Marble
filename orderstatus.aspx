<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orderstatus.aspx.cs" Inherits="marble.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="contactus">
   <div class="container-fluid">
            <div class="row">
               <div class="col-md-8 offset-md-2">
                  <div class="title">
                     <h2>Order Status</h2>            
                  </div>
               </div>
            </div>
          </div>
</div>
     <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Green" />
     <div class="container1">
      <%-- <h4 style="height: 1px"> <a href="Cap.aspx">Product ></a>Cap</h4>--%>

                     

            					
				      	    <table  align="center" >
						        <tr>
						            <td>				                       
                                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                  DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" 
                                                  ForeColor="#333333" GridLines="None" >                                                  
                                                  <RowStyle BackColor="#E3EAEB" BorderColor="White" />
                                                  <Columns>                                                  
                                                      <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" 
                                                          SortExpression="id" InsertVisible="False">
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White" CssClass="upd1" Width="5%" />
                                                      </asp:BoundField>
                                                          <asp:TemplateField HeaderText="Selected Product">
                                                            <ItemTemplate>
                                                                <table width="100%" border="1">
                                                                    <tr>
                                                                    <td style="font-weight:bold;">Product Name</td>
                                                                      <td style="font-weight:bold;">Qty</td>
                                                                       <td style="font-weight:bold;">Price</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td><%# Eval("sel_pro") %></td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                              <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="10%" />
                                                          </asp:TemplateField>
                                                     
                                                      <asp:TemplateField HeaderText="Total">
                                                        <ItemTemplate>
                                                            <asp:Label ID="l1" runat="server"  Text='<%# Eval("total") %>'></asp:Label>
                                                        </ItemTemplate>
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="5%" />
                                                      </asp:TemplateField>
                                                      
                                                      <asp:BoundField  DataField="status" HeaderText="Status" SortExpression="status" >
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="5%" />
                                                      </asp:BoundField>
                                                      
                                                      <asp:BoundField ReadOnly="True"  DataField="o_date" HeaderText="O_Date" 
                                                          SortExpression="o_date" >
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="5%" />
                                                      </asp:BoundField>

                                                     
                                                      
                                                     <asp:CommandField ButtonType="image" HeaderText="Opration" 
                                                          DeleteImageUrl="~/admin/Buttons/more-btn_2.jpg" ShowDeleteButton="True" >
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="5%" />
                                                      </asp:CommandField>     
                                                      
                                                      
                                                       <asp:TemplateField HeaderText="Return">
                                                <ItemTemplate>
                                                <asp:Button ID="btnReturn" runat="server" Text="Order return" CommandArgument='<%# Eval("id") %>' OnCommand="btnReturn_Command"/>
                                                                   </ItemTemplate>
                                                     <HeaderStyle BackColor="#394A59" ForeColor="White" CssClass="upd1" Width="5%" />
                                                          

                                                                               </asp:TemplateField>    
                                                        <asp:TemplateField HeaderText="Bill">
    <ItemTemplate>
        <asp:Button ID="btnBill" runat="server" Text="Generate Bill" OnClick="btnBill_Click" CommandArgument='<%# Eval("id") %>' />
    </ItemTemplate>
    <HeaderStyle BackColor="#394A59" ForeColor="White" CssClass="upd1" Width="5%" />
</asp:TemplateField>                                    
                                                  </Columns>                                                 
                                                  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                  <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                  <HeaderStyle Font-Bold="True" ForeColor="White" />
                                                  <EditRowStyle BackColor="#7C6F57" />
                                                  <AlternatingRowStyle BackColor="White" />
                                              </asp:GridView>  
                                                                                   
                                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                  ConnectionString="<%$ ConnectionStrings:mycon %>" 
                                                  SelectCommand="SELECT * FROM [order13]"
                                                   DeleteCommand="DELETE FROM order13 WHERE ([id]=@id)" ProviderName="<%$ ConnectionStrings:mycon.ProviderName %>">
                                                   <DeleteParameters>
                                                        <asp:Parameter Name="id" />
                                                   </DeleteParameters>
                                                  
                                              </asp:SqlDataSource>
                                                 </td>
							    </tr>
			                </table>
			               <div style="margin-top:2%;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          
        </div>
            </div>
</asp:Content>


