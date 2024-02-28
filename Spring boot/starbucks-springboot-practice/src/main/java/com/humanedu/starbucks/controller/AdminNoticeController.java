package com.humanedu.starbucks.controller;

import com.humanedu.starbucks.domain.FreeBoardVO;
import com.humanedu.starbucks.service.FreeBoardService;
import lombok.extern.log4j.Log4j;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Log4j
@Controller
public class AdminNoticeController {

    @Autowired
    private FreeBoardService freeBoardService;

    @GetMapping("/adminNoticeList")
    public String adminNoticeList(
            @RequestParam(value = "search", required = false) String search, Model model) {
        List<FreeBoardVO> freeBoardVOList = freeBoardService.getFreeBoardList(search);

        model.addAttribute("freeBoardVOList", freeBoardVOList);
        model.addAttribute("search", search);
        return "adminNoticeList";
    }

    @PostMapping("/adminNoticeInsert")
    public String adminNoticeInert(
            MultipartFile[] fileContent,
            @RequestParam("korName") String korName,
            @RequestParam("title") String subject,
            @RequestParam("content") String content,
            RedirectAttributes rttr
    ){
        String uploadFolder ="C:\\SpringBoot\\starbucks-springboot-practice\\src\\main\\resources\\static\\upload-files";

        List<String> fileNameArray = new ArrayList<>();
        for (MultipartFile multipartFile : fileContent){
            log.info("--------");
            log.info("Upload file name: " + multipartFile.getOriginalFilename());
            log.info("Upload file size: " + multipartFile.getSize());

            fileNameArray.add(multipartFile.getOriginalFilename());

            File saveFile = new File(uploadFolder, multipartFile.getName());
            try{
                multipartFile.transferTo(saveFile);
            }catch (Exception e){
                log.error(e.getMessage());
            }
        }

        int rtn = freeBoardService.insertFreeBoard(korName, subject, content, fileNameArray);
        rttr.addFlashAttribute("insertSuccessCount", rtn);
        return "redirect:/adminNoticeList";
    }

    @GetMapping("/adminNoticeInsertForm")
    public String adminNoticeInsertForm(){
        return "adminNoticeInsertForm";
    }

    @PostMapping("/adminNoticeUpdate")
    public String adminNoticeUpdate(
            MultipartFile[] fileContent,
            @RequestParam("korName") String korName,
            @RequestParam("title") String subject,
            @RequestParam("content") String content,
            @RequestParam("num") int num,
            RedirectAttributes rttr
    ){
        int rtn = freeBoardService.updateFreeBoard(
                korName,
                subject,
                content,
                num,
                fileContent[0].getOriginalFilename(),
                fileContent[1].getOriginalFilename()
        );
        rttr.addFlashAttribute("updateSuccessCount", rtn);
        return "redirect:/adminNoticeList";
    }

    @GetMapping("/adminNoticeUpdateForm")
    public String adminNoticeUpdateForm(@RequestParam("num") int num, Model model){
        FreeBoardVO freeBoardVO = freeBoardService.selectFreeBoardOne(num);
        model.addAttribute("freeBoard", freeBoardVO);

        return "adminNoticeUpdateForm";
    }

    @PostMapping("/adminNoticeDelete")
    public String adminNoticeDelete(@RequestParam("num") int num, RedirectAttributes rttr){
        int rtn = freeBoardService.deleteFreeBoard(num);
        rttr.addFlashAttribute("deleteSuccessCount", rtn);

        return "redirect:/adminNoticeList";
    }

}
