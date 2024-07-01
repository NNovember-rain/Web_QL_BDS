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
    <title>Thêm tòa nhà</title>
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
                        Dashboard
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
                    <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" >
                                <div class="form-group">
                                    <label class="col-xs-3">Tên tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Quận</label>
                                    <div class="col-xs-3">
                                        <form:select  class="form-control" path="district">
                                            <form:option value="">---Chọn quận---</form:option>
                                            <form:options items="${listDistrict}"/>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="ward" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="street" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Kết Cấu</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="structure" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Số tầng hầm</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="numberOfBasement" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="floorArea" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="direction" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="level" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentArea" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Giá thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentPrice" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentPriceDescription" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="serviceFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="carFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí mô tô</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="motoFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="overtimeFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="electricityFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Đặt cọc</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="deposit" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thanh toán</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="payment" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tên quản lí</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="managerName" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Số điện thoại quản lí</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="managerPhone" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thời gian trang trí</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="decorationTime" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="brokerageFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <form:checkboxes items="${listTypeCode}" path="typeCode"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="note" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-3">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" style="margin-right: 20px;" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                            <button type="button" class="btn btn-danger" id="canceleBuilding">Hủy thao tác</button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" style="margin-right: 20px;" id="btnAddOrUpdateBuilding" >Thêm mới tòa nhà</button>
                                            <button type="button" class="btn btn-danger" id="canceleBuilding">Hủy thao tác</button>
                                        </c:if>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group" >
                                            <label class="col-sm-2 no-padding-right">Hình đại diện</label>
                                            <input class="col-sm-1 no-padding-right" type="file" id="uploadImage" style="width: 80px"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-6"></label>
                                    <div class="col-sm-3" >
                                        <c:if test="${not empty buildingEdit.avatar}">
                                            <c:set var="imagePath" value="/repository${buildingEdit.avatar}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px" alt="">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.avatar}">
                                            <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px" alt="">
                                        </c:if>
                                    </div>
                                </div>
                                <form:hidden path="id" id="buildingId"></form:hidden>
                            </form>
                        </div>
                    </form:form>

                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->
<script>

    var imageBase64 = ''; //lay thong tin anh
    var imageName = '';

    $('#btnAddOrUpdateBuilding').click(function(){
        var data={};
        var typeCode=[];
        var formData=$('#listForm').serializeArray();
        $.each(formData,function(i,v){
            if(v.name !='typeCode'){
                data[""+v.name+""]=v.value;
            }
            else{
                typeCode.push(v.value);
            }
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        })
        <%-- tôi sẽ check xem data có rỗng không (chỉ cần check type code) nếu rỗng thì gọi lại api đó kèm theo 1 yêu cầu là typecode=require--%>
        data['typeCode']=typeCode;
        if(typeCode!=''){
            addOrUpdate(data);
            if(data["id"]!=""){
                alert("Cập nhật tòa nhà thành công !")
                window.location.href="<c:url value="/admin/building-list"></c:url>";
            }else{
                alert("Thêm tòa nhà thành công !")
                window.location.href="<c:url value="/admin/building-list"></c:url>";
            }

        }
        else{
            window.location.href="<c:url value="/admin/building-edit?typeCode=require"></c:url>";
        }
    });
    //call api
    function addOrUpdate(data){
        $.ajax({
            type:"POST",
            url: '/api/building',
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
        window.location.href="/admin/building-list";
    });


    $('#uploadImage').change(function (event) {
        var reader = new FileReader(); //load anh khi bam nut
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });


    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

</script>
</body>
</html>
