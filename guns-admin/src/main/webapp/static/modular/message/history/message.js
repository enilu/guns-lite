/**
 * 系统参数管理初始化
 */
var Message = {
    id: "MessageTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Message.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '自增主键', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '消息模板', field: 'tplCode', visible: true, align: 'center', valign: 'middle'},
            {title: '消息内容', field: 'content', visible: true, align: 'center', valign: 'middle'},
            {title: '接收者', field: 'receiver', visible: true, align: 'center', valign: 'middle'},
            {title: '发送时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Message.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Message.seItem = selected[0];
        return true;
    }
};

/**
 * 打开查看系统参数详情
 */
Message.openDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '消息详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/message/history/view/' + Message.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除系统参数
 */
Message.clear = function () {
    var operation = function() {
        var ajax = new $ax(Feng.ctxPath + "/message/history/clear", function (data) {
            Feng.success("清除成功!");
            Message.table.refresh();
        }, function (data) {
            Feng.error("清除失败!" + data.responseJSON.message + "!");
        });
        ajax.start();
    };

    Feng.confirm("清除后将无法恢复，确认该操作?", operation);


};

/**
 * 查询系统参数列表
 */
Message.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Message.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Message.initColumn();
    var table = new BSTable(Message.id, "/message/history/list", defaultColunms);
    table.setPaginationType("server");
    Message.table = table.init();
});
