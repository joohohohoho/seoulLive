package org.zerock.seoulive.board.travel.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.seoulive.board.travel.domain.BoardVO;
import org.zerock.seoulive.board.travel.domain.Criteria;
import org.zerock.seoulive.board.travel.domain.PageDTO;
import org.zerock.seoulive.board.travel.exception.ControllerException;
import org.zerock.seoulive.board.travel.service.BoardService;


@NoArgsConstructor
@Log4j2

@RequestMapping("/board/travel/*")
@Controller
public class BoardController {
    @Setter(onMethod_ = @Autowired)
    private BoardService service;


    // 게시판 목록조회
    @GetMapping("/list")
    public void list(Criteria cri, Model model) throws ControllerException {
        log.trace("list({}, {}) invoked.", cri, model);

        try {
            List<BoardVO> list = this.service.getList(cri);

            model.addAttribute("__LIST__",list);

            PageDTO pageDTO = new PageDTO(cri, this.service.getTotal(cri));
            model.addAttribute("pageMaker", pageDTO);
            model.addAttribute("list", service.getList(cri));
        } catch (Exception e) {
            throw new ControllerException(e);
        } // try-catch
    }

    // 날짜 데이터 받아오기
    @RequestMapping(value = "/board/travel/listByDate", method = RequestMethod.GET)
    @ResponseBody
    public List<String> processClickedDate(@RequestParam("selectedDate") String selectedDate) throws ControllerException {
        try {
            // selectedDate에서 년, 월, 일을 추출
            String[] dateParts = selectedDate.split("-");
            int year = Integer.parseInt(dateParts[0]);
            int month = Integer.parseInt(dateParts[1]);
            int day = Integer.parseInt(dateParts[2]);

            // 월과 일이 한 자리인 경우 앞에 0을 추가
//            String formattedMonth = String.format("%02d", month);
//            String formattedDay = String.format("%02d", day);
//
//            // yyyy-MM-dd 형식으로 맞춘 날짜 문자열 생성
//            String formattedDate = year + "-" + formattedMonth + "-" + formattedDay;

            List<String> searchList = getSearchList(); // 실제 검색 대상 리스트를 얻는 메서드 호출

            List<String> foundItems = new ArrayList<>();
            for (String item : searchList) {
                if (item.equals(selectedDate)) {
                    foundItems.add(item);
                }
            }

            return foundItems;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ControllerException(e);
        }
    }

    // 실제 검색 대상 리스트를 반환하는 메서드 (예시)
    private List<String> getSearchList() {
        List<String> searchList = new ArrayList<>();
        // 검색 대상 리스트를 얻는 로직을 구현
        // 예시로 임의의 데이터를 추가
        searchList.add("2023-05-23");
        searchList.add("2023-05-24");
        searchList.add("2023-05-25");
        return searchList;
    }

    @GetMapping




    @RequestMapping("/write")
    public String write() {

        return "board/travel/write";
    }

    @RequestMapping("/view")
    public String view() {

        return "board/travel/view";
    }

} // end class
