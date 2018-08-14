/**
 * 初始化系统参数详情对话框
 */
var CfgInfoDlg = {
    cfgInfoData : {}
};

/**
 * 清除数据
 */
CfgInfoDlg.clearData = function() {
    this.cfgInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
CfgInfoDlg.set = function(key, val) {
    this.cfgInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
CfgInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
CfgInfoDlg.close = function() {
    parent.layer.close(window.parent.Cfg.layerIndex);
}

/**
 * 收集数据
 */
CfgInfoDlg.collectData = function() {
    this
    .set('id')
    .set('cfgName')
    .set('cfgValue')
    .set('cfgDesc');
}

/**
 * 提交添加
 */
CfgInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/cfg/add", function(data){
        Feng.success("添加成功!");
        window.parent.Cfg.table.refresh();
        CfgInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.cfgInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
CfgInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/cfg/update", function(data){
        Feng.success("修改成功!");
        window.parent.Cfg.table.refresh();
        CfgInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.cfgInfoData);
    ajax.start();
}

$(function() {

});
