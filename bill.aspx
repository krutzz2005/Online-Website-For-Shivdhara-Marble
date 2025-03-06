<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="marble.bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .invoice-container {
            width: 60%;
            margin: auto;
            border: 1px solid black;
            padding: 20px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
        }
        .invoice-header {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }
        .invoice-details {
            margin-top: 20px;
        }
        .invoice-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .invoice-details th, .invoice-details td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        .total-section {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }
        .btn-print {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
    <script>
        function printBill() {
            window.print();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div class="invoice-container">
        <div class="invoice-header">
            <h2>ShivDhara Marble </h2>
        </div>

        <div class="invoice-details">
            <table>
                <tr>
                    <td><strong>Bill No:</strong> <asp:Label ID="lblOrderId" runat="server"></asp:Label></td>
                    <td><strong>Order Date:</strong> <asp:Label ID="lblOrderDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td><strong>Customer Name:</strong> <asp:Label ID="lblCustomerName" runat="server"></asp:Label></td>
                    <td><strong>Status:</strong> <asp:Label ID="lblStatus" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>

        <div class="invoice-details">
            <h3>Order Details</h3>
            <table>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    
                </tr>
                <asp:Repeater ID="rptBill" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("sel_pro") %></td>
                           
                       <td><%# Eval("total") %></td>
                            
                        </tr>
                    </ItemTemplate>
                    
                </asp:Repeater>
                
            </table>
        </div>

       

        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
    
    </div>
    </form>
</body>
</html>

