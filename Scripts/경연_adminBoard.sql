-- 공지 이벤트 모든글 출력
select * 
from boardcategory bc join board b on bc.CategoryNo =b.CategoryNo 
where bc.categoryno in(1,2);

select * from board