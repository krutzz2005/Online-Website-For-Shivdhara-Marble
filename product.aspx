<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="marble.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Panel Styling */
        .panel-body {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .panel-body:hover {
            background-color: #f1f1f1;
        }

        /* Form Styling */
        .form-group {
            margin-bottom: 15px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Dropdown Styling */
        .form-control-box {
            width: 200px;
            padding: 8px;
            border: 2px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            text-align: center;
            background-color: #fff;
            cursor: pointer;
            transition: border-color 0.3s ease;
        }

        .form-control-box:focus {
            border-color: #5f98f3;
            outline: none;
        }

        /* Grid-based Product Display */
        .product-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            justify-items: center;
        }

        /* Product Card */
        .product-card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            max-width: 280px;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        /* Product Image */
        .product-image {
            width: 100%;
            max-width: 250px;
            height: auto;
            border-radius: 8px;
            border: 1px solid #5f98f3;
        }

        /* Product Labels */
        .product-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin: 10px 0;
        }

        .product-price {
            font-size: 16px;
            color: #28a745;
            font-weight: bold;
        }

        .product-description {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }

        /* Button Styling */
        .btn {
            padding: 10px 15px;
            background-color: #5f98f3;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #4a83c2;
            transform: scale(1.05);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="Mid">Select Main Category</label>
                <asp:DropDownList ID="Mid" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="productcategory_selectedindex"
                    CssClass="form-control-box">
                </asp:DropDownList>
            </div>
        </form>
    </div>

    <div class="product-container">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1"
            RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="product-card">
                    <asp:Image ID="Image1" runat="server" CssClass="product-image"
                        ImageUrl='<%# ResolveUrl("~/admin/Images/" + Eval("image") )%>'
                        AlternateText="Product Image" />

                    <div class="product-title">
                        <asp:Label ID="main_cnmLabel" runat="server" Text='<%# Eval("main_cnm") %>' />
                    </div>

                    <div class="product-title">
                        <asp:Label ID="sub_cnmLabel" runat="server" Text='<%# Eval("p_nm") %>' />
                    </div>

                    <div class="product-price">
                        ₹<asp:Label ID="Label1" runat="server" Text='<%# Eval("p_price") %>' />
                    </div>

                    <div class="product-description">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("p_des") %>' />
                    </div>

                    <a href='addto.aspx?p_id=<%#Eval("p_id")%>' class="btn">Buy Now</a>
                    <a href='or.aspx?p_id=<%#Eval("p_id")%>' class="btn">Order Now</a>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:mycon %>"
        SelectCommand="SELECT [main_cnm], [p_id], [p_nm], [p_price], [p_des], [image] FROM [product]">
    </asp:SqlDataSource>

</asp:Content>