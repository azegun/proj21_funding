select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;

		
		select p.prjno, if(sum(optPrice)>0,sum(optPrice),0) as totalPrice, p.Prjname, p.prjgoal, u.nickname as prjManager
			,count(fundingno) as totalCount, c.pcategoryno, c.pcategoryname, endDate, round(sum(optprice)/prjgoal*100,2)
		  from fundinginfo f 
	      join prjoption o on o.optno= f.OptNo 
		  right join project p on p.prjno = f.PrjNo 
		  join userinfo u on p.userno = u.userno
		  join prjCategory c on p.pcategoryno = c.pcategoryno
		 group by p.prjNo;