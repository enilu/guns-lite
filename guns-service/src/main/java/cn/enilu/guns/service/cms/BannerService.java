package cn.enilu.guns.service.cms;

import cn.enilu.guns.bean.enumeration.cms.BannerTypeEnum;
import cn.enilu.guns.bean.vo.offcialSite.Banner;
import cn.enilu.guns.dao.cms.BannerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerService {
    @Autowired
    private BannerRepository bannerRepository;

    /**
     * 查询首页banner数据
     * @return
     */
    public Banner queryIndexBanner(){
    return queryBanner(BannerTypeEnum.INDEX.getValue());
    }

    public Banner queryBanner(String type){
        Banner banner = new Banner();
        List<cn.enilu.guns.bean.entity.cms.Banner> bannerList = bannerRepository.findAllByType(type);
        banner.setIndex(0);
        banner.setList(bannerList);
        return  banner;
    }
}
