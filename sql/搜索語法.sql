SELECT p.name ,c.name,c.address,p.description 
FROM vgb.products AS p JOIN vgb.customers AS c ON p.owner = c.id 
WHERE p.name='P5S';

SELECT o.ownerId, o.customerId, o.ownerQA, createTime , c.name, c2.name
FROM vgb.ownerqas AS o JOIN vgb.customers AS c ON o.ownerId = c.id JOIN vgb.customers AS c2 ON o.customerId = c2.id 
WHERE o.ownerId=?;