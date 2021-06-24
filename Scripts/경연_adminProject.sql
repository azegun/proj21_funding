select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;

		
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname, endDate, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;
		
-- 프로젝트별 후원자 리스트
select fundingno,prjName,f.optNo,optPrice, u.username ,u.nickname
	from userinfo u left join fundinginfo f on u.userno = f.userno
					join project p on p.prjno = f.PrjNo 
					join prjoption o on o.optno= f.optno where p.prjNo= 1;
				
select p.prjno, p.prjgoal, sum(optprice),  count(fundingno), round(sum(optprice)/prjgoal*100,2) as rate
	from userinfo u left join fundinginfo f on u.userno = f.userno
					join project p on p.prjno = f.PrjNo 
					join prjoption o on o.optno= f.optno where p.prjNo= 1;
				
				
select fundingno,prjName,f.optNo,optPrice,u.username,u.nickname
	from userinfo u left join fundinginfo f on u.userno = f.userno
					join project p on p.prjno = f.PrjNo 
					join prjoption o on o.optno= f.optno where = 2;
				
select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager,u.userName as managerName
			,count(fundingno) as totalCount, round(sum(optprice)/prjgoal*100,2) as rate
		  from fundinginfo f
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  where p.prjNo =1
		 group by p.prjNo;
;