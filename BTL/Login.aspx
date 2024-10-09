<%@ Page  Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTL.Login" %>

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
                                <input type="email" class="form-control" id="emailInput" placeholder="name@example.com">
                                <label for="emailInput">Email address</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">
                                <input type="password" class="form-control" id="passInput" placeholder="Password">
                                <label for="passInput">Password</label>
                            </div>
                            <button class="btn btn-primary w-100 py-2" type="submit">Login</button>
                        </div>
                        <div class="m-3 tab-pane fade" id="register-tab-pane" role="tabpanel" aria-labelledby="register-tab" tabindex="0">
                            <div class="form-floating mx-2 mb-2">    
                                <input type="text" class="form-control" id="nameInput" placeholder="Full Name">
                                <label for="nameInput">Full Name</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">    
                                <input type="email" class="form-control" id="emailRegisterInput" placeholder="name@example.com">
                                <label for="emailRegisterInput">Email address</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">
                                <input type="password" class="form-control" id="passRegisterInput" placeholder="Password">
                                <label for="passRegisterInput">Password</label>
                            </div>
                            <div class="form-floating mx-2 mb-2">
                                <input type="password" class="form-control" id="pass2Input" placeholder="Confirm Password">
                                <label for="pass2Input">Confirm Password</label>
                            </div>
                            <div class="input-group w-auto mx-2 mb-2">
                                <label class="input-group-text" for="inputGroupRole">Role</label>
                                <select class="form-select" id="inputGroupRole">
                                    <option disabled selected hidden>Choose role account</option>
                                    <option value="1">Student</option>
                                    <option value="2">Teacher</option>
                                    <option value="3">Manager</option>
                                </select>
                            </div>
                            <button class="btn btn-primary w-100 py-2" type="submit">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
