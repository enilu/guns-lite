/**
 * 初始化发送器详情对话框
 */
var MessageSenderInfoDlg = {
    formData : {}
};

/**
 * 清除数据
 */
MessageSenderInfoDlg.clearData = function() {
    this.formData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
MessageSenderInfoDlg.set = function(key, val) {
    this.formData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
MessageSenderInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
MessageSenderInfoDlg.close = function() {
    parent.layer.close(window.parent.MessageSender.layerIndex);
}

/**
 * 收集数据
 */
MessageSenderInfoDlg.collectData = function() {
    this
    .set('id')
    .set('name')
    .set('className')
    .set('tplCode');
}

/**
 * 提交添加
 */
MessageSenderInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/message/sender", function(data){
        Feng.success("添加成功!");
        window.parent.MessageSender.table.refresh();
        MessageSenderInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.formData);
    ajax.start();
}

/**
 * 提交修改
 */
MessageSenderInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/message/sender", function(data){
        Feng.success("修改成功!");
        window.parent.MessageSender.table.refresh();
        MessageSenderInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.formData);
    ajax.start();
}

$(function() {

});
