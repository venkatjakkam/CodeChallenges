DECLARE
  t_cnt NUMBER:= 0;
  b_cnt NUMBER:= 0;
  rowcount NUMBER:= 0;
BEGIN
  select count(*) into rowcount from csi.PositiveNumbers;
  
  FOR i IN 1..rowcount LOOP
     select NVL(sum(VALUE),0) into b_cnt from csi.PositiveNumbers where rn > i; 
     update csi.PositiveNumbers 
     set rightsum = b_cnt 
     where rn = i;
     
     select NVL(sum(VALUE),0) into t_cnt from csi.testnew1 where rn < i; 
     update csi.PositiveNumbers 
     set leftsum = t_cnt 
     where rn = i;
  
  END LOOP;
END;

select value from csi.PositiveNumbers where leftsum = rightsum;