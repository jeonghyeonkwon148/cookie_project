
CREATE TABLE chat(
	chat_id number(4,0) PRIMARY KEY,
	sender varchar2(40),--보낸자
	receiver varchar2(40),--받는자
	content  varchar2(100),--내용
	readcnt number(4,0),--읾음여부 표시
	send_date date--보낸날짜	
);
DROP SEQUENCE chat_seq;
CREATE SEQUENCE chat_seq;

INSERT INTO chat values(chat_seq.nextval,'홍길동','김준우','테스트1',0,sysdate);
INSERT INTO chat values(chat_seq.nextval,'김길동','박지우','테스트2',0,sysdate);
UPDATE CHAT 
		SET readcnt = 0
		WHERE chat_id = 1;
SELECT * FROM chat;
SELECT * FROM chat WHERE sender = '홍'OR RECEIVER ='박지우';
SELECT * FROM CHAT 
		WHERE SENDER LIKE '%%'
		AND RECEIVER LIKE '%%'
		ORDER BY chat_id;


/*
SELECT * FROM CHAT 
		WHERE SENDER LIKE #{sender}
		AND RECEIVER LIKE #{receiver}
		ORDER BY chat_id
List<Chat> getChatList();

SELECT * FROM chat WHERE sender =#{sender} 
Chat getChatBySender(@Param("sender") String sender);

SELECT * FROM chat WHERE receiver =#{receiver}
Chat getChatByReceiver(@Param("receiver") String receiver);

SELECT * FROM chat
List<Chat> getChatlist();

INSERT INTO chat values(chat_seq.nextval,#{sender},#{receiver},#{content},0,sysdate)
int insertChat(Chat ins);

UPDATE CHAT 
		SET readcnt =#{readcnt}
		WHERE chat_id =#{chat_id};
int updateChat(Chat upt);		
*/
SELECT * FROM chat WHERE chat_id =1;
DELETE FROM chat WHERE chat_id=1;
/*
SELECT * FROM chat WHERE chat_id =#{chat_id}
Chat getChatById(@Param("chat_id") int chat_id);

DELETE FROM chat WHERE chat_id=#{chat_id}
int deleteChat(@Param("chat_id") int chat_id);

UPDATE CHAT 
		SET readcnt = readcnt +1
		WHERE chat_id =#{chat_id}
int readCntUpdate(@Param("chat_id") int chat_id);
*/
UPDATE CHAT 
		SET readcnt = readcnt +1
		WHERE chat_id =1;


SELECT * FROM cookieemp;
SELECT * FROM customer;
COMMIT;
