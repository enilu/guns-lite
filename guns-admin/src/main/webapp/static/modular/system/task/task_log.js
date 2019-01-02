/**
 * 系统参数管理初始化
 */
var TaskLog = {
    id: "TaskLogTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TaskLog.initColumn = function () {
    return [
        {field: 'selectItem', radio: true,visible:false},
        {title: '任务', field: 'name', visible: true, align: 'center', valign: 'middle'},
        {title: '执行日期', field: 'execAt', visible: true, align: 'center', valign: 'middle'},
        {
            title: '执行结果',field: 'execSuccess',visible: true,align: 'center',valign: 'middle',
            formatter: function (data, row) {
                if (data == 1) {
                    return "执行成功";
                }
                return "执行失败";
            }
        },
        {title: '异常信息', field: 'jobException', visible: true, align: 'center', valign: 'middle'}

    ];
};

$(function () {
    var defaultColunms = TaskLog.initColumn();
    var table = new BSTable(TaskLog.id, "/task/logList/"+taskId, defaultColunms);
    table.setPaginationType("server");
    TaskLog.table = table.init();
});
