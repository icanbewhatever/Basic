package org.zerock.mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.bytebuddy.implementation.attribute.AnnotationAppender;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.config.DBConfig;
import org.zerock.domain.ReplyVO;

import java.util.stream.IntStream;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfig.class})
@Log4j
public class ReplyMapperTests {

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replyMapper;

    private Long [] bnoArr = {11L, 28L, 20L};
    @Test
    public void testCreate(){

        IntStream.rangeClosed(0,2).forEach(i -> {

            ReplyVO vo = new ReplyVO();

            vo.setBno(bnoArr[i]);
            vo.setReply("댓글 테스트" + 1);
            vo.setReplyer("작성자" + 1);

            replyMapper.insert(vo);
        });
    }

    @Test
}
