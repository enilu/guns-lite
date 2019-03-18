package cn.enilu.guns.bean.dictmap;

import cn.enilu.guns.bean.dictmap.base.AbstractDictMap;

public class CommonDict extends AbstractDictMap {
    @Override
    public void init() {
        put("name","名称");
        put("code","编码");
        put("title","标题");
    }

    @Override
    protected void initBeWrapped() {

    }
}
