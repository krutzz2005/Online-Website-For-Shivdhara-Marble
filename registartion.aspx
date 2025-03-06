<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registartion.aspx.cs" Inherits="marble.registartion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        /* Basic Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

/* Container Style */
.Container {
    max-width: 900px;
    margin: 30px auto;
    padding: 40px;
    background-color: #9fdbf0;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

/* Title Styling */
h1 {
    text-align: center;
    font-size: 32px;
    color: #333;
    margin-bottom: 30px;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 15px;
}

/* Table cells */
td {
    padding: 12px;
    vertical-align: middle;
}

/* Labels Styling */
asp\:Label {
    font-size: 16px;
    color: #555;
    font-weight: 600;
    display: block;
    margin-bottom: 5px;
}

/* Input Fields and TextBoxes */
asp\:TextBox, asp\:DropDownList, input[type="text"], input[type="password"] {
    width: 100%;
    padding: 12px;
    font-size: 14px;
    color: #333;
    border: 2px solid #ccc;
    border-radius: 5px;
    margin-bottom: 20px;
    background-color: #f9f9f9;
    transition: border 0.3s ease;
}

asp\:TextBox:focus, asp\:DropDownList:focus, input[type="text"]:focus, input[type="password"]:focus {
    border-color: #007bff;
    background-color: #eaf2fc;
}

/* Multi-line TextBox (Address) */
asp\:TextBox[TextMode="MultiLine"] {
    height: 100px;
    resize: vertical;
}

/* Dropdown List Styling */
asp\:DropDownList {
    background-color: #fff;
    border-color: #ccc;
    padding: 12px;
    font-size: 14px;
}

/* Radio Button Group */
asp\:RadioButton {
    margin-right: 15px;
    margin-bottom: 10px;
}

/* Error Messages */
asp\:RequiredFieldValidator, asp\:RegularExpressionValidator, asp\:CompareValidator {
    color: #d9534f;
    font-size: 14px;
    margin-top: -15px;
    margin-bottom: 20px;
}

/* Captcha Section */
.captcha-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 25px;
}

#captchaText {
    font-weight: bold;
    font-size: 18px;
    color: #007bff;
}

/* Button Styles */
button, asp\:Button {
    padding: 12px 25px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: 20px;
}

button:hover, asp\:Button:hover {
    background-color: #0056b3;
}

/* Clear Button Style */
#Button2 {
    background-color: #28a745;
    transition: background-color 0.3s ease;
}

#Button2:hover {
    background-color: #218838;
}

/* Footer Styling (Button row) */
td[colspan="3"] {
    text-align: center;
}

/* Optional margin adjustment for text inputs */
input[type="text"], input[type="password"], asp\:TextBox {
    margin-top: 10px;
}

/* Style for Select DropDown */
asp\:DropDownList {
    padding: 12px;
    font-size: 14px;
    border-radius: 5px;
}

