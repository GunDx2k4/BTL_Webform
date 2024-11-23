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
                                                                <asp:HyperLink ID="lnkCourseTitle" runat="server" NavigateUrl='<%# "CourseDetail.aspx?CourseID=" + Eval("Id") %>' CssClass="text-decoration-none">
                                                                    <%# Eval("Name") %>
                                                                </asp:HyperLink>
                                                            </h5>
                                                            <p class="card-text"><strong>Giảng viên:</strong> <%# Eval("Instructor") %> </p>
                                                            <p class="card-text"><%# Eval("Description") %></p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div class="text-center mt-4 mb-4">
                                    <asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl='<%# "Courses.aspx?CategoryID=" + ((BTL.Models.Category)Eval("Key")).Id %>' CssClass="btn btn-primary view-more-btn">
                                        Xem thêm
                                    </asp:HyperLink>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>


        </div>
    </main>
</asp:Content>
