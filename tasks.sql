-- Declare variables to hold cursor attributes

DECLARE
    v_pizza_id pizza_db.pizza_id%TYPE;
    v_total_sales pizza_db.total_price%TYPE;
    v_pizza_name VARCHAR2(100);

-- Declare the cursor for fetching sales data
    
    CURSOR p_sales IS
        SELECT pizza_name_id, SUM(total_price) AS total_sales
        FROM pizza_db
        GROUP BY pizza_name_id;
    
    v_cursor_details pizza_details%ROWTYPE; 
BEGIN
-- Open the cursor

    OPEN p_sales;

     -- Fetch data from the cursor
    LOOP
        FETCH p_sales INTO v_pizza_name, v_total_sales;
        EXIT WHEN p_sales%NOTFOUND;

 -- Display the sales report
       
            DBMS_OUTPUT.PUT_LINE('Product: ' || v_pizza_name || ', Total Sales: ' || v_total_sales);
    
    END LOOP;
     
-- Close the cursor

    CLOSE p_sales;
END;