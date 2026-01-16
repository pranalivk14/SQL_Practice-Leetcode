SELECT ROUND(SUM(temp1.tiv_2016),2) AS tiv_2016
FROM 

(SELECT tiv_2016, lat, lon 
FROM Insurance
GROUP BY lat, lon 
HAVING COUNT(*)=1) temp1

JOIN

(SELECT DISTINCT i1.tiv_2016
FROM Insurance i1 JOIN Insurance i2 ON i1.tiv_2015=i2.tiv_2015
WHERE i1.tiv_2015=i2.tiv_2015 AND i1.pid<>i2.pid) temp2

ON temp1.tiv_2016=temp2.tiv_2016