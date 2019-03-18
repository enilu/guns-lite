package cn.enilu.guns.service.system;

import cn.enilu.guns.bean.entity.system.FileInfo;
import cn.enilu.guns.bean.enumeration.ConfigKeyEnum;
import cn.enilu.guns.dao.cache.ConfigCache;
import cn.enilu.guns.dao.system.FileInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@Service
public class FileService {
    @Autowired
    private ConfigCache configCache;
    @Autowired
    private FileInfoRepository fileInfoRepository;
    public FileInfo save(MultipartFile multipartFile){
        String uuid = UUID.randomUUID().toString();
        String realFileName =   uuid +"."+ multipartFile.getOriginalFilename().split("\\.")[1];
        try {

            File file = new File(configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH.getValue()) + File.separator+realFileName);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            multipartFile.transferTo(file);
            FileInfo fileInfo = new FileInfo();
            fileInfo.setOriginalFileName(multipartFile.getOriginalFilename());
            fileInfo.setRealFileName(realFileName);
            fileInfoRepository.save(fileInfo);
            return fileInfo;
        } catch (Exception e) {
             return null;
        }
    }

    public FileInfo get(Long id){
        FileInfo fileInfo = fileInfoRepository.getOne(id);
        fileInfo.setAblatePath(configCache.get(ConfigKeyEnum.SYSTEM_FILE_UPLOAD_PATH.getValue()) + File.separator+fileInfo.getRealFileName());
        return fileInfo;
    }
}
