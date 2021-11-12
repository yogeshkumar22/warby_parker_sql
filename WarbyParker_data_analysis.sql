
--BASIC UNDERSTANDING OF THE DATA

SELECT * 
FROM survey 
LIMIT 10;

--QUITTERS AT EACH QUESTION

SELECT question, 
	COUNT(user_id) AS quitters 
FROM survey
GROUP BY 1
ORDER BY 1;

--REST OF THE TABLES

SELECT * FROM quizData
LIMIT 5;

SELECT * FROM homeTryOnData
LIMIT 5;

SELECT * FROM purchaseData
LIMIT 5;

--UNIQUE REQUIREMENTS

SELECT DISTINCT qu.user_id,
	hto.user_id IS NOT NULL AS 'is_home_try_on',
	hto.number_of_pairs,
	pu.user_id IS NOT NULL AS 'is_purchase'
FROM quizData qu
LEFT JOIN homeTryOnData hto
ON qu.user_id = hto.user_id
LEFT JOIN purchaseData pu
ON pu.user_id = qu.user_id
LIMIT 10;