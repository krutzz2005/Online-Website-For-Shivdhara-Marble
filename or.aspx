<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="or.aspx.cs" Inherits="marble.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
      <%-- <h4 style="height: 1px"> <a href="Cap.aspx">Product ></a>Cap</h4>--%>
          <asp:LinkButton ID="linkbtn" runat="server" OnClick="linkbtn_Click"  Text="Show all"/>
                     <b>Search Product:</b>
          <asp:TextBox ID="TextBox1" runat="server" Height="29px" Width="168px" />
          <asp:Button ID="Button1" runat="server" Text="search" OnClick="Button1_Click" />
          <br /><br />

            <h4 style="font-size:1.5em;" align="center">Order Status</h4>						
				      	    <table  align="center" >
						        <tr>
						            <td>				                       
                                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                  DataKeyNames="order_id" DataSourceID="SqlDataSource1" CellPadding="4" 
                                                  ForeColor="#333333" GridLines="None" OnRowDeleted="GridView1_RowDeleted" >                                                  
                                                  <RowStyle BackColor="#E3EAEB" BorderColor="White" />
                                                  <Columns>      
                                                                                                  
                                                      <asp:BoundField DataField="order_id" HeaderText="Id" ReadOnly="True" 
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
                                                                       
                                                                    <td><%# Eval("p_nm") %></td>
                                                                         <td><%#Eval("qty") %></td>
                                                                         <td><%#Eval("p_price") %></td>
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
                                                      
                                                      <asp:BoundField  DataField="Status" HeaderText="Status" SortExpression="Status" >
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="5%" />
                                                      </asp:BoundField>
                                                      
                                                      <asp:BoundField ReadOnly="True"  DataField="order_date" HeaderText="O_Date" 
                                                          SortExpression="O_date" >
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="5%" />
                                                      </asp:BoundField>
                                                      
                                                     <asp:CommandField ButtonType="Button" HeaderText="Opration" 
                                                           ShowDeleteButton="True" >
                                                          <HeaderStyle BackColor="#394A59" ForeColor="White"  CssClass="upd1" Width="5%" />
                                                         
                                                      </asp:CommandField>  
                                                       <asp:TemplateField HeaderText="Return">
                                                <ItemTemplate>
                                               <asp:Button ID="btnReturn" runat="server" Text="Order return"  CommandArgument='<%# Eval("order_id") %>'  />
                                                                     </ItemTemplate>
                                                     <HeaderStyle BackColor="#394A59" ForeColor="White" CssClass="upd1" Width="5%" />
</asp:TemplateField>                         
                                                     
                                                       <asp:TemplateField HeaderText="Bill">
    <ItemTemplate>
        <asp:Button ID="btnBill" runat="server" Text="Generate Bill" OnClick="btnBill_Click" CommandArgument='<%# Eval("order_id") %>' />
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
                                                  ConnectionString="<%$ ConnectionStrings:con %>" 
                                                 SelectCommand="SELECT *FROM [dbo].[order1]"
                                                   DeleteCommand="DELETE FROM [dbo].[order1] WHERE ([order_id]=@id)" ProviderName="<%$ ConnectionStrings:con.ProviderName %>">
                                             
                                                   <DeleteParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                               </DeleteParameters>
                                              </asp:SqlDataSource>
                                                 </td>
							    </tr>
			                </table>
			               <div style="margin-top:2%;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          
        </div>
            </div>
    
</asp:Content>

