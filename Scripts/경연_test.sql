-- 리스트에서 프로젝트를 클릭했을 때 판매자 정보와 함께 select
select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
			StartDate, EndDate,	PayDate, EndYN, u.UserId , u.UserName 
from project p 
join userinfo u on p.userno = u.UserNo		   
join prjoption o on p.PrjNo =o.PrjNo 
			where p.PrjNo =1;
		
select * from fundinginfo f ;
select * from prjoption o ;
select * from userinfo u2 ;
select * from userinfo o where Secession is null  or Secession is false;
select * from userinfo where BankAccount is not null and BankName is not null;

update userInfo set Secession = true where userno=3;

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



-- 80%넘은 성공임박프로젝트  
select p.prjno, p.userno, p.prjname, p.prjcontent, p.startdate, p.enddate,p.PayDate ,u.UserId , u.UserName ,
sum(optprice), p.PrjGoal,sum(optprice)/PrjGoal*100 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo 
join project p on o.prjno = p.PrjNo 
join userinfo u on u.userno = p.userno
group by o.PrjNo having sum(optprice)/PrjGoal*100>80;

-- 번호별 
select o.prjNo ,count(*),sum(optprice) 
from fundinginfo f 
join prjoption o on o.optno= f.OptNo group by o.prjNo;

-- 성공임박프로젝트
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		 group by p.prjNo having sum(optprice)/PrjGoal*100>80;

		
-- 프로젝트명 검색
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  where prjName like '%기%'
		 group by p.prjNo;

-- 제작자 검색
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  where u.Nickname LIKE CONCAT('%', 'ks' , '%');
		 group by p.prjNo;

select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  where p.prjNo =1
		 group by p.prjNo;

-- 옵션번호로 관련프로젝트정보
select p.prjNo,p.UserNo, PrjName, PrjContent, PrjGoal,
				StartDate, EndDate, PayDate, EndYN, u.UserId , u.UserName,u.nickname,u.userPhone,
				o.OptNo, o.OptPrice,o.OptContent,o.optName
			from project p join userinfo u on p.userno = u.UserNo 
						   join prjoption o on p.PrjNo =o.PrjNo
			where o.optNo = 6;
			
select * from admin;

select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;

select * from prjoption o join fundinginfo f on o.optno = f.optNo;
		
select o.optno,o.prjno from prjoption o left join fundinginfo f on o.optno = f.optNo group by f.optno having o.prjno=1;

select ifnull(count(f.optno),0),o.optno,p.prjno from prjoption o join fundinginfo f on o.optno = f.optNo
                                                right join project p on f.prjno = p.prjno group by f.optno having p.prjno = 1;
                                               
                                               
select ifnull(sum(optprice),0) as totalprice, ifnull(count(fundingno),0) as totalcount , ifnull(count(distinct (p.prjNo)),0) as prjno
from project p left join fundinginfo f on p.prjno = f.prjno
			   left	join prjoption o on o.optno = f.optno; 
			  
select * from fundinginfo f join prjoption o on f.optno = o.optno where f.prjno = 2;
s