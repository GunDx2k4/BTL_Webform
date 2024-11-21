<%@ Page Title="CourseDetail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseDetail.aspx.cs" Inherits="BTL.CourseDetail" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <div class="row">
            <!-- Left Column: Course Details -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <span class="badge bg-primary">
                            <asp:Label ID="lblCategory" runat="server" />
                        </span>
                        <h2 class="mt-2">
                            <asp:Label ID="lblCourse" runat="server" />
                        </h2>
                        <div class="d-flex text-muted small">
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="me-4 mb-4">
                            <div class="fs-3 fw-bold">
                                <i class="bi bi-person me-1">Giảng viên:
                                    <asp:Label ID="lblInstructor" runat="server" />
                                </i>
                            </div>
                            <asp:Label ID="lblDescription" runat="server" />
                        </div>
                        <asp:Repeater ID="rptLectures" runat="server">
                            <ItemTemplate>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center mb-3">
                                            <div>
                                                <p class="mb-0 fw-bold"><%# Eval("sName") %></p>
                                            </div>
                                        </div>
                                        <p>Bắt đầu : <%# Eval("dStart") %></p>
                                        <p>Kết thúc : <%# Eval("dEnd") %></p>

                                        <asp:HyperLink ID="lnkCourseTitle" runat="server" NavigateUrl='<%# Eval("sUrl") %>' CssClass="text-decoration-none">
                                            Link : <%# Eval("sUrl") %>
                                        </asp:HyperLink>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <!-- Right Column: Purchase and Recently Viewed -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="aspect-ratio ratio ratio-16x9 bg-muted rounded mb-4 d-flex justify-content-center align-items-center">
                            <asp:Image ID="imgCourse" runat="server" CssClass="card-img-top" AlternateText="Course Image" />
                        </div>
                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary w-100 mb-2" Text="Đăng ký" OnClick="btnRegister_Click" />
                        <div class="text-muted small">
                            <div class="d-flex justify-content-between">
                                <span>Bài giảng</span>
                                <asp:Label ID="lblCoutLectures" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
