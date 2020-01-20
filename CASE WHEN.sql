
SELECT a.*,
  CASE  WHEN INSTOCKDATE > '' THEN DAYS(CURRENT_DATE) - days( DATE(TIMESTAMP_FORMAT( INSTOCKDATE, 'YYYYMMDD')) )
 WHEN INSTOCKDATE = '' THEN 0 END AS INSTOCKDAYS
 FROM db.tbihama411 a  where invNo='ST1711001'
 order by a.stockId,a.areaId,a.locX,a.locY,a.locZ,a.coilNo 


 SELECT INSTOCKDATE ,
       CASE CURRLINE
          WHEN 'S1' THEN 'Male'
          WHEN 'A1' THEN 'Female'
          ELSE 'Unknown Value'
       END
FROM   db.tbihama411

SELECT a.*,
  CASE  WHEN INSTOCKDATE > '' THEN DAYS(CURRENT_DATE) - days( DATE(TIMESTAMP_FORMAT( INSTOCKDATE, 'YYYYMMDD')) )
 WHEN INSTOCKDATE = '' THEN 0 END AS INSTOCKDAYS,
 CASE  WHEN CURRLINE IN('S1','A1') THEN  
         CASE  WHEN  COILSTUS IN('20','21','22','23','24','25','2H') THEN 'WIP'
          ELSE ''
          END
  ELSE ''
  END
  AS "CATEGORY"
FROM db.tbihama411 a  where invNo='ST1711001'
 order by a.stockId,a.areaId,a.locX,a.locY,a.locZ,a.coilNo

 

SELECT CURRLINE,COILSTUS,LABELNO,
  CASE  WHEN INSTOCKDATE > '' THEN DAYS(CURRENT_DATE) - days( DATE(TIMESTAMP_FORMAT( INSTOCKDATE, 'YYYYMMDD')) )
 WHEN INSTOCKDATE = '' THEN 0 END AS INSTOCKDAYS,
 CASE  WHEN CURRLINE IN('S1','A1') THEN  
              CASE  WHEN  COILSTUS IN('20','21','22','23','24','25','2H') THEN 'WIP'
          
                WHEN  COILSTUS IN('2P','31','33','34','35','36','3H') THEN 'FG'
                
               ELSE '' 
              END
   ELSE  
           CASE WHEN  CURRLINE IN('') THEN 'Raw Material'
           ELSE '' 
              END
    END
  AS "CATEGORY"
  FROM db.tbihama411 a  where invNo='ST1711001' OR CURRLINE=''
 order by a.stockId,a.areaId,a.locX,a.locY,a.locZ,a.coilNo 


