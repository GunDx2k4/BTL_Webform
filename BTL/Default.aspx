<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BTL._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary bg-body">
            <div class="col-md-0 p-lg-5 my-2">
                <h1 class="display-3 fw-bold">Welcome to Acme <br> Learning Management System</h1>
                <h3 class="fw-normal text-muted mb-3">Empower your learning journey with our state-of-the-art LMS. <br> Access courses, track progress, and achieve your goals.</h3>
            </div> 
            <div class="d-flex gap-3 justify-content-center lead fw-normal">
                <a href="#" class="btn btn-primary">Get Started</a>
            </div>
        </div>

        <div class=" bg-light py-5">
            <div class="text-center col-md-0 p-lg-5 my-3">
                <h1 class="display-3 fw-bold">Key Features</h1>
            </div>
            
            <div class="container d-flex justify-content-center my-4">
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
