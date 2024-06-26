<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="ParkingSystem.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
         <div class="row">
             <div class="col-md-6 mx-auto">
                 <div class="card">
                     <div class="card-body">
                      
                       <div class="row">
                           <div class="col">
                               <center>
                                   <img src="images/adminlogo.jpeg" width="150px" />
                               </center>
                           </div>
                       </div>

                       <div class="row">
                           <div class="col">
                               <center>
                                   <h3>Admin Login</h3>
                               </center>
                           </div>
                       </div>

                       <div class="row">
                           <div class="col">
                              <hr />
                           </div>
                       </div>

                       <div class="row">
                           <div class="col">
                               <label>Admin ID</label>
                               <div class="form-group">
                                   <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Admin ID"></asp:TextBox>
                               </div>

                               <label>Password</label>
                               <div class="form-group">
                                   <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" placeholder="Password" Enabled="True" TextMode="Password"></asp:TextBox>
                                   <br />
                               </div>
                           </div>
                       </div>
                      
                     <div class="row">
                         <div class="col">
                            <div class="d-grid">
                               <asp:Button class="btn btn-outline-primary btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button2_Click" />
                            </div>
                         </div>
                     </div>
                         <br />
                   </div>
               </div>
                 
                     <a href="homepage.aspx"><< Back to Home</a>
                
             </div>
         </div>
     </div>

</asp:Content>
