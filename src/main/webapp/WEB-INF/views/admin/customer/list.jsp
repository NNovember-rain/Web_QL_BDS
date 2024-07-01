<%--
Created by IntelliJ IDEA.
User: admin
Date: 3/2/2024
Time: 9:13 AM
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sercurity" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="CustomerURL" value="/admin/customer-list"></c:url>
<c:url var="buildingAPI" value="/api/building"></c:url>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="main-content" id="main-content">

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->

            </div>
            <div class="page-content">

                <div class="page-header">
                    <h1>
                        Dashboard
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm Kiếm</h5>
                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style="display: block; font-family:'Times New Roman', Times, serif ;">
                                <div class="widget-main">
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${CustomerURL}" method="GET" >
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-sm-3">
                                                        <label class="name">Tên khách hàng</label>
                                                        <form:input class="form-control" path="fullName"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Di động</label>
                                                        <form:input class="form-control" path="phone"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Email</label>
                                                        <form:input class="form-control" path="email"/>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <label class="name">Nhân viên</label>
                                                        <form:select  class="form-control" path="staffId">
                                                            <form:option value="">---Chọn nhân viên---</form:option>
                                                            <form:options items="${listStaff}"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-sm-6">
                                                        <button type="button" class="btn btn-primary" id="btnSearchCustomer">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                            </svg>
                                                            Tìm Kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </form:form>

                                </div>
                            </div>
                        </div>

                        <div class="table-btn-controls" class="pull-right" style="margin-right:18px; margin-top: 20px;">
                            <div class="pull-right tableTools-container">
                                <div class="dt-buttons btn-overlap btn-group">
                                    <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip" title="Thêm người dùng" href='/admin/customer-edit'>
                                        <span><i class="fa fa-plus-circle bigger-110 purple"></i></span>
                                    </a>
                                    <sercurity:authorize access="hasRole('MANAGER')">
                                        <button id="btnDeleteCustomer" type="button"
                                            class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title="Xóa người dùng">
                                            <span> <i class="fa fa-trash-o bigger-110 pink"></i> </span>
                                        </button>
                                    </sercurity:authorize>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

                <!-- BẢNG DANH SACH -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-responsive" >
                            <display:table name="listCustomer" requestURI="${customerURL}"
                                           id="tableList" pagesize="${model.maxPageItems}"
                                           class="table table-striped table-bordered table-hover"
                                           style="text-align: center;">
                                <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column property="fullName" title="Tên khách hàng" headerClass="center"/>
                                <display:column property="phone" title="Số điện thoại" headerClass="center"/>
                                <display:column property="email" title="Email" headerClass="center"/>
                                <display:column property="demand" title="Nhu cầu" headerClass="center"/>
                                <display:column property="createdBy" title="Người thêm" headerClass="center"/>
                                <display:column property="createdDate" title="Ngày thêm" headerClass="center"/>
                                <display:column property="status" title="Tình trạng" headerClass="center"/>
                                <display:column title="Thao tác" headerClass="center">
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <sercurity:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentCustomer(${tableList.id})" name="customerid">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </button>
                                        </sercurity:authorize>

                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/customer-edit-${tableList.id}">
                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                        </a>
                                        <sercurity:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteCustomer(${tableList.id})">
                                                <i class="ace-icon glyphicon glyphicon-trash"></i>
                                            </button>
                                        </sercurity:authorize>
                                    </div>

                                    <div class="hidden-md hidden-lg">
                                        <div class="inline pos-rel">
                                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                            </button>

                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                <li>
                                                    <a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
                                        <span class="blue">
                                            <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                        </span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
                                        <span class="green">
                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                        </span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                        <span class="red">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </display:column>
                            </display:table>
                        </div>
                    </div>

                </div><!-- /.page-content -->
                <!-- /.page-content -->
            </div>
        </div>
    </div>
</div>
<!-- /.main-container -->
<div class="modal fade" id="assignmentCustomerModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table  class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="customerId" value="" name="customerId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnassignmentCustomer">Giao nhân viên</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>


    function assignmentCustomer(customerId){
        $('#assignmentCustomerModal').modal();
        loadStaff(customerId);
        $('#customerId').val(customerId)
    }
    function loadStaff(customerId){
        $.ajax({
            type:"GET",
            url: '/customer/'+ customerId + "/staffs",
            // data: JSON.stringify(data),
            contentType:"application/json",
            dataType:"JSON",
            success:function(response){
                console.log("success")
                var row='';
                $.each(response.data,function (index,item){
                    row+='<tr>';
                    row+='<td class="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_"' + item.staffId +" "+ item.checked+'/></td>';
                    row+='<td class="text-center">'+item.fullName+'</td>';
                    row+='</tr>';
                });
                $('#staffList tbody').html(row);
                console.log("ok");
            },
            error:function(response){
                console.log("failed")
                window.location.href="<c:url value="/admin/customer-list?massage=erro"></c:url>";
                console.log(respond)
            }
        });
    }

    function updateCustomer(item,id){
        $.ajax({
            type:"Get",
            url: '${buildingAPI}/'+"-edit-"+id,
            data: JSON.stringify(item),
            contentType:"application/json",
            dataType:"JSON",
            success:function(respond){
                console.log("success")
            },
            error:function(respond){
                console.log("failed")
                console.log(respond)
            }
        });
    }



    $('#btnassignmentCustomer').click(function(e){
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] != ''){
            UpdateAssignmentCustomer(data);
            alert("Giao nhân viên thành công !");
        }
        else alert("Hãy chọn ít nhất 1 nhân viên !");

    })




    function UpdateAssignmentCustomer(data){
        $.ajax({
            type: "POST",
            url: "/customer/" + 'assignment',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response) {
                <%--window.location.href = "<c:url value="/admin/building-list"/>"--%>
                console.info("success")
            },
            error: function(response){
                console.info("Giao không thành công")
                <%--window.location.href = "<c:url value="/admin/building-list" />"--%>
            }
        });
    }


    $('#btnSearchCustomer').click(function (e){
        e.preventDefault(); // khi ta tìm kiếm hay gì đó thì cái đầu api luôn giữ nguyên chỉ có thêm yêu cầu đằng sau (phần thay đổi), thằng này giúp cho chúng ta tránh call nhầm api.
        $('#listForm').submit()
    });

    function deleteCustomer(data){
        var customerId=[data];
        alert("Xóa thành công !")
        window.location.href="<c:url value="/admin/customer-list"></c:url>";
        deleteCustomers(customerId);
    }

    $('#btnDeleteCustomer').click(function(e){
        e.preventDefault();
        var data={};
        var check=false;
        var customerIds=$('#tableList').find('tbody input[type=checkbox]:checked').map(function(){
            check=true;
            return $(this).val();
        }).get();
        deleteCustomers(customerIds)
        if(customerIds!=null && check==true) {
            alert("Xóa tòa nhà thành công !")
            window.location.href = "<c:url value="/admin/customer-list"></c:url>";
        }
    })
    function deleteCustomers(data){
        $.ajax({
            type:"Delete",
            url: '/admin/customer/'+data.join(","),
            data: JSON.stringify(data),
            contentType:"application/json",
            dataType:"JSON",
            success:function(respond){
                console.log("success")
            },
            error:function(respond){
                console.log("failed")
                console.log(respond)
            }
        });
    }


</script>
</body>
</html>
