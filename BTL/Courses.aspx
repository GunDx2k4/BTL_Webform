<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="BTL.Courses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-8 col-xl-9">
                    <div class="row mb-4 align-items-center">
                        <div class="input-group input-borderless">
                            <input class="form-control me-1" style="max-width: 100% !important;" type="search" placeholder="Find your course" />
                            <button class="btn btn-primary mb-0 rounded z-index-1" type="button">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </div>

                    <div class="row g-4">
                        <asp:Repeater ID="rptCards" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 col-xl-4">
                                    <div class="card shadow h-100">
                                        <img src="https://placehold.co/600x450" class="card-img-top" />
                                        <div class="card-body pb-0">
                                            <div class="d-flex justify-content-between mb-2">
                                                <span class="badge text-bg-primary">Web</span>
                                            </div>
                                            <h5 class="card-title"><a class="text-decoration-none" href="#">Build Responsive Websites with HTML</a></h5>
                                            <h6 class="card-subtitle mb-2 text-body-secondary">Far advanced settling say finished raillery. Offered chiefly farther.</h6>
                                        </div>

                                        <div class="card-footer d-flex pt-2 pb-3">
                                            <i class="bi bi-calendar-fill pe-2"></i>

                                            <p class="m-0">
                                                Start at 1/1/2024 - End 1/5/2024
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="col-lg-4 col-xl-3">
                    <div class="offcanvas-body p-3 p-lg-0">
                        <div class="card card-body shadow p-4 mb-4">
                            <h4 class="mb-3">Category</h4>
                            <div class="col-12">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="chkAll" />
                                        <label class="form-check-label" for="chkAll">All</label>
                                    </div>
                                    <span class="small">(1256)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </main>
</asp:Content>
