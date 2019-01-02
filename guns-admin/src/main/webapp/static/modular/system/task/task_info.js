/**
 * 初始化系统参数详情对话框
 */
var TaskInfoDlg = {
    taskInfoData : {}
};

/**
 * 清除数据
 */
TaskInfoDlg.clearData = function() {
    this.taskInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TaskInfoDlg.set = function(key, val) {
    this.taskInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TaskInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
TaskInfoDlg.close = function() {
    parent.layer.close(window.parent.Task.layerIndex);
}

/**
 * 收集数据
 */
TaskInfoDlg.collectData = function() {
    this
    .set('id')
    .set('name')
    .set('jobClass')
    .set('data')
    .set('note')
    .set('cron');
}

/**
 * 提交添加
 */
TaskInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/task/add", function(data){
        Feng.success("添加成功!");
        window.parent.Task.table.refresh();
        TaskInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.taskInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
TaskInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/task/update", function(data){
        Feng.success("修改成功!");
        window.parent.Task.table.refresh();
        TaskInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.taskInfoData);
    ajax.start();
}

$(function() {

});
