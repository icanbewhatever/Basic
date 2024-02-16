package org.zerock;

import org.junit.Test;

public class Java17Tests {

    @Test
    public void textBlockTest(){
        String query1 = "SELECT adsfasd, asdfasdf"
                    + "FROM fdsaf"
                    + "WHERE 1=1";
        System.out.println(query1);

        String query2 = """
            SELECT adsfasd, asdfasdf
                    FROM fdsaf
                    WHERE 1=1
    """;
        System.out.println(query2);
    }

    @Test
    public void SwitchTest(){
        String hobby = "영화";
        switch (hobby) {
            case "영화": {
                System.out.println("영화");
                break;
            }
            case "게임" : {
                System.out.println("게임");
                break;
            }
        }

        switch (hobby) {
            case "영화" -> System.out.println("영화");
            case "게임" -> System.out.println("게임");
            default -> System.out.println("case에 없다");
        }
    }
}

