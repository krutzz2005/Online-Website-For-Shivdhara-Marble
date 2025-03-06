<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget pass.aspx.cs" Inherits="marble.forget_pass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <style>
        /* General styles */
body {
    font-family: Calibri, sans-serif;
    background-color: #f4f7fc;
    margin: 0;
    padding: 0;
}

/* Center the form on the page */
table {
    margin: 50px auto;
    border-collapse: collapse;
    width: 70%;
}

/* Style the header */
.auto-style1 {
    background-color: #3498db;
    color: white;
    padding: 15px;
    text-align: center;
}

h1 {
    font-size: 30px;
    margin: 0;
}

/* Style for the labels */
label {
    font-size: 16px;
    margin-bottom: 10px;
    display: block;
}

/* Style for the form elements */
input[type="text"], select {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 100%;
    max-width: 250px;
}

/* Style for buttons */
button, .btn {
    background-color: #3498db;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover, .btn:hover {
    background-color: #2980b9;
}

/* Style for the image */
img {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
}

/* Styling for the required field validators */
span[style*="color:Red"] {
    color: #e74c3c;
    font-size: 12px;
}

/* Style for the reset button */
#b2 {
    background-color: maroon;
}

#b2:hover {
    background-color: #c0392b;
}

/* Table cell adjustments */
td {
    padding: 10px;
}

/* Center the input and button fields */
.auto-style2 {
    text-align: center;
}

/* Small adjustments for spacing */
br {
    margin-bottom: 20px;
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

        .auto-style2 {
            width: 199px;
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
                  .cart1 
        {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            height: 47px; 
            width: 54px;
        }
         
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="Container">
        <div class="Navigation">
            

        </div>
    
        <div>
            <br />
             <table align="center" border="0">
                <tr>
                    <th colspan="3" class="auto-style1">
                        <h1 style="font-family:Calibri">Forget Password</h1>
                        <asp:ValidationSummary ID="vs1" ShowMessageBox="true" runat="server" ShowSummary="false" />
                        
                    </th>                    
                </tr>
                  <tr>
                    <td rowspan="5">
                        <img src="img/forget pass.jpg" style="height: 311px; width: 251px; border:inset;"  />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="l1" runat="server" Text="UserName :-"></asp:Label>
                    </td>
                    <td align="center" class="auto-style2">
                        <asp:TextBox ID="t1" runat="server" Height="28px" Width="164px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Enter UserName " Display="None" ControlToValidate="t1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="l2" runat="server" Text="Choose Question :-"></asp:Label>
                    </td>
                    <td align="center" class="auto-style2">
                        <asp:DropDownList ID="que" runat="server" Height="62px" Width="164px">
                                                    <asp:ListItem>----Select----</asp:ListItem>
                                                    <asp:ListItem>Your favourite book ? </asp:ListItem>
                                                    <asp:ListItem>Your favourite teacher ? </asp:ListItem>
                                                    <asp:ListItem>Your Car Number?</asp:ListItem>
                                                    <asp:ListItem>Your favourite hobby ?</asp:ListItem>
                                            </asp:DropDownList>  
                 
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Answer :-"></asp:Label>
                    </td>
                    <td align="center" class="auto-style2">
                        <asp:TextBox ID="t2" runat="server" Height="28px" Width="164px"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Answer" Display="None" ControlToValidate="t2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                     <td colspan="2" align="center"><br />
                        <asp:Label ID="l3" runat="server"></asp:Label><br />
                        <asp:Button ID="b1" runat="server" Text="Submit" CssClass="btn" Height="50px" Width="97px" OnClick="btn_login"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="b2" runat="server" Text="Reset" CssClass="btn" OnClick="btn_reset"  Height="50px" Width="97px" />
                        
                    </td>
                </tr>
            </table>
    
    </div>
        <br />
            <p style="text-align:center; color:#aaa; font-size: x-large;">
             <a href="home.aspx" class="ft" >Home</a>|
             <a href="about.aspx" class="ft">About Us</a>|
             <a href="View.aspx" class="ft">View</a>|
             <a href="Feedback.aspx" class="ft">Contact Us</a>|
             </p>
            <p class="footer-copy">Copyright @ 2021 All Rights Reserved | Designed By :- <a href="Default.aspx" style="color:white">Munjapara mosam,Vegad krupa,Sejpal kruti</a></p>
    
    </div>
    </form>
</body>
</html>