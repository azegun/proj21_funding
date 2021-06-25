<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <style>
      .container {
        width: 500px;
        height: 140px;
        overflow: auto;
      }
      /*스크롤바  */
       .container::-webkit-scrollbar{
       width: 10px;
       /*스크롤바 확인 
       background-color: black; */
       }
       .container::-webkit-scrollbar-thumb{
       border-radius:10px;
       background-color:crimson; 
       }
       .container::-webkit-scrollbar-track{
        border-radius:10px;
       background-color:gold;
       box-shadow: inset 0px 0px 5px white;
       }
    </style>
  </head>
  <body>
    <div class="container">
      Lorem ipsum, dolor sit amet consectetur adipisicing elit. Enim modi in
      exercitationem explicabo, at rem officia autem non porro soluta dolorum
      officiis ipsa repellat, laudantium ea unde labore, temporibus quas?Lorem
      ipsum dolor sit amet, consectetur adipisicing elit. Eveniet eius totam
      quam pariatur ratione, in voluptatem dignissimos laboriosam sint aut!
      Repudiandae consectetur odit quo corrupti quidem perferendis aut dolores
      quis?Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat nam
      optio dolore recusandae fuga voluptatibus. Ea quam deserunt consectetur
      quo aut eligendi, molestiae incidunt molestias ullam? Repellendus ratione
      repellat
    </div>
  </body>
</html>