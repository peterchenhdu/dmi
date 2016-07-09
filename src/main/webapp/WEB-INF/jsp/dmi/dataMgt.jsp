<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%=basePath%>resources/images/logo.jpg" />
<title>数据维护</title>
<link rel="stylesheet"
	href="<%=basePath%>resources/plugins/bootstrap_3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>resources/plugins/dataTables_1.10.7/css/dataTables.bootstrap.min.css"></link>
<link rel="stylesheet" href="<%=basePath%>resources/css/datamanage.css">

<script type="text/javascript"
	src="<%=basePath%>resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/plugins/bootstrap_3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/plugins/dataTables_1.10.7/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/plugins/dataTables_1.10.7/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/app/common.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/app/datamanage.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/bootstrap-dialog.min.js"></script>
</head>
<body>

	<div class="container-fluid" style="padding: 50px;">

		<div class="fixed-table-toolbar" id="table-tools"
			style="height: 35px;">
			<div class="bars pull-left">
				<div id="user-toolbar">
					<div class="input-group" style="width: 350px; float: left">
						<div class="input-group-btn">
							<button id="search-button" style="width: 100px;" type="button"
								class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								<span id="curTableSpan"></span><span class="caret"
									style="margin-left: 15px;"></span>
							</button>
							<ul class="dropdown-menu" id="tableName"
								style="max-height: 400px;">
								<li class="dropdown-header">请选择数据表</li>
							</ul>
						</div>
						<input type="text" id="searchCondition" class="form-control"
							onkeydown="enterPress()"> <span class="input-group-btn">
							<button class="btn btn-default" id="searchBtn"
								style="border-radius: 0px; border-left: 0px;" name="search"
								title="搜索"
								onclick="dataMgt.dataTables[dataMgt.curTableId].fnDraw()">
								<i class="glyphicon glyphicon-search icon-search"></i>
							</button>
						</span> <span class="input-group-btn">
							<button class="btn btn-default" id="refreshBtn" title="刷新"
								onclick="reset()">
								<i class="glyphicon glyphicon-refresh icon-refresh"></i>
							</button>
						</span>
					</div>
				</div>
			</div>

			<div class="columns columns-right btn-group pull-right">
				<a style="margin-right: -4px;">
					<button class="btn btn-default"
						style="border-top-right-radius: 0px; border-bottom-right-radius: 0px;"
						type="button" name="add" title="新增"
						onclick="dataMgt.appendDataToAddModal()">
						<i class="glyphicon glyphicon-plus icon-plus"></i>
					</button>
				</a> <a href="#" id="exportDate-a" style="margin-right: -5px;">
					<button class="btn btn-default" type="button" name="export"
						title="导出"
						style="border-radius: 0px; outline: none; margin-left: 1px; border-left-width: 0px;">
						<i class="glyphicon glyphicon-upload"></i>
					</button>
				</a> <a>
					<button class="btn btn-default"
						style="border-top-left-radius: 0px; border-bottom-left-radius: 0px; outline: none"
						type="button" name="import" title="导入"
						onclick="dataMgt.showDataInExportModal()">
						<i class="glyphicon glyphicon-download"></i>
					</button>
				</a>
			</div>
		</div>



		<div id="queryDiv"></div>
	</div>

	<div class="modal fade" id="add_modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content">
				<div class="modal-header dialog-title">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="add_title" style="color: white"></h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add-data-fields" role="form"></form>
				</div>
				<div class="modal-footer">
					<small class="control-label" style="float: left;"><label
						style="color: #ff0000;">*</label>表示必填项</small>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="dataMgt.addData();">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content">
				<div class="modal-header dialog-title">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="edit_title" style="color: white"></h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit-data-fields" role="form"></form>
				</div>
				<div class="modal-footer">
					<small class="control-label" style="float: left;"><label
						style="color: #ff0000;">*</label>表示必填项</small>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="dataMgt.editData();">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="DataInExportModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" style="width: 600px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="init_title" style="color: white">数据导入</h4>
				</div>
				<div class="modal-body modalBody">
					<div class="form-horizontal">

						<div class="form-group">
							<label class="col-sm-2 control-label">导入数据：</label>
							<div class="col-sm-10">
								<form id="initForm" style="display: inline-block;"
									action="data/init.action" method="post"
									enctype="multipart/form-data">
									<input id="myFile" type="file" name="myFile">
								</form>
								<a class="btn btn-primary btn-sm"
									onclick="dataMgt.importData(this);" id="importData-a"
									data-loading-text="正在导入数据，请等待...">导入</a>
							</div>
						</div>
						<hr style="margin: 0">
						<div id="dateImportErrorTipDIv"></div>
						<div>
							<br />
							<span class="help-block" id="dataMgtHelper">提示:使用excel方式导入数据，请先下载导入模板,编辑好数据后开始导入<a
								href="#" style="font-weight: 700" id="downloadTemplate">(点我下载导入模板)</a>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			dataMgt.init();
		});
		function selectTable(obj) {
			$('#searchCondition').val("");
			$("#curTableSpan").text($(obj).text());
			dataMgt.curTableId = $(obj).attr("id");
			dataMgt.curTableName = $(obj).text();
			dataMgt.queryData();
			$("#exportDate-a").attr(
					"href",
					"data/exportDBDateByExcel.action?tableId="
							+ dataMgt.curTableId);

		}
		function enterPress() {

			var e = arguments.callee.caller.arguments[0] || window.event;
			if (e.keyCode == 13) {
				dataMgt.dataTables[dataMgt.curTableId].fnDraw();
			}
		}
		function reset() {
			$('#searchCondition').val("");
			dataMgt.dataTables[dataMgt.curTableId].fnDraw();
		}

		function selectAll(obj) {
			var $obj = $(obj);
			var parentObj = $obj.parent().parent();
			var inputs = parentObj.find("input");
			if (obj.checked == false) {
				for (i = 0; i < inputs.length; i++) {
					inputs[i].checked = false;
				}
			} else {
				for (i = 0; i < inputs.length; i++) {
					inputs[i].checked = true;
				}
			}

		}
	</script>
</body>
</html>