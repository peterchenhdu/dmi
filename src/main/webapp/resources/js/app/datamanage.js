!function() {
	window.dataMgt = window.dataMgt || {};

	dataMgt.dataTables = {};

	dataMgt.init = function() {
		$.ajax({
			type : "post",
			async : false,
			url : "data/getDataMgtCfg.action",
			success : function(data) {
				var dataMgtCfg = JSON.parse(data);
				dataMgt.dataCfg = dataMgtCfg;
				if (dataMgt.dataCfg.tables.length > 0) {
					dataMgt.curTableId = dataMgt.dataCfg.tables[0].type;
					dataMgt.curTableName = dataMgt.dataCfg.tables[0].title;
				}

			}
		});

		var tables = dataMgt.dataCfg.tables;
		if (tables.length > 0)
			$("#curTableSpan").text(tables[0].title);
		for (i = 0; i < tables.length; i++) {
			$("#tableName").append(
					"<li><a href='javascript:void(0)' onclick='selectTable(this)' id='"
							+ tables[i].type + "'>" + tables[i].title
							+ "</a></li>");
		}

		dataMgt.queryData();
		$("#exportDate-a")
				.attr(
						"href",
						"data/exportDBDateByExcel.action?tableId="
								+ dataMgt.curTableId);
	}
	dataMgt.getCfgByType = function getCfgByType(tables, type) {
		for (i = 0; i < tables.length; i++) {
			if (tables[i].type == type) {
				return tables[i];
			}
		}
	}

	dataMgt.appendDataToAddModal = function appendDataToAddModal() {
		$("#add-data-fields").empty();
		$("#add_title").text("新增" + dataMgt.curTableName);
		var tableCfg = dataMgt.getCfgByType(dataMgt.dataCfg.tables,
				dataMgt.curTableId);
		for (i = 0; i < tableCfg.fields.length; i++) {
			if (tableCfg.fields[i].notEditFlag
					&& (tableCfg.fields[i].notEditFlag == "true"))
				continue;

			var warnMsg = "";
			var appendHtml = "";
			appendHtml += "<div class='form-group'>";
			if (tableCfg.fields[i].isNull == "no") {
				warnMsg += "不能为空,";
				appendHtml += ("<lable class='col-sm-2 control-label'><span style='color:#ff0000'>*</span>"
						+ tableCfg.fields[i].title + ":</lable>");
			} else {
				appendHtml += ("<lable class='col-sm-2 control-label'>"
						+ tableCfg.fields[i].title + ":</lable>");
			}
			if ((tableCfg.fields[i].type == "int" || tableCfg.fields[i].type == "Integer")) {
				warnMsg += "只能输入数字,"
			}
			if (tableCfg.fields[i].maxLength) {
				warnMsg += "不超过" + tableCfg.fields[i].maxLength + "个字符,";
			}

			warnMsg = warnMsg.substring(0, warnMsg.length - 1);

			// single select
			if (tableCfg.fields[i].inputType
					&& tableCfg.fields[i].inputType == "singleSelect") {

				var valueSource;
				if (tableCfg.fields[i].valueFrom == "inner") {
					valueSource = JSON.parse(tableCfg.fields[i].valueSource);
					appendHtml += ("<div class='col-sm-9'><select class='form-control'  id='"
							+ tableCfg.fields[i].name
							+ "_"
							+ dataMgt.curTableId + "'>");
					for (obj in valueSource) {
						appendHtml += ("<option value='" + obj + "'>"
								+ valueSource[obj] + "</option>");
					}
					appendHtml += ("</select></div>");

				} else if (tableCfg.fields[i].valueFrom == "db") {

					appendHtml += ("<div class='col-sm-9'><input id='"
							+ tableCfg.fields[i].name
							+ "_"
							+ dataMgt.curTableId
							+ "' type='text' class='form-control' data-toggle='tooltip' data-placement='top' title='"
							+ warnMsg + "'/></div>");
				}

			}
			// check box
			else if (tableCfg.fields[i].inputType
					&& tableCfg.fields[i].inputType == "multipleSelect") {
				if (tableCfg.fields[i].isNull == "no") {
					warnMsg = "必填项，请选择一项";
				}
				if (tableCfg.fields[i].valueFrom == "ajax") {
					var checkBoxs;
					$.ajax({
						type : "post",
						async : false,
						url : tableCfg.fields[i].valueSource,
						data : {
							'type' : tableCfg.fields[i].valueParam
						},
						success : function(data) {
							checkBoxs = JSON.parse(data);
						}
					});
				}
				appendHtml += ("<div class='col-sm-9'><div class='dataMgt-checkBox' id='"
						+ tableCfg.fields[i].name
						+ "_"
						+ dataMgt.curTableId
						+ "' data-toggle='tooltip' data-placement='top' title='"
						+ warnMsg + "'>");
				for (obj in checkBoxs) {
					if (checkBoxs[obj] == "全部") {
						// continue;
						appendHtml += (" <span><input onclick='selectAll(this);' name='"
								+ tableCfg.fields[i].name
								+ "_"
								+ dataMgt.curTableId
								+ "' type='checkbox' value='"
								+ obj
								+ "'/>"
								+ checkBoxs[obj] + "</span>");
					} else {
						appendHtml += (" <span><input type='checkbox' value='"
								+ obj + "'/>" + checkBoxs[obj] + "</span>");
					}

				}
				appendHtml += ("<div></div>");

			}
			// textarea
			else if (tableCfg.fields[i].maxLength >= 500) {
				appendHtml += ("<div class='col-sm-9'><textarea id='"
						+ tableCfg.fields[i].name
						+ "_"
						+ dataMgt.curTableId
						+ "' tableId='text' class='form-control' data-toggle='tooltip' data-placement='top' title='"
						+ warnMsg + "'></textarea></div>");
			} else {
				appendHtml += ("<div class='col-sm-9'><input id='"
						+ tableCfg.fields[i].name
						+ "_"
						+ dataMgt.curTableId
						+ "' type='text' class='form-control' data-toggle='tooltip' data-placement='top' title='"
						+ warnMsg + "'/></div>");
			}

			appendHtml += ("</div>");
			$("#add-data-fields").append(appendHtml);
		}

		$("#add_modal").modal("show");
	}
	dataMgt.appendDataToEditModal = function appendDataToAddModal(gid) {
		$
				.ajax({
					type : "post",
					url : 'data/loadData.action',
					dataType : "json",
					data : {
						'gid' : gid,
						'tableId' : dataMgt.curTableId
					},
					success : function(data) {
						$("#edit-data-fields").empty();
						$("#edit_title").text("编辑" + dataMgt.curTableName);

						dataMgt.editGid = gid;
						var tableCfg = dataMgt.getCfgByType(
								dataMgt.dataCfg.tables, dataMgt.curTableId);

						for (i = 0; i < tableCfg.fields.length; i++) {
							var disabled = "";
							// edit show and disabled flag
							if (tableCfg.fields[i].notEditFlag) {
								if (tableCfg.fields[i].notEditFlag == "true") {
									continue;
								} else if (tableCfg.fields[i].notEditFlag == "true_show") {
									disabled = "disabled='disabled'";
								}

							}

							var value = data[tableCfg.fields[i].name];
							if (value == null)
								value = "";
							var warnMsg = "";
							var appendHtml = "";
							appendHtml += ("<div class='form-group'>");
							if (tableCfg.fields[i].isNull == "no") {
								warnMsg += "不能为空,";
								appendHtml += ("<lable class='col-sm-2 control-label'><span style='color:#ff0000'>*</span>"
										+ tableCfg.fields[i].title + ":</lable>");
							} else {
								appendHtml += ("<lable class='col-sm-2 control-label'>"
										+ tableCfg.fields[i].title + ":</lable>");
							}
							if ((tableCfg.fields[i].type == "int" || tableCfg.fields[i].type == "Integer")) {
								warnMsg += "只能输入大于0的数字,"
							}
							if (tableCfg.fields[i].maxLength) {
								warnMsg += "不超过" + tableCfg.fields[i].maxLength
										+ "个字符,";
							}

							warnMsg = warnMsg.substring(0, warnMsg.length - 1);

							// single select
							if (tableCfg.fields[i].inputType
									&& tableCfg.fields[i].inputType == "singleSelect") {
								var valueSource;
								if (tableCfg.fields[i].valueFrom == "inner") {
									valueSource = JSON
											.parse(tableCfg.fields[i].valueSource);

								} else if (tableCfg.fields[i].valueFrom == "db") {
									var arr = (data[tableCfg.fields[i].valueSource] + "")
											.split("_");
									var jsonStr = "{";
									for (k = 0; k < arr.length; k++) {
										if (k == (arr.length - 1)) {
											jsonStr += "\"" + arr[k] + "\":\""
													+ arr[k] + "\"}";
										} else {
											jsonStr += "\"" + arr[k] + "\":\""
													+ arr[k] + "\",";
										}
									}
									valueSource = JSON.parse(jsonStr);

								}

								appendHtml += ("<div class='col-sm-9'><select class='form-control' "
										+ disabled
										+ " value='"
										+ value
										+ "' id='"
										+ tableCfg.fields[i].name
										+ "_" + dataMgt.curTableId + "_e'>");
								for (obj in valueSource) {
									if (obj == value) {
										appendHtml += ("<option value='" + obj
												+ "' selected = 'selected'>"
												+ valueSource[obj] + "</option>");
									} else {
										appendHtml += ("<option value='" + obj
												+ "'>" + valueSource[obj] + "</option>");
									}
								}
								appendHtml += ("</select></div>");

							}
							// check box
							else if (tableCfg.fields[i].inputType
									&& tableCfg.fields[i].inputType == "multipleSelect") {
								if (tableCfg.fields[i].isNull == "no") {
									warnMsg = "必填项，请选择一项";
								}
								if (tableCfg.fields[i].valueFrom == "ajax") {
									var checkBoxs;
									$
											.ajax({
												type : "post",
												async : false,
												url : tableCfg.fields[i].valueSource,
												data : {
													'type' : tableCfg.fields[i].valueParam
												},
												success : function(data) {
													checkBoxs = JSON
															.parse(data);
												}
											});
								}
								appendHtml += ("<div class='col-sm-9'><div class='dataMgt-checkBox' id='"
										+ tableCfg.fields[i].name
										+ "_"
										+ dataMgt.curTableId
										+ "_e' data-toggle='tooltip' data-placement='top' title='"
										+ warnMsg + "'>");
								for (obj in checkBoxs) {
									var checkFlag = "";
									if ((parseInt(value) & parseInt(obj)) == obj) {
										checkFlag = "checked='checked'"
									}
									if (checkBoxs[obj] == "全部") {

										appendHtml += (" <span><input "
												+ checkFlag
												+ "onclick='selectAll(this);' "
												+ disabled + " name='"
												+ tableCfg.fields[i].name + "_"
												+ dataMgt.curTableId
												+ "' type='checkbox' value='"
												+ obj + "'/>" + checkBoxs[obj] + "</span>");
									} else {
										appendHtml += (" <span><input "
												+ checkFlag + " " + disabled
												+ " type='checkbox' value='"
												+ obj + "'/>" + checkBoxs[obj] + "</span>");
									}

								}
								appendHtml += ("<div></div>");

							} else if (tableCfg.fields[i].maxLength >= 500) {
								appendHtml += ("<div class='col-sm-9'><textarea id='"
										+ tableCfg.fields[i].name
										+ "_"
										+ dataMgt.curTableId
										+ "_e' "
										+ disabled
										+ " tableId='text' class='form-control' data-toggle='tooltip' data-placement='top' title='"
										+ warnMsg + "'>" + value + "</textarea></div>");
							} else {
								appendHtml += ("<div class='col-sm-9'><input id='"
										+ tableCfg.fields[i].name
										+ "_"
										+ dataMgt.curTableId
										+ "_e'  "
										+ disabled
										+ " value='"
										+ value
										+ "' tableId='text' class='form-control' data-toggle='tooltip' data-placement='top' title='"
										+ warnMsg + "'/></div>");
							}

							appendHtml += ("</div>");
							$("#edit-data-fields").append(appendHtml);
						}

						$("#edit_modal").modal("show");
					},
					error : function() {
						alert("系统异常，请稍后重试！");
					}
				});

	}
	dataMgt.queryData = function() {
		var tableCfg = dataMgt.getCfgByType(dataMgt.dataCfg.tables,
				dataMgt.curTableId);
		$("#queryDiv").empty();

		var ths = "";
		var arrayObj = new Array()
		for (i = 0; i < tableCfg.fields.length; i++) {
			if (i == (tableCfg.fields.length - 1)) {
				arrayObj[i] = {
					"data" : tableCfg.fields[i].name,
					"sWidth" : "64px"
				}
			} else {
				arrayObj[i] = {
					"data" : tableCfg.fields[i].name
				}
			}

			if (i == 0)
				continue;// ID不显示
			ths += "<th>" + tableCfg.fields[i].title + "</th>";
		}
		ths += "<th>操作</th>";
		arrayObj[arrayObj.length] = {
			"data" : null
		};
		$("#queryDiv")
				.append(
						"<div class='' id='"
								+ tableCfg.type
								+ "_div' >"
								+ "<table class='table table-striped table-bordered data-table' style='width: 100%; cellspacing: 0px;border-collapse: collapse !important;' id='"
								+ tableCfg.type + "_table'>" + "<thead><tr>"
								+ ths + "</tr></thead></table></div>");

		dataMgt.dataTables[dataMgt.curTableId] = $(
				'#' + tableCfg.type + '_table')
				.dataTable(
						{
							"sDom" : '<"top"f<"clear">>t<"bottom"ilpr<"clear">>',
							"autoWidth" : false,
							"bSort" : false,
							"sPaginationType" : "full_numbers",
							"bFilter" : false,
							"bProcessing" : true,
							"bServerSide" : true,
							"sAjaxSource" : "data/queryData.action",
							"fnServerData" : function(sSource, aoData,
									fnCallback) {
								var params = common.dataTransfer
										.getDataTableParams(aoData);
								$.ajax({
									type : "post",
									async : true,
									url : sSource,
									data : {
										offset : params.offset,
										pagesize : params.pagesize,
										tableId : dataMgt.curTableId,
										searchCondition : $('#searchCondition')
												.val()
									},
									success : function(data) {

										var res = common.dataTransfer
												.transferResForDatatable(data);

										fnCallback(res);

									}
								});

							},
							"language" : {
								"sLengthMenu" : "每页显示 _MENU_ 条记录",
								"sZeroRecords" : "当前没有数据可供显示",
								"sInfo" : "显示第 _START_到第 _END_条记录，总共_TOTAL_ 条记录 ",
								"sInfoEmtpy" : "找不到相关数据",
								"sProcessing" : "数据正在加载中，请等待...",
								"sSearch" : "搜索",
								"sInfoEmpty" : "显示 0 至 0 共 0 项",
								"oPaginate" : {
									"sFirst" : "<<",
									"sPrevious" : "< ",
									"sNext" : "> ",
									"sLast" : ">> "
								},
								"sInfoFiltered" : "(从 _MAX_ 条数据中检索)"
							},
							"aoColumns" : arrayObj,
							"createdRow" : function(row, data, index) {

								for (i = 0; i < tableCfg.fields.length; i++) {
									var field = tableCfg.fields[i];
									var value = data[tableCfg.fields[i].name];
									if (tableCfg.fields[i].inputType
											&& tableCfg.fields[i].inputType == "singleSelect") {
										if (tableCfg.fields[i].valueFrom == "inner") {
											var valueSource = JSON
													.parse(tableCfg.fields[i].valueSource);
											value = valueSource[value]
										}
									} else if (tableCfg.fields[i].inputType
											&& tableCfg.fields[i].inputType == "multipleSelect") {
										if (tableCfg.fields[i].valueFrom == "ajax") {
											var checkBoxs;
											$
													.ajax({
														type : "post",
														async : false,
														url : tableCfg.fields[i].valueSource,
														data : {
															'type' : tableCfg.fields[i].valueParam
														},
														success : function(data) {
															checkBoxs = JSON
																	.parse(data);
														}
													});
										}
										var checkStr = "";
										for (obj in checkBoxs) {
											if ((parseInt(value) & parseInt(obj)) == obj) {
												if (checkBoxs[obj] == "全部") {
													checkStr = (""
															+ checkBoxs[obj] + ", ");
													break;
												}
												checkStr += (""
														+ checkBoxs[obj] + ", ");
											}
										}
										checkStr = checkStr.substring(0,
												checkStr.length - 2);
										value = checkStr;

									}

									if (field.type == "Integer"
											&& value == null) {
										value = "";
									}

									var txt = (value + "").replace(/&ensp;/g,
											" ");// 空格干扰
									$('td:eq(' + i + ')', row).text(txt);
								}

								var gid = $('td:eq(0)', row).text();
								$('td:eq(0)', row).hide();

								if (data.rewritable == 0) {
									$('td:eq(' + tableCfg.fields.length + ')',
											row)
											.html(
													'<div class="">'
															+ '<button type="button " class="btn btn-xs btn-danger mg2" disabled="disabled" title="编辑" ><span class="glyphicon glyphicon-ban-circle"></span></button>'
															+ '</div>');
								} else {
									$('td:eq(' + tableCfg.fields.length + ')',
											row)
											.html(
													'<div class="">'
															+ '<button type="button " class="btn btn-xs btn-info mg2" title="编辑" onclick="dataMgt.appendDataToEditModal(\''
															+ gid
															+ '\')"><span class="glyphicon glyphicon-pencil"></span></button>'
															+ '<button type="button" class="btn  btn-xs btn-warning mg2" title="删除" onclick="dataMgt.deleteData(\''
															+ gid
															+ '\')"><span class="glyphicon glyphicon-trash"></span></button>'
															+ '</div>');
								}
							}

						});

		$('#' + tableCfg.type + '_table' + ' tbody').on(
				'click',
				'tr',
				function(e) {

					var e = e || window.event;
					var target = e.target || e.srcElement;

					if ($(target).hasClass("btn") == true
							|| $(target).hasClass("glyphicon") == true) {// 点击按钮
																			// 直接返回
						return;
					}

					var objParent = $(this).parent();
					var selectTr = objParent.find(".select");

					// 先关闭其它select，若点击自己，不操作
					if (selectTr.length > 0
							&& $($(selectTr[0]).children()[0]).text() != $(
									$(this).children()[0]).text()) {
						$(selectTr[0]).removeClass("select");
						var tds = $(selectTr[0]).find('td');
						for (i = 0; i < tds.length; i++) {
							$(tds[i]).removeClass("normal-td");
						}
					}

					// tri
					var obj = $(this).find('td');
					if ($(this).hasClass("select")) {
						$(this).removeClass("select");
						for (i = 0; i < obj.length; i++) {
							$(obj[i]).removeClass("normal-td");
						}
					} else {
						$(this).addClass("select");
						for (i = 0; i < obj.length; i++) {
							$(obj[i]).addClass("normal-td");
						}
					}

				});
	};
	dataMgt.deleteData = function(gid) {
		BootstrapDialog.confirm({
			title : '删除确认',
			message : '确定删除该条信息?',
			btnCancelLabel : '取消',
			btnOKLabel : '确定',
			callback : function(result) {
				if (result) {
					$.ajax({
						type : "post",
						url : 'data/deleteData.action',
						dataType : "json",
						data : {
							gid : gid,
							tableId : dataMgt.curTableId
						},
						success : function(data) {
							common.popup("删除成功！");
							dataMgt.dataTables[dataMgt.curTableId]
									.fnDraw(false);
						},
						error : function() {
							alert("系统异常，请稍后重试！");
						}
					});

				}
			}
		});

	};
	dataMgt.showDataInExportModal = function() {
		$("#downloadTemplate").attr(
				"href",
				"data/downloadExcelTemplate.action?tableId="
						+ dataMgt.curTableId);
		$("#exportDate-a")
				.attr(
						"href",
						"data/exportDBDateByExcel.action?tableId="
								+ dataMgt.curTableId);
		$("#myFile").val("");
		$("#dateImportErrorTipDIv").empty();
		$("#DataInExportModal").modal();
	};
	dataMgt.editData = function() {

		var gid = dataMgt.editGid;
		var tableCfg = dataMgt.getCfgByType(dataMgt.dataCfg.tables,
				dataMgt.curTableId);
		var param = {};
		param.tableId = dataMgt.curTableId;
		param.gid = gid;

		for (i = 0; i < tableCfg.fields.length; i++) {
			var inputObj = $("#" + tableCfg.fields[i].name + "_"
					+ dataMgt.curTableId + "_e");
			if (!inputObj.length)
				continue;
			var value = $.trim(inputObj.val());

			if (tableCfg.fields[i].inputType
					&& tableCfg.fields[i].inputType == "multipleSelect") {
				if (tableCfg.fields[i].valueFrom == "ajax") {
					var checkBoxs;
					$.ajax({
						type : "post",
						async : false,
						url : tableCfg.fields[i].valueSource,
						data : {
							'type' : tableCfg.fields[i].valueParam
						},
						success : function(data) {
							checkBoxs = JSON.parse(data);
						}
					});
				}
				var inputs = inputObj.find("input");
				var value = 0;
				for (j = 0; j < inputs.length; j++) {
					if (inputs[j].checked == true) {
						var val = parseInt(inputs[j].value)
						value = value | val;
					}

				}
				if (value == 0)
					value = "";
			}

			if (tableCfg.fields[i].isNull == "no" && value == "") {
				inputObj.tooltip('show');
				return;
			}

			if (value != ""
					&& (tableCfg.fields[i].type == "int" || tableCfg.fields[i].type == "Integer")) {
				var pattern = /^[1-9]\d*$/i;
				if (pattern.test(value) == false) {
					inputObj.tooltip('show');
					return;
				}
			}

			if (value != "" && tableCfg.fields[i].maxLength) {

				if (value.length > tableCfg.fields[i].maxLength) {
					inputObj.tooltip('show');
					return;
				}
			}

			param[tableCfg.fields[i].name] = value;
		}

		$.ajax({
			type : "post",
			url : "data/editData.action",
			data : param,
			success : function(rst) {
				var data = JSON.parse(rst);
				if (data.isExeSuccess == true) {
					$("#edit_modal").modal('hide');
					dataMgt.dataTables[dataMgt.curTableId].fnDraw(false);
					common.popup("操作成功！");

				} else {
					common.popup("操作失败！");
				}
			},
			error : function() {
				common.popup("操作失败！");
			}
		});
	};
	dataMgt.addData = function() {
		var tableCfg = dataMgt.getCfgByType(dataMgt.dataCfg.tables,
				dataMgt.curTableId);
		var param = {};
		param.tableId = dataMgt.curTableId;
		for (i = 0; i < tableCfg.fields.length; i++) {
			var inputObj = $("#" + tableCfg.fields[i].name + "_"
					+ dataMgt.curTableId);
			if (!inputObj.length)
				continue;

			var value = $.trim(inputObj.val());

			if (tableCfg.fields[i].inputType
					&& tableCfg.fields[i].inputType == "multipleSelect") {
				if (tableCfg.fields[i].valueFrom == "ajax") {
					var checkBoxs;
					$.ajax({
						type : "post",
						async : false,
						url : tableCfg.fields[i].valueSource,
						data : {
							'type' : tableCfg.fields[i].valueParam
						},
						success : function(data) {
							checkBoxs = JSON.parse(data);
						}
					});
				}
				var inputs = inputObj.find("input");
				var value = 0;
				for (j = 0; j < inputs.length; j++) {
					if (inputs[j].checked == true) {
						var val = parseInt(inputs[j].value)
						value = value | val;
					}

				}
				if (value == 0)
					value = "";
			}

			if (tableCfg.fields[i].isNull == "no" && value == "") {
				inputObj.tooltip('show');
				return;
			}

			if (value != ""
					&& (tableCfg.fields[i].type == "int" || tableCfg.fields[i].type == "Integer")) {
				var pattern = /^[1-9]\d*$/i;
				if (pattern.test(value) == false) {
					inputObj.tooltip('show');
					return;
				}
			}

			if (value != "" && tableCfg.fields[i].maxLength) {
				if (value.length > tableCfg.fields[i].maxLength) {
					inputObj.tooltip('show');
					return;
				}
			}

			param[tableCfg.fields[i].name] = value;
		}

		$.ajax({
			type : "post",
			url : "data/addData.action",
			data : param,
			success : function(data) {
				if (data == "success") {
					$("#add_modal").modal('hide');
					dataMgt.dataTables[dataMgt.curTableId].fnDraw(false);
					common.popup("操作成功！");
				} else if (data == "xy_error") {
					$("#x_" + dataMgt.curTableId).tooltip("show");
					$("#y_" + dataMgt.curTableId).tooltip("show");
				} else if (data == "exist") {
					common.popup("数据已存在！");
				} else {
					common.popup("操作失败！");
				}
			},
			error : function() {
				common.popup("操作失败！");
			}
		});
	};
	dataMgt.importData = function(obj) {
		var type = dataMgt.curTableId;

		var url = 'data/inportDBDateByExcel.action?tableId=' + type;

		$(obj).button('loading');
		$("#dateImportErrorTipDIv").empty();
		var options = {
			type : "post",
			url : url,
			dataType : "json",
			success : function(data) {

				$("#importData-a").button('reset');

				var obj = data;
				if (obj.filenameExtensionError != "") {
					$("#dateImportErrorTipDIv")
							.append(
									"<h4  class='col-sm-12 data-import-error'>文件错误：</h4>");
					$("#dateImportErrorTipDIv").append(
							'<span  class="col-sm-12 data-import-error">'
									+ obj.filenameExtensionError + '</span>');
				}
				if (obj.templateError != "") {
					$("#dateImportErrorTipDIv")
							.append(
									"<h4  class='col-sm-12 data-import-error'>导入模板错误：</h4>");
					$("#dateImportErrorTipDIv").append(
							'<span  class="col-sm-12 data-import-error">'
									+ obj.templateError + '</span>');
				}
				if (obj.errorList.length > 0) {
					$("#dateImportErrorTipDIv").append(
							"<h4 class='col-sm-12 data-import-error'>输入错误列表("
									+ obj.errorList.length + ")：</h4>");
					for (i = 0; i < obj.errorList.length; i++) {
						$("#dateImportErrorTipDIv")
								.append(
										'<span  class="col-sm-12 data-import-error">'
												+ obj.errorList[i].errorMsg
												+ '</span>');
					}
				}
				if (obj.sysExceptionMsgList.length > 0) {
					$("#dateImportErrorTipDIv").append(
							"<h4 class='col-sm-12 data-import-error'>系统Exception列表("
									+ obj.sysExceptionMsgList.length
									+ ")：</h4>");
					for (i = 0; i < obj.sysExceptionMsgList.length; i++) {
						$("#dateImportErrorTipDIv").append(
								'<span  class="col-sm-12 data-import-error">'
										+ obj.sysExceptionMsgList[i]
										+ '</span>');
					}
				}
				if (obj.warnList.length > 0) {
					$("#dateImportErrorTipDIv").append(
							"<h4 class='col-sm-12 data-import-warn'>警告列表("
									+ obj.warnList.length + ")：</h4>");
					for (i = 0; i < obj.warnList.length; i++) {
						$("#dateImportErrorTipDIv").append(
								'<span  class="col-sm-12 data-import-warn">'
										+ obj.warnList[i].errorMsg + '</span>');
					}
				}
				$("#dateImportErrorTipDIv").append(
						"<h4 class='col-sm-12 data-import-success'>成功导入("
								+ obj.successNum + ")条数据！</h4>");
				$("#importData-a").button('reset');

				dataMgt.dataTables[dataMgt.curTableId].fnDraw(false);

			},
			error : function() {
				common.popup("系统异常[sys error]");
			}
		}

		$("#initForm").ajaxSubmit(options);
	};

}();