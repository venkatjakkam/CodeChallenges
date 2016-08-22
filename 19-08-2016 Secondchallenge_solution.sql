DECLARE
    MSG VARCHAR2(100);
    msg_wos varchar2(100);
    len_msg_wos integer;
    sqrt_len_msg_wos NUMBER(9,3);
    columns_ceil NUMBER(9,3);
    rows_flr NUMBER(9,3);
    final_output VARCHAR2(100) :='';
    row_index NUMBER :=1;
    col_index number:= 1;
    num_str varchar2(100);
    CUR_INDEX NUMBER := 1;
    SPACES_BEFORE_CUR NUMBER := 0;
    
BEGIN
    MSG := 'HAVE A NICE DAY';
    select REPLACE(MSG,' ','') into MSG_WOS from DUAL;
    dbms_output.put_line(msg_wos);
    select LENGTH(msg_wos) into len_msg_wos from dual;
    dbms_output.put_line(len_msg_wos);
    select SQRT(len_msg_wos) into sqrt_len_msg_wos from dual;
    dbms_output.put_line(sqrt_len_msg_wos);
    select FLOOR(sqrt_len_msg_wos) into rows_flr from dual;
    dbms_output.put_line(rows_flr);
    select CEIL(sqrt_len_msg_wos) into columns_ceil from dual;
    dbms_output.put_line(columns_ceil); 
    
    row_index:=1;
    col_index := 1;
    CUR_INDEX := 1;
    num_str := '';
    
    while CUR_INDEX <= LENGTH(MSG)  
    LOOP
            IF SUBSTR(MSG, CUR_INDEX, 1) = ' ' 
            THEN
                num_str := num_str || (CUR_INDEX - SPACES_BEFORE_CUR) || ' ';
                SPACES_BEFORE_CUR := SPACES_BEFORE_CUR + 1;
            END IF;
            CUR_INDEX := CUR_INDEX + 1;
    END LOOP;
    
    WHILE col_index <= columns_ceil
    LOOP 
        row_index:=1;
        WHILE row_index <= rows_flr
        LOOP      
            if ((row_index - 1) * columns_ceil + col_index <= len_msg_wos) 
            THEN
                final_output  :=  final_output  || SUBSTR(msg_wos, (row_index - 1) * columns_ceil + col_index, 1);
            END if;
            row_index:=row_index+1;
        END LOOP;
               final_output := final_output || ' ';
               col_index:=col_index + 1;
    END LOOP;
    final_output := final_output || ' numsp ' || num_str;
    dbms_output.put_line(final_output); 
END;