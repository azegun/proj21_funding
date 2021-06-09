-- 리스트에서 프로젝트를 클릭했을 때 판매자 정보와 함께 select
select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
			StartDate, EndDate,	PayDate, EndYN, u.UserId , u.UserName 
from project p 
join userinfo u on p.userno = u.UserNo		   
join prjoption o on p.PrjNo =o.PrjNo 
			where p.PrjNo =1;
		
select * from fundinginfo f ;
select * from prjoption o ;



-- 프로젝트별 인원수, 가격
select count(*),sum(optprice) 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo where f.prjno = 1;

select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
			StartDate, EndDate,	PayDate, EndYN, u.UserId , u.UserName,
			o.OptNo, o.OptPrice,o.OptContent
			from project p join userinfo u on p.userno = u.UserNo
						   join prjoption o on p.PrjNo =o.PrjNo 
			where o.prjNo = 1;


select * from prjoption p group by prjno;