<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="BTL.Student" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-2">
                <div class="card bg-transparent card-body pb-0 px-0 mt-2 mt-sm-0">
                    <div class="row d-sm-flex justify-sm-content-between mt-2 mt-md-0">
                        <div class="col d-sm-flex justify-content-between align-items-center">
                            <div>
                                <h1 class="my-1 fs-4">Lori Stevens</h1>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item me-3 mb-1 mb-sm-0">
                                        <span class="h6">123</span>
                                        <span class="text-body fw-light">Courses</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-12">
                <div class="card bg-transparent border rounded-3">
                    <div class="card-header bg-transparent border-bottom">
                        <h3 class="mb-0">My Courses List</h3>
                    </div>
                    <div class="card-body">
                        <div class="row g-3 align-items-center justify-content-between mb-4">
                            <div class="col-md-8">
                                <div class="rounded position-relative">
                                    <input class="form-control pe-5 bg-transparent" style="max-width: 100% !important;" type="search" placeholder="Search" />
                                    <button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="btn-group">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                                        Sort by
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Menu item</a></li>
                                        <li><a class="dropdown-item" href="#">Menu item</a></li>
                                        <li><a class="dropdown-item" href="#">Menu item</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive border-0">
                            <table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" class="border-0 rounded-start">Course Title</th>
                                        <th scope="col" class="border-0">Total Lectures</th>
                                        <th scope="col" class="border-0">Completed Lecture</th>
                                        <th scope="col" class="border-0 rounded-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div>
                                                    <img style="width: 100px !important;" src="https://placehold.co/600x450" class="rounded" />
                                                </div>
                                                <div class="mb-0 ms-2">
                                                    <h6 class="table-responsive-title">
                                                        <a href="#">Building Scalable APIs with GraphQL</a>
                                                    </h6>
                                                    <div class="overflow-hidden">
                                                        <h6 class="mb-0 text-end">75%</h6>
                                                        <div class="progress bg-primary bg-opacity-10">
                                                            <div class="progress-bar bg-primary aos aos-init aos-animate" role="progressbar" data-aos="slide-right" data-aos-delay="200" data-aos-duration="1000" data-aos-easing="ease-in-out" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>5</td>
                                        <td>5</td>
                                        <td><a class="btn btn-sm btn-primary-soft me-1 mb-1 mb-md-0">Continue</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
