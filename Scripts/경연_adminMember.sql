-- 결제완료한 프로젝트 수
select count(*)  from fundinginfo where userno=2 and payyn=0;
-- 결제완료한 총금액
select sum(optprice) 
from fundinginfo f  join prjoption o on f.optno =o.optno  
where userno=1 and payyn=0;

select * from fundinginfo;
