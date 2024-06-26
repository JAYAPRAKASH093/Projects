<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="vehiclelist.aspx.cs" Inherits="ParkingSystem.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="col-md-8 mx-auto">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4> Parked Vehicle Page</h4>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:parkingsystemdbConnectionString %>" SelectCommand="SELECT * FROM [vehicle_details_tbl]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                    <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="vehicle_number" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="vehicle_number" HeaderText="Vehicle Number" ReadOnly="True" SortExpression="vehicle_number" />
                                <asp:BoundField DataField="vehicle_type" HeaderText="Vehicle Type" SortExpression="vehicle_type" />
                                <asp:BoundField DataField="owner_name" HeaderText="Owner Name" SortExpression="owner_name" />
                                <asp:BoundField DataField="phone_number" HeaderText="Phone Number" SortExpression="phone_number" />
                                <asp:BoundField DataField="model_maker" HeaderText="Model Maker" SortExpression="model_maker" />
                                <asp:BoundField DataField="insurance" HeaderText="insurance upto" SortExpression="insurance" />
                                <asp:BoundField DataField="slot_start_time" HeaderText="Slot Start Time" SortExpression="slot_start_time" />
                                <asp:BoundField DataField="slot_end_time" HeaderText="Slot End Time" SortExpression="slot_end_time" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div> 
        <a href="homepage.aspx">&lt;&lt; Back to Home</a><br /> 
        <br />
    </div>
</asp:Content>

