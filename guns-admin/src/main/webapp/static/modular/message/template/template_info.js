/**
 * 初始化发送器详情对话框
 */
var MessageTemplateInfoDlg = {
    formData : {}
};

/**
 * 清除数据
 */
MessageTemplateInfoDlg.clearData = function() {
    this.formData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
MessageTemplateInfoDlg.set = function(key, val) {
    this.formData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
MessageTemplateInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
MessageTemplateInfoDlg.close = function() {
    parent.layer.close(window.parent.MessageTemplate.layerIndex);
}

/**
 * 收集数据
 */
MessageTemplateInfoDlg.collectData = function() {
    this
    .set('id')
    .set('code')
    .set('title')
    .set('content')
    .set('cond')
    .set('type')
    .set('idMessageSender');
}

/**
 * 提交添加
 */
MessageTemplateInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/message/template", function(data){
        Feng.success("添加成功!");
        window.parent.MessageTemplate.table.refresh();
        MessageTemplateInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.formData);
    ajax.start();
}

/**
 * 提交修改
 */
MessageTemplateInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/message/template", function(data){
        Feng.success("修改成功!");
        window.parent.MessageTemplate.table.refresh();
        MessageTemplateInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.formData);
    ajax.start();
}

$(function() {

});
