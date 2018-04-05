@/*
    textarea标签中各个参数的说明:
    name : 名称
    id : id
    underline : 是否带分割线
    rows : 行数
    cols : 列数
@*/
<div class="form-group">
    <label class="col-sm-3 control-label">${name}</label>
    <div class="col-sm-9">
            <textarea class="form-control" id="${id}" name="${id}" rows="${rows}" cols="${cols}">
@if(isNotEmpty(value)){
${value}
@}
            </textarea>

    </div>
</div>
@if(isNotEmpty(underline) && underline == 'true'){
    <div class="hr-line-dashed"></div>
@}


