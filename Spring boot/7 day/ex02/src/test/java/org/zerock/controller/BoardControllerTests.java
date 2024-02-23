package org.zerock.controller;

import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
//@ContextConfiguration(classes = {DBConfig.class})  // spring boot3에서는 불필요
@AutoConfigureMockMvc   // MockMvc를 spring container로 세팅
@SpringBootTest
public class BoardControllerTests {
    @Autowired
    private MockMvc mockMvc;            // 가짜 spring mvc???

    @Test
    public void testList() throws Exception{
        log.info("testList: " +
                mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
                        .andReturn()
                        .getModelAndView()
                        .getModelMap()
        );
    }

    @Test
    public void testRegister() throws Exception {
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
                .param("title", "테스트 새글 제목")
                .param("content", "테스트 글 내용")
                .param("writer", "user00")
        ).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    @Test
    public void testGet() throws Exception {

        log.info(mockMvc.perform(MockMvcRequestBuilders
                .get("/board/get")
                .param("bno", "11"))
                .andReturn()
                .getModelAndView().getModelMap());
    }

    @Test
    public void testModify() throws Exception {

        String resutlPage = mockMvc
                .perform(MockMvcRequestBuilders.post("/board/modify")
                        .param("bno", "1")
                        .param("title", "수정 새글 제목")
                        .param("content", "수정 새글 내용")
                        .param("writer", "user00"))
                .andReturn().getModelAndView().getViewName();

        log.info(resutlPage);
    }
    @Test
    public void testRemove() throws Exception {
        //삭제전 디비 번호 확인
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
                .param("bno", "23")
                ).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }
}
