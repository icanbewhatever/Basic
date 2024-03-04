console.log('Reply Module...');

var replyService = (function() {
//    return { name: "AAAA" };

    // 댓글 등록 ajax 호출함수
    function replyAdd(reply, callback, error) {
        console.log("add reply...............");

        $.ajax({
            // request처리
            type : 'post',                                      // form의 method속성 값
            url : '/replies/new',                               // form의 action값
            data : JSON.stringify(reply),                       // json으로 string처리하면서 파라미터 전달
            contentType : "application/json; charset=utf-8",    // content-type지정
            // response처리
            success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 댓글 목록 함수
    function getList(param, callback, error) {
        var bno = param.bno;
        var page = param.page || 1;

        $.getJSON("/replies/board/" + bno + "/page/" + page + "/pagesize/10",       // get 전용 ajax함수
            function(data) {                                            // 호출 성공시 처리되는 함수
                if (callback) {
                    callback(data);
                }
        }).fail(
            function(xhr, status, err) {                                // 호출 실패시 처리되는 함수
                if (error) {
                    error();
                }
        });
    }
    //댓글삭제
    function remove(rno, callback, error) {
        $.ajax({
            type: 'delete',
            url: '/replies/' + rno,
            success : function(deleteResult, status, xhr) {
                if (callback){
                    callback(deleteResult);
                    }
                },
                error : function(xhr, status, er) {
                if (error) {
                    error(er);
                    }
                }
        });
    }

    //수정
    function update(reply, callback, error) {
        console.log("RNO: " + reply.rno);

        $.ajax({
            type: 'put',
            url: '/replies/' + reply.rno,
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result, status, xhr){
                if(callback){
                    callback(result);
                }
            },
            error: function(xhr, status, er) {
                if(error){
                    error(er);
                }
            }
            });
        }

    return {
        add: replyAdd,
        getList: getList,
        remove: remove,
        update: update
    };       // replyAdd function의 내용이 나옴
})();