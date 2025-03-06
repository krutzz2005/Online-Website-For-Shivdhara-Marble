<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bb.aspx.cs" Inherits="marble.bb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill Details</title>
    <script type="text/javascript">
        function print() {
            window.print();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Bill Details</h2>

            <!-- Error Message Display -->
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label><br />

            <!-- User Information -->
            <p>Username: <asp:Label ID="unm" runat="server"></asp:Label></p>
            <p>Phone Number: <asp:Label ID="mono" runat="server"></asp:Label></p>
            <p>Address: <asp:Label ID="add" runat="server"></asp:Label></p>

            <!-- Bill Information -->
            <p>Order ID: <asp:Label ID="lblOrderId" runat="server"></asp:Label></p>
            <p>Date: <asp:Label ID="lblDate" runat="server"></asp:Label></p>
            <p>Total Bill: <asp:Label ID="lblTotal" runat="server"></asp:Label></p>

            <!-- Table to display products -->
            <table border="1">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Discount</th>
                        <th>GST</th>
                    </tr>
                </thead>
                <tbody id="tblProducts" runat="server">
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>

