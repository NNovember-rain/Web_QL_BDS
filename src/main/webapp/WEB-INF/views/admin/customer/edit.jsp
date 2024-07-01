<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 3/2/2024
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin khách hàng</title>
</head>
<body>
<div class="main-content" id="main-container">

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
                        Thông tin khách hàng
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                    </div>
                </div>
                <!-- BẢNG DANH SACH -->
                <div class="col-xs-12" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="CustomerEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" >

                                <div class="form-group">
                                    <label class="col-xs-2">Tên Khách hàng</label>
                                    <div class="col-xs-5">
                                        <form:input class="form-control" path="fullName" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-2"> Số điện thoại </label>
                                    <div class="col-xs-5">
                                        <form:input class="form-control" path="phone" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-2">Email</label>
                                    <div class="col-xs-5">
                                        <form:input class="form-control" path="email" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-2">Tên Công ty</label>
                                    <div class="col-xs-5">
                                        <form:input class="form-control" path="companyName" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-2">Nhu cầu</label>
                                    <div class="col-xs-5">
                                        <form:input class="form-control" path="demand" />
                                    </div>
                                </div>

<%--                                <div class="form-group">--%>
<%--                                    <label class="col-xs-2">Tình trạng</label>--%>
<%--                                    <div class="col-xs-5">--%>
<%--                                        <form:input class="form-control" path="status" />--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="form-group">
                                    <label class="col-xs-2">Tình trạng</label>
                                    <div class="col-xs-5">
                                        <form:select  class="form-control" path="status">
                                            <form:option value="">---Chọn tình trạng---</form:option>
                                            <form:options items="${listStatus}"/>
                                        </form:select>
                                    </div>
                                </div>

                                    <%-- test manh--%>
                                <div class="form-group">
                                    <label class="col-xs-2"></label>
                                    <div class="col-xs-5">
                                        <c:if test="${not empty CustomerEdit.id}">
                                            <button type="button" class="btn btn-primary" style="margin-right: 20px;" id="btnAddOrUpdateCustomer">Cập nhật khách hàng</button>
                                            <button type="button" class="btn btn-danger" id="canceleBuilding">Hủy thao tác</button>
                                        </c:if>
                                        <c:if test="${empty CustomerEdit.id}">
                                            <button type="button" class="btn btn-primary" style="margin-right: 20px;" id="btnAddOrUpdateCustomer" >Thêm mới khách hàng</button>
                                            <button type="button" class="btn btn-danger" id="canceleBuilding">Hủy thao tác</button>
                                        </c:if>
                                    </div>
                                </div>
                                <form:hidden path="id" id="buildingId"></form:hidden>
                            </form>
                        </div>
                    </form:form>

                </div>
            </div><!-- /.page-content -->

            <c:forEach var="item" items="${TransactionType}">
                <div class="col-xs-12">
                    <div class="col-sm-12">
                        <h3 class="header smaller lighter blue">${item.value}</h3>
                        <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}',${CustomerEdit.id})">
                            <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
                        </button>
                    </div>

                    <c:if test="${item.key=='CSKH'}">
                        <div class="col-xs-12">
                            <table id="simple-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Ngày tạo</th>
                                        <th>Người tạo</th>
                                        <th>Chi tiết giao dịch</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${transactionCSKH}" var="transaction">
                                        <tr>
                                            <td>${transaction.createdDate}</td>
                                            <td>${transaction.createdBy}</td>
                                            <td>${transaction.note}</td>
                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-primary" data-toggle="tooltip" title="sửa thông tin giao dịch" onclick="updateTransaction(${transaction.id},${CustomerEdit.id},'${item.key}')">
                                                        <i class="ace-icon fa fa-location-arrow bigger-120"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${item.key=='DDX'}">
                        <div class="col-xs-12">
                            <table id="simple-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                    <th>Chi tiết giao dịch</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${transactionDDX}" var="transaction">
                                    <tr>
                                        <td>${transaction.createdDate}</td>
                                        <td>${transaction.createdBy}</td>
                                        <td>${transaction.note}</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-primary" data-toggle="tooltip" title="sửa thông tin giao dịch" onclick="updateTransaction(${transaction.id},${CustomerEdit.id},'${item.key}')">
                                                    <i class="ace-icon fa fa-location-arrow bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </c:forEach>

        </div>
    </div><!-- /.main-content -->
    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">
            <%--Modal Content--%>
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group has-success">
                        <label for="transactionDetail" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi tiết giao dịch</label>
                        <div class="col-xs-12 col-sm-9">
                            <span class="block input-icon input-icon-right">
                                <input type="text" id="transactionDetail" class="width-100" value="">
                            </span>
                        </div>
                    </div>
                    <input type="hidden" name="customerId" id="customerId" value="">
                    <input type="hidden" name="code" id="code" value="">
                    <input type="hidden" name="id" id="id" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.main-container -->
<script>

    $('#btnAddOrUpdateCustomer').click(function(){
        var data={};
        var typeCode=[];
        var formData=$('#listForm').serializeArray();
        $.each(formData,function(i,v){
            data[""+v.name+""]=v.value;
        })
        <%-- tôi sẽ check xem data có rỗng không (chỉ cần check type code) nếu rỗng thì gọi lại api đó kèm theo 1 yêu cầu là typecode=require--%>
        data['typeCode']=typeCode;
        if(data["fullName"]!=''){
            addOrUpdate(data);
            if(data["id"]!=""){
                alert("Cập nhật khách hàng thành công !")
                window.location.href="<c:url value="/admin/customer-list"></c:url>";
            }else{
                alert("Thêm khách hàng thành công !")
                window.location.href="<c:url value="/admin/customer-list"></c:url>";
            }

        }
        else{
            window.location.href="<c:url value="/admin/customer-edit?name=require"></c:url>";
        }
    });
    //call api
    function addOrUpdate(data){
        $.ajax({
            type:"POST",
            url: '/admin/customer',
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
    $('#canceleBuilding').click(function (){
        window.location.href="/admin/customer-list";
    });

    function transactionType(code,customerID){
        $("#transactionTypeModal").modal();
        $("#customerId").val(customerID);
        $("#code").val(code);
        $("#id").val(null);
    }

    function updateTransaction(transactionId,customerID,code){
        $("#transactionTypeModal").modal();
        $("#customerId").val(customerID);
        $("#code").val(code);
        $("#id").val(transactionId);
    }

    $('#btnAddOrUpdateTransaction').click(function(e){
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['note'] = $('#transactionDetail').val();
        data['id'] = $('#id').val();

        if(data['note'] != ''){
            addOrUpdateTransaction(data);
            if(data.id==null) {
                alert("Thêm giao dịch thành công !");
                window.location.href="/admin/customer-edit-"+data.customerId;
            }else{
                alert("Sửa giao dịch thành công !");
                window.location.href="/admin/customer-edit-"+data.customerId;
            }

        }

    })

    function addOrUpdateTransaction(data){
        $.ajax({
            type:"POST",
            url: '/admin/customer/transaction',
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
