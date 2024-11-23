﻿<%@ Page Title="Instructor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="BTL.Instructor" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-2">
        <div class="row">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-2 mt-4">
                <div class="d-flex align-items-center mb-3 mb-md-0">
                    <img src="https://placehold.co/80x80" class="rounded-circle me-3">
                    <div>
                        <h1 class="h3 fw-bold">
                            <asp:Label ID="lblInstructorName" runat="server" />
                        </h1>
                        <p class="text-muted">
                            <asp:Label ID="lblInstructorEmail" runat="server" />
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="card">
                        <div class="card-body text-center">
                            <h6 class="card-title">Khóa học đang dạy</h6>
                            <p class="card-text fs-3 fw-bold">
                                <asp:Label ID="lblTotalCourses" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2">
                    <asp:HyperLink ID="lnkCreateCourse" runat="server" NavigateUrl="NewCourse" CssClass="btn btn-primary view-more-btn">
                        Tạo khóa học mới
                    </asp:HyperLink>
                </div>

            </div>
            <div class="py-5">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="card-title mb-1">Lịch dạy</h5>
                            <p class="card-text text-muted">Xem lịch dạy tuần này</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row row-cols-7 row-cols-md-7 g-3" id="week-days">
                            <asp:Repeater ID="rptSchedule" runat="server" OnItemDataBound="rptSchedule_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col">
                                        <div class="card h-100">
                                            <div class="card-header text-center">
                                                <%# Eval("Date") %>
                                                <p class="text-muted">
                                                    <%# Eval("DayOfWeek") %>
                                                </p>
                                            </div>
                                            <div class="card-body">
                                                <asp:Repeater ID="rptScheduleDetail" runat="server">
                                                    <ItemTemplate>
                                                        <div class="mb-3 p-2 bg-light rounded">
                                                            <h6 class='fw-bold mb-1'><%# Eval("NameCourse")  %></h6>
                                                            <p class='text-muted mb-1'><%# Eval("Lecture")  %></p>

                                                            <p class="text-muted mb-1">
                                                                <%# Eval("StatTime")  %> - <%# Eval("EndTime")  %>
                                                            </p>
                                                            <p class="text-muted">
                                                                Trạng thái: <%# Eval("Status") %>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>


            <div class="col-12">
                <div class="container py-5">
                    <h1 class="text-center mb-4">Khóa học đang dạy</h1>

                    <div class="row mb-4">
                        <div class="col-md-6 mb-2">
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-search"></i></span>
                                <input type="text" id="searchInput" class="form-control" placeholder="Tìm khóa học...">
                            </div>
                        </div>
                    </div>

                    <div class="row g-4">
                        <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
                            <ItemTemplate>
                                <div class="card">
                                    <div class="card-header">
                                        <h2 class="h5 mb-0"><%# ((BTL.Models.Category)Eval("Key")).Name %> </h2>
                                    </div>
                                    <div class="card-body">
                                        <div class="row g-4">
                                            <asp:Repeater ID="rptCourses" runat="server">
                                                <ItemTemplate>
                                                    <div class="col-md-4">
                                                        <div class="card h-100 shadow-sm">
                                                            <asp:Image ID="imgCourse" runat="server" ImageUrl='<%# "./Assets/" + Eval("Img") %>' CssClass="card-img-top" AlternateText="Course Image" />
                                                            <div class="card-body">
                                                                <span class="badge bg-primary mb-2"><%# Eval("Category") %></span>
                                                                <h5 class="card-title">
                                                                    <asp:HyperLink ID="lnkCourseTitle" runat="server" NavigateUrl='<%# "CourseDetail?CourseID=" + Eval("Id") %>' CssClass="text-decoration-none">
                                                                         <%# Eval("Name") %>
                                                                    </asp:HyperLink>
                                                                </h5>
                                                                <p class="card-text"><strong>Giảng viên:</strong> <%# Eval("Instructor") %></p>
                                                                <p class="card-text"><%# Eval("Description") %></p>
                                                            </div>
                                                            <div class="card-footer">
                                                                <asp:HyperLink ID="linkEdit" runat="server" NavigateUrl='<%# "NewCourse?CourseID=" + Eval("Id") %>' CssClass="btn btn-outline-secondary me-2">
                                                                    Chỉnh sửa
                                                                </asp:HyperLink>
                                                                <asp:Button ID="btnDeleteCourse" runat="server" CssClass="btn btn-sm btn-outline-danger" Text="Hủy" OnClick="btnDeleteCourse_Click" CommandArgument='<%# Eval("Id") %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
