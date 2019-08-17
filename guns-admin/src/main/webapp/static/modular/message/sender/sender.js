/**
 * 消息发送器管理初始化
 */
var MessageSender = {
    id: "MessageSenderTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
MessageSender.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: 'ID', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '名称', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '发送类', field: 'className', visible: true, align: 'center', valign: 'middle'},
            {title: '运营商短信模板编号', field: 'tplCode', visible: true, align: 'center', valign: 'middle'}
            
    ];
};

/**
 * 检查是否选中
 */
MessageSender.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        MessageSender.seItem = selected[0];
        return true;
    }
};


/**
 * 点击添加发送器
 */
MessageSender.openAdd = function () {
    var index = layer.open({
        type: 2,
        title: '添加发送器',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/message/sender/add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看发送器详情
 */
MessageSender.openDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '发送器详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/message/sender/update/' + MessageSender.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除发送器
 */
MessageSender.delete = function () {
    if (this.check()) {
       var operation = function(){
            var ajax = new $ax(Feng.ctxPath + "/message/sender", function (data) {
                Feng.success("删除成功!");
                MessageSender.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("id",MessageSender.seItem.id);
            ajax.setType("delete");
            ajax.start();
        };
        Feng.confirm("是否删除消息发送器？",operation);
    }
};


$(function () {
    var defaultColunms = MessageSender.initColumn();
    var table = new BSTable(MessageSender.id, "/message/sender/list", defaultColunms);
    table.setPaginationType("server");
    MessageSender.table = table.init();
});
