USE vgb;
INSERT INTO products01 (id, name, unit_price, stock, description, photo_url, discount, class_name)
	VALUES(0,'天上一隻雕',500,1,'','',21,'Outlet');
	
SELECT questions.questionId, questions.productId, user, QA, questions.createTime, customers.name,products.name
FROM vgb.questions LEFT JOIN customers ON customers.id=questions.user LEFT JOIN products ON products.id=questions.questionId
WHERE productId=1; 