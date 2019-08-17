/**
 * 消息模板管理初始化
 */
var MessageTemplate = {
    id: "MessageTemplateTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
MessageTemplate.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: 'ID', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '编号', field: 'code', visible: true, align: 'center', valign: 'middle'},
            {title: '标题', field: 'title', visible: true, align: 'center', valign: 'middle'},
            {title: '内容', field: 'content', visible: true, align: 'center', valign: 'middle'},
        {title: '发送条件', field: 'cond', visible: true, align: 'center', valign: 'middle'},
        {title: '类型', field: 'typeName', visible: true, align: 'center', valign: 'middle'},
        {title: '模板', field: 'messageSender.name', visible: true, align: 'center', valign: 'middle'}
            
    ];
};

/**
 * 检查是否选中
 */
MessageTemplate.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        MessageTemplate.seItem = selected[0];
        return true;
    }
};


/**
 * 点击添加模板
 */
MessageTemplate.openAdd = function () {
    var index = layer.open({
        type: 2,
        title: '添加模板',
        area: ['80%', '80%'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/message/template/add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看模板详情
 */
MessageTemplate.openDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '模板详情',
            area: ['80%', '80%'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/message/template/update/' + MessageTemplate.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除模板
 */
MessageTemplate.delete = function () {
    if (this.check()) {

        var operation = function() {
            var ajax = new $ax(Feng.ctxPath + "/message/template", function (data) {
                Feng.success("删除成功!");
                MessageTemplate.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("id", MessageTemplate.seItem.id);
            ajax.setType("delete");
            ajax.start();
        };
        Feng.confirm("是否刪除模板?", operation);
    }
};


$(function () {
    var defaultColunms = MessageTemplate.initColumn();
    var table = new BSTable(MessageTemplate.id, "/message/template/list", defaultColunms);
    table.setPaginationType("server");
    MessageTemplate.table = table.init();
});
