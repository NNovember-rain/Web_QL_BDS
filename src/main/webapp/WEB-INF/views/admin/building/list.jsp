<%@ taglib prefix="sercurity" uri="http://www.springframework.org/security/tags" %>
<%--
Created by IntelliJ IDEA.
User: admin
Date: 3/2/2024
Time: 9:13 AM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingURL" value="/admin/building-list"></c:url>
<c:url var="buildingAPI" value="/api/building"></c:url>
<html>
<head>
    <title>Danh sách tòa nhà</title>
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
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${buildingURL}" method="GET" >
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-sm-3">
                                                        <label class="name">Tên tòa nhà</label>
                                                        <form:input class="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Đường</label>
                                                        <form:input class="form-control" path="street"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Phường</label>
                                                        <form:input class="form-control" path="ward"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Quận</label>
                                                        <form:select  class="form-control" path="district">
                                                            <form:option value="">---Chọn quận---</form:option>
                                                            <form:options items="${listDistrict}"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-sm-3">
                                                        <label class="name">Diện tích sàn</label>
                                                        <form:input class="form-control" path="floorArea"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Số tầng hầm</label>
                                                        <form:input class="form-control" path="numberOfBasement"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Hướng</label>
                                                        <form:input class="form-control" path="direction"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Hạng</label>
                                                        <form:input class="form-control" path="level"/>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-sm-3">
                                                        <label class="name">Diện tích từ</label>
                                                        <form:input class="form-control" path="areaFrom"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Diện tích đến</label>
                                                        <form:input class="form-control" path="areaTo"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Giá thuê từ</label>
                                                        <form:input class="form-control" path="rentPriceFrom"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">Giá thuê đến</label>
                                                        <form:input class="form-control" path="rentPriceTo"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-sm-3">
                                                        <label class="name">Tên quản lí</label>
                                                        <form:input class="form-control" path="managerName"/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label class="name">SĐT quản lí </label>
                                                        <form:input class="form-control" path="managerPhone"/>
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
                                                        <form:checkboxes items="${listTypeCode}" path="typeCode"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-sm-6">
                                                        <button type="button" class="btn btn-xs btn-danger" id="btnSearchBuilding">
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
                        <div class="pull-right" style="margin-right:12px; margin-top: 20px;">
                            <a href="/admin/building-edit">
                                <button class="btn btn-info" title="Thêm tòa nhà">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </a>
                            <sercurity:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </sercurity:authorize>

                        </div>
                    </div>
                </div>

                <!-- BẢNG DANH SACH -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-responsive" >
                            <display:table name="buildingList" requestURI="${buildingURL}"
                                           id="tableList" pagesize="${model.maxPageItems}"
                                           class="table table-striped table-bordered table-hover"
                                           style="text-align: center;">
                                <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell" headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column property="name" title="Tên tòa nhà" headerClass="center"/>
                                <display:column property="address" title="Địa chỉ" headerClass="center"/>
                                <display:column property="numberOfBasement" title="Số tầng hầm" headerClass="center"/>
                                <display:column property="managerName" title="Tên quản lý" headerClass="center"/>
                                <display:column property="managerPhone" title="Số điện thoại" headerClass="center"/>
                                <display:column property="floorArea" title="Diện tích sàn" headerClass="center"/>
                                <display:column property="rentArea" title="Diện tích thuê" headerClass="center"/>
                                <display:column property="brokerageFee" title="Phí môi giới" headerClass="center"/>
                                <display:column title="Thao tác" headerClass="center">
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <sercurity:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})" name="buildingid">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </button>
                                        </sercurity:authorize>

                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${tableList.id}">
                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                        </a>
                                        <sercurity:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
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
                </div>
        </div>
    </div>
</div>
<!-- /.main-container -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
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
                <input type="hidden" id="buildingId" value="" name="buildingId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnassignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>


    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId)
    }
    function loadStaff(buildingId){
        $.ajax({
            type:"GET",
            url: '${buildingAPI}/'+ buildingId + "/staffs",
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
                window.location.href="<c:url value="/admin/building-list?massage=erro"></c:url>";
                console.log(respond)
            }
        });
    }

    function updateBuilding(item,id){
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



    $('#btnassignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] != ''){
            UpdateAssignmentBuilding(data);
        }
        else{
            alert("Hãy chọn ít nhất 1 nhân viên !");
        }

    })




    function UpdateAssignmentBuilding(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}/" + 'assignment',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response) {
                alert("Giao nhân viên thành công !");            },
            error: function(response){
                console.info("Giao không thành công")
                window.location.href = "<c:url value="/admin/building-list" />"
            }
        });
    }


    $('#btnSearchBuilding').click(function (e){
        e.preventDefault(); // khi ta tìm kiếm hay gì đó thì cái đầu api luôn giữ nguyên chỉ có thêm yêu cầu đằng sau (phần thay đổi), thằng này giúp cho chúng ta tránh call nhầm api.
        $('#listForm').submit()
    });

    function deleteBuilding(data){
        var buildingId=[data];
            alert("Xóa tòa nhà thành công !")
            window.location.href="<c:url value="/admin/building-list"></c:url>";
        deleteBuildings(buildingId);
    }

    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var data={};
        var check=false;
        var buildingIds=$('#tableList').find('tbody input[type=checkbox]:checked').map(function(){
            check=true;
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds)
        if(buildingIds!=null && check==true) {
            alert("Xóa tòa nhà thành công !")
            window.location.href = "<c:url value="/admin/building-list"></c:url>";
        }
    })
    function deleteBuildings(data){
        $.ajax({
            type:"Delete",
            url: '${buildingAPI}/'+data.join(","),
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
