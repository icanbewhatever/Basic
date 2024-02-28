package com.humanedu.starbucks.service;

import com.humanedu.starbucks.domain.FreeBoardVO;
import com.humanedu.starbucks.mapper.BoardMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService {
    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<FreeBoardVO> getFreeBoardList(String search) {
        List<FreeBoardVO> freeBoardVOList = null;
        if(search == null) {
            freeBoardVOList = boardMapper.getFreeBoardList(search);
        } else {
            if (!search.equals("")) {
                freeBoardVOList = boardMapper.getFreeBoardList(search);
            }
        }
        return freeBoardVOList;
    }

    @Override
    public int insertFreeBoard(
            String korName,
            String subject,
            String content,
            List<String> fileNameList) {

        FreeBoardVO freeBoardVO = new FreeBoardVO();
        freeBoardVO.setName(korName);
        freeBoardVO.setSubject(subject);
        freeBoardVO.setContent(content);

        if (fileNameList != null){
            int fileNameSize = fileNameList.size();
            if (fileNameSize >= 1) {
                freeBoardVO.setFile1Path(fileNameList.get(0));
            }
            if (fileNameSize >= 2) {
                freeBoardVO.setFile2Path(fileNameList.get(1));
            }
        }
        int rtn = boardMapper.putFreeBoard(freeBoardVO);
        return rtn;
    }

    @Override
    public int deleteFreeBoard(int num) {
        return boardMapper.removeFreeBoard(num);
    }

    @Override
    public int updateFreeBoard(
            String korName,
            String subject,
            String content,
            int num,
            String file1Path,
            String file2Path) {

        FreeBoardVO freeBoardVO = new FreeBoardVO();
        freeBoardVO.setName(korName);
        freeBoardVO.setSubject(subject);
        freeBoardVO.setContent(content);
        freeBoardVO.setNum(num);

        if (file1Path != "")
            freeBoardVO.setFile1Path(file1Path);
        if (file2Path != "")
            freeBoardVO.setFile2Path(file2Path);

        return boardMapper.upFreeBoard(freeBoardVO);
    }


    @Override
    public FreeBoardVO selectFreeBoardOne(int num){
        return boardMapper.getFreeBoardOne(num);
    }
}



