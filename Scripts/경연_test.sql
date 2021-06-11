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

-- 80%넘은 성공임박프로젝트  
select p.prjno, p.userno, p.prjname, p.prjcontent, p.startdate, p.enddate,p.PayDate ,u.UserId , u.UserName ,
sum(optprice), p.PrjGoal,sum(optprice)/PrjGoal*100 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo 
join project p on o.prjno = p.PrjNo 
join userinfo u on u.userno = p.userno
group by o.PrjNo having sum(optprice)/PrjGoal*100>80;

select * from prjoption p2; 
-- 번호별 
select o.prjNo ,count(*),sum(optprice) 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo group by o.prjNo;


select f.prjNo,f.FundingNo ,p.PrjName ,sum(optprice),p.StartDate , p.EndDate , p.PayDate , p.EndYN ,f.PayYN
		  from fundinginfo f join project p on f.PrjNo = p.PrjNo join prjoption o on f.OptNo = o.OptNo group by p.prjno;
		  
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as sum, p.Prjname, u.UserName
		,count(fundingno)
	  from fundinginfo f 
      join prjoption o on o.optno= f.OptNo 
	  right join project p on p.prjno = f.PrjNo 
	  join userinfo u on p.userno = u.userno
	 group by p.prjNo;