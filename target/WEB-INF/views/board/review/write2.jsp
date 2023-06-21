<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SEOULLIVE</title>

</head>
<body>
    <form action="write" method="post" enctype="multipart/form-data">
        <div style="width: 100%;">
            <input type="text" style="width: 100%;" id="title" name="title" placeholder="제목을 입력하세요">
            <input type="text" style="width: 100%;" id="id" name="id" value="manager">
        </div>
        <div>
            <input  type="file" name="files" id="files" class="files form-control form-control-sm" multiple>
        </div>


        <div class="file_drag" id="file_drag">
            <div id="plz_drag">파일을 마우스로 끌어 오세요</div>
            <div class="file_list_header" style="display: none;">
                <div class="file_list_header_task">
                    <button type="button" id="removeAll_button"><span class="blind">X</span></button>
                </div>
                <div class="file_list_header_title"><span class="text">파일명</span></div>
                <div class="file_list_header_volume"><span class="text">총용량 </span><span id="fileSize">0</span></div>
            </div>

            <ul id="fileList"></ul>
        </div>

        <textarea name="contents" id="summernote"></textarea>

        <button type="submit">작성</button>
    </form>

</body>
</html>
