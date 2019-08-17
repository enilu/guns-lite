package cn.enilu.guns.bean.entity.message;

import cn.enilu.guns.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;

import javax.persistence.*;

/**
 * 消息模板
 */
@Data
@Entity(name="t_message_template")
@Table(appliesTo = "t_message_template",comment = "消息模板")
public class MessageTemplate extends BaseEntity {
    @Column(name="code",columnDefinition = "VARCHAR(32) COMMENT '编号'")
    private String code;
    @Column(name="title",columnDefinition = "VARCHAR(64) COMMENT '标题'")
    private String title;
    @Column(name="content",columnDefinition = "TEXT COMMENT '内容'")
    private String content;
    @Column(name="cond",columnDefinition = "VARCHAR(32) COMMENT '发送条件'")
    private String cond;
    @Column(name="id_message_sender",columnDefinition = "BIGINT COMMENT '发送者id'")
    private Long idMessageSender;
    @Column(name="type",columnDefinition = "VARCHAR(32) COMMENT '消息类型,0:短信,1:邮件'")
    private Integer type;
    @JoinColumn(name="id_message_sender", referencedColumnName = "id",  columnDefinition = "BIGINT comment '发送者id'", insertable = false, updatable = false)
    @ManyToOne(fetch = FetchType.EAGER)
    private MessageSender messageSender;
    @Transient
    public String getTypeName(){
        return type==0?"短信":"邮件";
    }
}
