$(function(){
    $('.btn-reply').click(function(){
        comment_post_id = this.value;
        comment_name = $('#comment_' + comment_post_id + "_name").val();
        comment_content = $('#comment_' + comment_post_id + "_content").val();
            
    if(comment_content != ""){
        $.ajax({
            method: "POST",
            url: "/billboard/comment",
            data: { user_name: comment_name, content: comment_content, post_id: comment_post_id },
            success: function(){
                $(".comment_"+ comment_post_id + "_name").append("<p>" + comment_name + "</p>")
                $(".comment_"+ comment_post_id + "_content").append("<p>" + comment_content + "</p>")
                $('#comment_' + comment_post_id + "_content").val("")
            },
            error: function(){
                alert("댓글 작성에 실패하였습니다.");
            }
        })
    } else {
        alert("댓글 내용을 적어주세요.");
    }
});
        
        
$('.who_timeline').change(function(){
            
    select_value = $('.who_timeline option:selected').val();
            
        if(select_value == "mijeong"){
            $('.mijeong').css("display", "block");
            $('.ahyun').css("display", "none");
            $('.cheol').css("display", "none");
        } else if(select_value == "ahyun"){
            $('.mijeong').css("display", "none");
            $('.ahyun').css("display", "block");
            $('.cheol').css("display", "none");
        } else if(select_value == "cheol"){
            $('.mijeong').css("display", "none");
            $('.ahyun').css("display", "none");
            $('.cheol').css("display", "block");
        } else{
            $('.mijeong').css("display", "block");
            $('.ahyun').css("display", "block");
            $('.cheol').css("display", "block");
        }
    });
})