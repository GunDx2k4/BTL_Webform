<%@ Page Title="NewCourse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewCourse.aspx.cs" Inherits="BTL.NewCourse" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3">Khóa học</h1>
            <div>
                <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="Instructor" CssClass="btn btn-outline-secondary me-2">
                        Quay lại
                </asp:HyperLink>
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Lưu" OnClick="btnSave_Click" />
            </div>
        </div>

        <div class="row g-4">

            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Thông tin khóa học</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="txtTitle" class="form-label">Tiêu đề khóa học</label>
                            <asp:TextBox ID="txtTitle" Style="max-width: 100% !important;" runat="server" class="form-control" placeholder="Nhập tiêu đề khóa học" />
                        </div>
                        <div class="mb-3">
                            <label for="txtDescription" class="form-label">Mô tả</label>
                            <asp:TextBox ID="txtDescription" Style="max-width: 100% !important;" runat="server" TextMode="MultiLine" class="form-control" placeholder="Nhập mô tả khóa học" />
                        </div>
                        <div class="mb-3">
                            <label for="ddlCategories" class="form-label">Chủ đề :</label>
                            <asp:DropDownList ID="ddlCategories" Style="max-width: 100% !important;" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Hình ảnh khóa học</h5>
                    </div>
                    <div class="card-body text-center">
                        <asp:Image ID="imgCourse" runat="server" CssClass="card-img-top" AlternateText="Course Image" />
                        <div class="border border-dashed rounded p-4">
                            <label for="fuImage" class="form-label d-flex justify-content-center mb-3">
                                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" accept="image/*" />
                                <asp:Button ID="btnSaveImage" runat="server" CssClass="btn btn-sm btn-primary mb-2" Text="Lưu" OnClick="btnSaveImage_Click" />
                            </label>
                            <small class="text-muted d-block">Chỉ hỗ trợ các tệp JPG, JPEG và PNG. Kích thước đề xuất: 600 × 450px.
                            </small>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title">Bài giảng</h5>
                        <asp:Button ID="btnAddLecture" runat="server" CssClass="btn btn-sm btn-primary" Text="Thêm" OnClick="btnAddLecture_Click" />
                    </div>
                    <div class="card-body">
                        <div class="overflow-auto" style="max-height: 300px;">
                            <div class="list-group">
                                <asp:Repeater ID="rptLecture" runat="server" OnItemDataBound="rptLecture_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="list-group-item d-flex justify-content-between align-items-center mb-2">
                                            <div class="card flex-fill me-3">
                                                <div class="card-header">
                                                    <h5 class="card-title">Thông tin bài giảng</h5>
                                                </div>
                                                <div class="card-body d-flex flex-wrap">
                                                    <div class="mb-3 flex-fill me-3">
                                                        <label for="txtLecture" class="form-label">Tên bài giảng</label>
                                                        <asp:TextBox ID="txtLecture" runat="server" CssClass="form-control" placeholder="Nhập tên bài giảng" Text='<%# Eval("Name") %>' />
                                                    </div>
                                                    <div class="mb-3 flex-fill me-3">
                                                        <label for="txtDateTimeStart" class="form-label">Thời gian bắt đầu</label>
                                                        <asp:TextBox ID="txtDateTimeStart" runat="server" TextMode="DateTimeLocal" CssClass="form-control" Text='<%# ((DateTime)Eval("TimeStart")).ToString("yyyy-MM-ddTHH:mm") %>' />
                                                    </div>
                                                    <div class="mb-3 flex-fill me-3">
                                                        <label for="txtDateTimeEnd" class="form-label">Thời gian kết thúc</label>
                                                        <asp:TextBox ID="txtDateTimeEnd" runat="server" TextMode="DateTimeLocal" CssClass="form-control" Text='<%# ((DateTime)Eval("TimeEnd")).ToString("yyyy-MM-ddTHH:mm") %>' />
                                                    </div>
                                                    <div class="mb-3 flex-fill me-3">
                                                        <label for="ddlStatus" class="form-label">Trạng thái:</label>
                                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                                            <asp:ListItem Text="Học" Value="0" />
                                                            <asp:ListItem Text="Nghỉ" Value="1" />
                                                            <asp:ListItem Text="Học bù" Value="2" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="mb-3 col-12">
                                                        <label for="txtLinkLecture" class="form-label">Link học</label>
                                                        <asp:TextBox ID="txtLinkLecture" Style="max-width: 100% !important;" runat="server" CssClass="form-control" placeholder="Nhập link học" Text='<%# Eval("Url") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <asp:Button ID="btnSaveLecture" runat="server" CssClass="btn btn-sm btn-primary mb-2" Text="Lưu" OnClick="btnSaveLecture_Click" CommandArgument='<%# Container.ItemIndex %>' />
                                                <asp:Button ID="btnDeleteLecture" runat="server" CssClass="btn btn-sm btn-outline-danger" Text="Xóa" OnClick="btnDeleteLecture_Click" CommandArgument='<%# Container.ItemIndex %>' />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
