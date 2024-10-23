<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTL.Login" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <div class="bg-body d-flex justify-content-center p-5">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Welcome to Acme LMS</h5>
                    <h6 class="card-subtitle mb-2 text-body-secondary">Login or create an account to get started</h6>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login-tab-pane" type="button" role="tab" aria-controls="login-tab-pane" aria-selected="true">Login</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register-tab-pane" type="button" role="tab" aria-controls="register-tab-pane" aria-selected="false">Register</button>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div class="m-3 tab-pane fade show active" id="login-tab-pane" role="tabpanel" aria-labelledby="login-tab" tabindex="0">
                            <div class="form-floating mx-2 mb-2">
                                <asp:TextBox type="email" class="form-control" ID="txtEmail" runat="server" placeholder="name@example.com" />
                                <label for="txtEmail">Email address</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">
                                <asp:TextBox type="password" class="form-control" ID="txtPass" runat="server" placeholder="Password" />
                                <label for="txtPass">Password</label>
                            </div>
                            <asp:Button class="btn btn-primary w-100 py-2" type="submit" Text="Login" runat="server" OnClick="btnSubmit_Click" />
                        </div>
                        <div class="m-3 tab-pane fade" id="register-tab-pane" role="tabpanel" aria-labelledby="register-tab" tabindex="0">
                            <div class="form-floating mx-2 mb-2">
                                <asp:TextBox type="text" class="form-control" ID="txtNameRegister" runat="server" placeholder="Full Name" />
                                <label for="txtNameRegister">Full Name</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">
                                <asp:TextBox type="text" class="form-control" ID="txtEmailRegister" runat="server" placeholder="name@example.com" />
                                <label for="txtEmailRegister">Email address</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">
                                <asp:TextBox type="text" class="form-control" ID="txtPassRegister" runat="server" placeholder="Password" />
                                <label for="txtPassRegister">Password</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">
                                <asp:TextBox type="text" class="form-control" ID="txtPassConfirmRegister" runat="server" placeholder="Confirm Password" />
                                <label for="txtPassConfirmRegister">Confirm Password</label>
                            </div>
                            <div class="input-group w-auto mx-2 mb-2">
                                <label class="input-group-text" for="inputGroupRole">Role</label>
                                <asp:DropDownList CssClass="form-select" ID="inputGroupRole" runat="server">
                                    <asp:ListItem Value="Student" Text="Student" />
                                    <asp:ListItem Value="Teacher" Text="Teacher" />
                                    <asp:ListItem Value="Administrator" Text="Manager" />
                                </asp:DropDownList>
                            </div>
                            <asp:Button ID="btnRegister" class="btn btn-primary w-100 py-2" type="submit" runat="server" Text="Register" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
