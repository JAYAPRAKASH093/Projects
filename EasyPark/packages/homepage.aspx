<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="ParkingSystem.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section> 
      <center> <img src="images/cars.jpg" height="431" width="50%"/> </center> 
    </section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <center>
                    <h2> Our Primary Features</h2>
                </center>
            </div>
        </div>
        <center>
         <div class="row-6">
            <div class="col-md-4">
                <center><img src="images/vplot.png" width="150px" height="108.75px"/>
                    <h4>Parking Inventory</h4>
                <p class="text-justify">Parking Inventory Contains list of parked vehicles.</p>
                </center>
            </div>

            <div class="col-md-4">
                <center><img src="images/pcars.jpeg" width="150px" height="108.75px"/>
                    <h4>Easy Entry and Exit</h4>
                <p class="text-justify">Easy parking entry and exit. </p>
                </center>
            </div>

            <div class="col-md-4">
                <center><img src="images/vmanagement.jpeg" width="150px" height="108.75px"/>
                    <h4> Large Parking Space</h4>
                <p class="text-justify">Large Parking Space area to park various type of vehicles.</p>
                </center>
            </div>
        </div>
        </center>
    </div>
</asp:Content>
