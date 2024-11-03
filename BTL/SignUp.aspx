<%@ Page Title="SignUp" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="BTL.SignUp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-lg-6 d-md-flex align-items-center justify-content-center bg-primary bg-opacity-10 vh-lg-100">
                    <div class="p-3 p-lg-5">
                        <div class="text-center">
                            <h2 class="fw-bold">Welcome to Acme Learning Management System</h2>
                            <p class="mb-0 h6 fw-light">Let's learn something new today!</p>
                        </div>
                        <img src="/Assets/thumbnail_login.svg" class="mt-5" />
                    </div>
                </div>

                <div class="col-12 col-lg-6 m-auto">
                    <div class="row my-5">
                        <div class="col-sm-10 col-xl-8 m-auto">
                            <h1 class="fs-2">Sign up to get started</h1>

                            <div class="mb-4">
                                <label for="nameInput">Full Name</label>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
                                        <i class="bi bi-person-fill"></i>
                                    </span>
                                    <input type="text" style="max-width: 100% !important;" class="form-control border-0 bg-light rounded-end ps-1" id="nameInput" placeholder="Your Name" />
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="emailInput">Email address</label>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
                                        <i class="bi bi-envelope-fill"></i>
                                    </span>
                                    <input type="email" style="max-width: 100% !important;" class="form-control border-0 bg-light rounded-end ps-1" id="emailInput" placeholder="name@example.com" />
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="passInput">Password</label>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
                                        <i class="bi bi-lock-fill"></i>
                                    </span>
                                    <input type="password" style="max-width: 100% !important;" class="form-control border-0 bg-light rounded-end ps-1" id="passInput" placeholder="Password" />
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="passConfirmInput">Confirm Password</label>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
                                        <i class="bi bi-lock-fill"></i>
                                    </span>
                                    <input type="password" style="max-width: 100% !important;" class="form-control border-0 bg-light rounded-end ps-1" id="passConfirmInput" placeholder="Password" />
                                </div>
                            </div>

                            <div class="align-items-center mt-0">
                                <div class="d-grid">
                                    <button class="btn btn-primary mb-0" type="button">Sign Up</button>
                                </div>
                            </div>

                            <div class="mt-4 text-center">
                                <span>Already have an account? <a href="/Login">Login</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

