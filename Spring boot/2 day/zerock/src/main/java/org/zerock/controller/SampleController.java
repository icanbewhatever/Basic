package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;

import java.util.ArrayList;
import java.util.Arrays;

import static com.fasterxml.jackson.databind.cfg.CoercionInputShape.Array;

@Controller //중요하다 bean에 있어야 들어갈 수 있다 @componente 처럼
@RequestMapping("/sample/*")
public class SampleController {
    @RequestMapping(value="") //아무것도 안하면 get방식 ("") 같은 말
    public void basic() {
        System.out.println("basic......");
    }

    @RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
    public void basicGet() {
        System.out.println("basic get......");
    }

    //@RequestMapping(value = "/basicOnlyGet", method = {RequestMethod.GET})
    @GetMapping("basicOnlyPost")
    public void basicGet2() {
        System.out.println("basic get only get......");
    }

    //@RequestMapping(value = "/basicOnlyPost", method = {RequestMethod.POST})
    @PostMapping("/basicOnlyPost")
    public void basicPost() {
        System.out.println("basic post only......");
    }

    @GetMapping("/ex01")
    public String ex01(SampleDTO dto) {
        System.out.println("sampleDto: " + dto);

        return "ex01";
    }

    @GetMapping("/ex02")
    public String ex02(@RequestParam("name") String name
                    , @RequestParam("age") int age) {
        System.out.println("name:" + name);
        System.out.println("age: " + age);

        return "ex02";
    }

    @GetMapping("/ex02List")
    public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
        System.out.println("ids:" + ids);

        return "ex02List";
    }

    @GetMapping("/ex02Array")
    public String ex02Array(@RequestParam("ids") String[] ids) {
        System.out.println("array ids: " + Arrays.toString(ids));

        return "ex02Array";
    }

    @GetMapping("/ex02Bean")
    public String ex02Bean(SampleDTOList list) {
        System.out.println("ex02Bean: " + list);

        return "ex02Bean";
    }
}
