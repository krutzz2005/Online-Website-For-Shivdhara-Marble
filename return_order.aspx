<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="return_order.aspx.cs" Inherits="marble.return_order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return Order</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.form-control:focus {
    border-color: #007bff;
    outline: none;
}

.btn {
    display: inline-block;
    padding: 10px 15px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
}

.btn:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <div class="container">
        <h1>Return Order</h1>
        <form id="form1" runat="server" class="return-form">
             <div class="form-group">
                <label for="OrderId">Return ID:</label>
                <asp:TextBox ID="ReturnId" runat="server" CssClass="form-control" required="required" />
            </div>
            <div class="form-group">
                <label for="OrderId">Order ID:</label>
                <asp:TextBox ID="OrderId" runat="server" CssClass="form-control" required="required" />
            </div>
             <div class="form-group">
                <label for="OrderId">Product ID:</label>
                <asp:TextBox ID="proid" runat="server" CssClass="form-control" required="required" />
            </div>
            <div class="form-group">
                <label for="ReturnDate">Return Date:</label>
                <asp:TextBox ID="ReturnDate" runat="server" CssClass="form-control" TextMode="Date" required="required"/>
            </div>
            <div class="form-group">
                <label for="Reason">Reason:</label>
                <asp:TextBox ID="Reason" runat="server" TextMode="MultiLine" CssClass="form-control" required="required"/>
            </div>
            <div class="form-group">
                <label for="ReturnQty">Return Quantity:</label>
                <asp:TextBox ID="ReturnQty" runat="server" CssClass="form-control" TextMode="Number" required="required"/>
            </div>
            <div class="form-group">
                <label for="Total">Total:</label>
                <asp:TextBox ID="Total" runat="server" CssClass="form-control" required="required"/>
            </div>
            <asp:Button ID="SubmitButton" runat="server" Text="Submit Return" CssClass="btn btn-primary" OnClick="SubmitButton_Click"/>
        </form>
    </div>
</body>
</html>