<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="adminvehiclemanagement.aspx.cs" Inherits="ParkingSystem.adminvehiclemanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Parking Entry Page</h4>
                                    </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100" src="images/parkingdetails.png" />         
                                    </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Vehicle Number</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Vehicle Number"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Vehicle Type</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="Select" Value="Select"/>
                                    <asp:ListItem Text="Two-Wheeler" Value="Two-Wheeler" />
                                    <asp:ListItem Text="Four-Wheeler" Value="Four-Wheeler" />
                                    <asp:ListItem Text="Heavy Moter Vehicles" Value="Heavy Moter Vehicles" />
                                    </asp:DropDownList>
                                </div>
                            </div>  
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Owner Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Owner Name"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label>Phone Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Enter Phone Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-6">
                                <label>Maker/Model</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Model Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Insurance Uptp</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Enter Insurance Expiry date" TextMode="date"></asp:TextBox>
                                </div>
                            </div>
                         </div>
                         <div class="row">
                             <div class="col-md-6">
                               <label> Slot Start Time</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Start Time" TextMode="DateTimeLocal"></asp:TextBox>
                              </div>
                            </div>
                            <div class="col-md-6">
                              <label> Slot End Time</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="End Time" TextMode="DateTimeLocal"></asp:TextBox>
                              </div>
                            </div>
                             
                       </div>
                        <br />
                        <center>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-outline-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-outline-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-outline-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>
                        </center>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br />
                <br />
            </div>
        </div> 
     </div>
</asp:Content>
