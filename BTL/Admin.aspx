<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BTL.Admin" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-2">
        <div class="row">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-2 mt-4">
                <div class="d-flex align-items-center mb-3 mb-md-0">
                    <img src="https://placehold.co/80x80" class="rounded-circle me-3">
                    <div>
                        <h1 class="h3 fw-bold">
                            <asp:Label ID="lblName" runat="server" />
                        </h1>
                        <p class="text-muted">
                            <asp:Label ID="lblEmail" runat="server" />
                        </p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2">
                    <div class="card">
                        <div class="card-body text-center">
                            <h6 class="card-title">Tổng số giảng viên</h6>
                            <p class="card-text fs-3 fw-bold">
                                <asp:Label ID="lblTotalInstructors" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2">
                    <div class="card">
                        <div class="card-body text-center">
                            <h6 class="card-title">Tổng số sinh viên</h6>
                            <p class="card-text fs-3 fw-bold">
                                <asp:Label ID="lblTotalStudents" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2">
                    <div class="card">
                        <div class="card-body text-center">
                            <h6 class="card-title">Tổng số khóa học</h6>
                            <p class="card-text fs-3 fw-bold">
                                <asp:Label ID="lblTotalCourses" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>

            </div>


            <div class="col-12">
                <div class="container py-5">
                    <ul class="nav nav-tabs" id="courseTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="instructors-tab" data-bs-toggle="tab" href="#instructors" role="tab" aria-controls="instructors" aria-selected="true">Giảng viên</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="students-tab" data-bs-toggle="tab" href="#students" role="tab" aria-controls="students" aria-selected="false">Sinh viên</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="courses-tab" data-bs-toggle="tab" href="#courses" role="tab" aria-controls="courses" aria-selected="false">Khóa học</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="categories-tab" data-bs-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="false">Chủ đề</a>
                        </li>
                    </ul>
                    <div class="tab-content mt-3" id="courseTabsContent">
                        <div class="tab-pane fade show active" id="instructors" role="tabpanel" aria-labelledby="instructors-tab">
                            <asp:Repeater ID="rptInstructors" runat="server">
                                <ItemTemplate>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center mb-3">
                                                <div>
                                                    <p class="mb-0 fw-bold"><%# Eval("sNameInstructor") %></p>
                                                    <p class="mb-0"><%# Eval("sEmail") %></p>
                                                </div>
                                            </div>
                                            <p>Tổng số khóa học : <%# Eval("iTotalCourse") %></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane fade" id="students" role="tabpanel" aria-labelledby="students-tab">
                            <asp:Repeater ID="rptStudents" runat="server">
                                <ItemTemplate>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center mb-3">
                                                <div>
                                                    <p class="mb-0 fw-bold"><%# Eval("sNameStudent") %></p>
                                                    <p class="mb-0"><%# Eval("sEmail") %></p>
                                                </div>
                                            </div>
                                            <p>Tổng số khóa học : <%# Eval("iTotalCourse") %></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane fade" id="courses" role="tabpanel" aria-labelledby="courses-tab">
                            <<asp:Repeater ID="rptCourses" runat="server">
                                <ItemTemplate>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center mb-3">
                                                <div>
                                                    <p class="mb-0 fw-bold"><%# Eval("sNameCourse") %></p>
                                                    <p class="mb-0"><%# Eval("sNameCategory") %></p>
                                                    <p class="mb-0"><%# Eval("sNameInstructor") %></p>
                                                </div>
                                            </div>
                                            <p>Tổng số sinh viên : <%# Eval("iTotalStudent") %></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab-pane fade" id="categories" role="tabpanel" aria-labelledby="categories-tab">
                            <div class="mb-3">
                                <label for="txtTitle" class="form-label">Tên chủ đề</label>
                                <asp:TextBox ID="txtTitle" Style="max-width: 100% !important;" runat="server" class="form-control" placeholder="Nhập tên chủ đề" />
                                <asp:Button ID="btnAddCategory" runat="server" CssClass="btn btn-sm btn-primary mb-2" Text="Thêm" OnClick="btnAddCategory_Click" />
                            </div>
                            <asp:Repeater ID="rptCategories" runat="server">
                                <ItemTemplate>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center mb-3">
                                                <div>
                                                    <p class="mb-0 fw-bold"><%# Eval("sNameCategory") %></p>
                                                </div>
                                            </div>
                                            <p>Tổng số khóa học : <%# Eval("iTotalCourse") %></p>
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