/* Overall Form Alignment */
form {
    display: flex;
    flex-direction: column;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    .Container {
        padding: 20px;
    }

    h1 {
        font-size: 28px;
    }

    asp\:TextBox, asp\:DropDownList, input[type="text"], input[type="password"] {
        width: 100%;
    }

    button, asp\:Button {
        font-size: 14px;
    }
}


            
        .auto-style1 {
            width: 318px;
        }
        .auto-style2 {
            width: 425px;
        }


            
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div>
    <div class="Container">
           
         
    
        
            <div>
                
                <table align="center" border="0" style="border-image-source:initial;">
                    <tr>
                        <th colspan="3"><br /><br />
                            <h1>Create New Account</h1>
                            <asp:ValidationSummary ID="vs1" runat="server" ShowMessageBox="true" ShowSummary="false"/>
                            <br />
                        </th>
                    </tr>
                   
                        <td align="right" class="auto-style2">
                            <asp:Label ID="Label4" runat="server" Text="Registration Id :-"></asp:Label>
                        </td>
                        <td align="center" class="auto-style1">
                            <asp:TextBox ID="TextBox1" runat="server" Height="28px" Width="164px" ></asp:TextBox>
                         </td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="#ff0000" Display="None" ControlToValidate="fnm"></asp:RequiredFieldValidator>
                        </td>
                       
                    
                    </tr>
                     <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="ll1" runat="server" Text="Title :-"></asp:Label>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="t1" runat="server" Height="30px" Width="169px">
                                <asp:ListItem>----Select----</asp:ListItem>
                                <asp:ListItem>Mr</asp:ListItem>
                                <asp:ListItem>Mrs</asp:ListItem>
                                <asp:ListItem>Ms</asp:ListItem>                            
                    </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l1" runat="server" Text="FirstName :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="fnm" runat="server" Height="28px" Width="164px" ></asp:TextBox>
                         </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" ForeColor="#ff0000" Display="None" ControlToValidate="fnm"></asp:RequiredFieldValidator>
                        </td>
                       
                    </tr>
                     <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l2" runat="server" Text="LastName :-"></asp:Label>
                        </td>
                        <td align="center" class="auto-style1">
                            <asp:TextBox ID="lnm" runat="server" Height="28px" Width="164px" ></asp:TextBox></td>
                         <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="*" ForeColor="#ff0000" Display="None" ControlToValidate="lnm"></asp:RequiredFieldValidator>
    
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l3" runat="server" Text="Gender :-"></asp:Label>
                        </td>
                         <td style="padding-bottom:3%;" align="center">
                                                    <asp:RadioButton ID="rb1" runat="server" GroupName="g" OnCheckedChanged="rb1_CheckedChanged" Text="Male" />
                                                    <br />
                                                    <asp:RadioButton ID="rb2" runat="server" GroupName="g" OnCheckedChanged="rb2_CheckedChanged" Text="Female" />
                                                    <br />
                                                    <asp:RadioButton ID="rb3" runat="server" GroupName="g" OnCheckedChanged="rb3_CheckedChanged" Text="Other" />
                                                </td>
    
                    </tr>
                    <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l4" runat="server" Text="Address :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="add1" runat="server" Height="35px" Width="164px" TextMode="MultiLine"></asp:TextBox>
                        </td>                       
                        <td>
                            <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="add1" ForeColor="#ff0000" Display="None" ErrorMessage="Must be Required Address">*</asp:RequiredFieldValidator>
    
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l5" runat="server" Text="City :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="c1" runat="server" Height="28px" Width="164px"></asp:TextBox>                       
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="c1" Display="None" ForeColor="#ff0000" ErrorMessage="Enter City">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l6" runat="server" Text="Contact No. :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="cn1" runat="server" Height="28px" Width="164px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv6" runat="server" ErrorMessage="Contact No. Must be Required" Display="None" ControlToValidate="cn1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="re6" runat="server" ErrorMessage="Only 10 Number"  Display="None" ControlToValidate="cn1" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="Label1" runat="server" Text="UserName :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="unm" runat="server" Height="28px" Width="164px"></asp:TextBox>
                        </td>
                         <td>
                            <asp:RequiredFieldValidator ID="rff" runat="server" ErrorMessage="*" ForeColor="#ff0000" Display="None" ControlToValidate="unm"></asp:RequiredFieldValidator>
    
                        </td>
                     <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l7" runat="server" Text="G-mail :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="g1" runat="server" Height="28px" Width="164px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rgv7" runat="server" ErrorMessage="Please ! Enter your G-mail" Display="None" ControlToValidate="g1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="re7" runat="server" ErrorMessage="Using @ and ." Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="g1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
    
    <td align="right" class="auto-style2">
                            <asp:Label ID="l8" runat="server" Text="Password :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="p1" runat="server" Height="28px" Width="164px" TextMode="Password"></asp:TextBox>
                        </td>
                         <td>
                            <asp:RequiredFieldValidator ID="rfv8" runat="server" ErrorMessage="Enter Password" ControlToValidate="p1" Display="None"></asp:RequiredFieldValidator>
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style2">
                            <asp:Label ID="l9" runat="server" Text="Confirm-Password :-"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="cp1" runat="server" Height="28px" Width="164px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv9" runat="server" ErrorMessage="Enter Confirm-Password" ControlToValidate="cp1" Display="None"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="p1" ControlToValidate="cp1" ErrorMessage="Please ! Enter Correct Password"></asp:CompareValidator>
                        </td>
                    </tr>
    
                   
                    <tr>                  
                            <td align="right" class="auto-style2">
                            <asp:Label ID="Label2" runat="server" Text="Choose Question:-"></asp:Label>
                        </td>
                        <td align="center">
                             <asp:DropDownList ID="que" runat="server" Height="50px" Width="164px">
                                                        <asp:ListItem>----Select----</asp:ListItem>
                                                        <asp:ListItem>Your favourite book ? </asp:ListItem>
                                                        <asp:ListItem>Your favourite teacher ? </asp:ListItem>
                                                        <asp:ListItem>Your Car Number?</asp:ListItem>
                                                        <asp:ListItem>Your favourite hobby ?</asp:ListItem>
                                                </asp:DropDownList>  
                        </td>
                        
                    </tr>
                        <tr>
                            <td align="right" class="auto-style2">
                            <asp:Label ID="Label3" runat="server" Text="Answer:-"></asp:Label></td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="ans" runat="server" Height="28px" Width="164px"></asp:TextBox></td>
                        </tr>
                    </tr>
                    <br />
                    <tr>
                        
                        <td align="right" class="auto-style2">
                    <div class="captcha-container">
                <asp:Label ID="Label5" runat="server">Captcha</asp:Label></td><td align="right">
                <span id="captchaText" runat="server" style="font-weight:bold;"></span>
            </div>
            <input type="text" id="txtCaptcha" runat="server" required />
            <button type="button" onclick="generateCaptcha()">Refresh Captcha</button></td>
                        </tr>
           

                    <tr>
                        <td  align="center" colspan="3">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;

                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="submit" />
&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" Text="clear" />
                            <br />
                           
                        </td>
                        
                    </tr>                       
                
            
                </table>
                <br />
               
        </div>      
            
    </div>
    
    </div>
    </form>
     <script>
         function generateCaptcha() {
             var captcha = Math.random().toString(36).substring(2, 8);
             document.getElementById('<%= captchaText.ClientID %>').innerText = captcha;
         }

         // Initialize CAPTCHA on page load
         window.onload = function () {
             generateCaptcha();
         };
    </script>
   

</body>
</html>