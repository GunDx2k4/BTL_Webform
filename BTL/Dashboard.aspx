<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BTL.Dashboard" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class=" bg-body">
            <div class="container">
                <h3>Dashboard</h3>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <div class="col d-flex justify-content-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="bi bi-book"></i>
                                    <h5 class="card-title mb-3">Extensive Course Library</h5>
                                </div>
                                <p class="card-text">Access a wide range of courses across various subjects, from beginner to advanced levels.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col d-flex justify-content-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="bi bi-people"></i>
                                    <h5 class="card-title mb-3">Interactive Learning</h5>
                                </div>
                                <p class="card-text">Engage with instructors and peers through discussion forums, live sessions, and collaborative projects.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col d-flex justify-content-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="bi bi-book"></i>
                                    <h5 class="card-title mb-3">Progress Tracking</h5>
                                </div>
                                <p class="card-text">Monitor your learning progress with detailed analytics and performance insights.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col d-flex justify-content-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="bi bi-award"></i>
                                    <h5 class="card-title mb-3">Certifications</h5>
                                </div>
                                <p class="card-text">Earn recognized certifications upon successful completion of courses and programs.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col d-flex justify-content-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="bi bi-people"></i>
                                    <h5 class="card-title mb-3">Expert Instructors</h5>
                                </div>
                                <p class="card-text">Learn from industry professionals and subject matter experts in their respective fields.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col d-flex justify-content-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="bi bi-book"></i>
                                    <h5 class="card-title mb-3">Personalized Learning Paths</h5>
                                </div>
                                <p class="card-text">Tailored course recommendations based on your goals, interests, and learning history.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
