	create table calendar(
		id number primary key,
		title varchar2(100),
		writer varchar2(50),
		start1 varchar2(50),   
		end1 varchar2(50),
		content varchar2(1000),
		backgroundcolor varchar2(50),
		textcolor varchar2(50),
		allday number(1),
		urllink varchar2(50)
	);
	create sequence calendar_seq;
	insert into calendar values(calendar_seq.nextval,'첫번째 일정','홍길동',
		'2025-01-06','2025-01-07','두일정입니다','#3399ff',' #ffff00',1,
		'http://www.naver.com');
	insert into calendar values(calendar_seq.nextval,'두번째 일정','석송이',
		'2025-01-30','2025-01-31','두번째일정입니다','#3399ff',' #ffff00',1,
		'http://www.naver.com');
/*
insert into calendar values(cal_seq.nextval,#{title},#{writer},
	#{start},#{end},#{content},#{backgroundColor},#{textColor},
	#{allDay},#{urllink} )
	
 * */	
	
SELECT id, title, writer, start1 "START", end1 "END",
	   content, backgroundcolor,
	textcolor, allday, urllink 
FROM calendar;

SELECT * FROM cookieemp;
COMMIT;
	