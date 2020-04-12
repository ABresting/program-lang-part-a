(* Home Assisgnment 1 for the programming lang. course  *)


fun is_older(date1 : (int * int * int), date2 : (int * int * int)) =
	 if (#1 date1 > #1 date2) andalso
	    (#2 date1 > #2 date2) andalso
	    (#3 date1 > #3 date2)
	 then true
	 else false
		      
			  
fun number_in_month( date_list : (int * int * int) list, a_month : int) =
    if (null date_list)
    then 0
    else if (( #2 (hd(date_list))) <> a_month)
    then number_in_month((tl date_list), a_month)
    else 1 + number_in_month((tl date_list), a_month)
			    
fun number_in_months(dates : (int * int * int) list, months : int list) =
    if null months
    then 0
    else number_in_month(dates, (hd months)) + number_in_months(dates, (tl months))
			    
fun dates_in_month(date_list : (int * int * int) list, a_month : int) =
    if (null date_list)
    then []
    else if (( #2 (hd(date_list))) <> a_month)
    then dates_in_month((tl date_list), a_month)
    else (hd date_list) :: dates_in_month((tl date_list), a_month)


fun dates_in_months(dates : (int * int * int) list, months : int list) =
    if (null months)
    then []
    else dates_in_month(dates, (hd months)) @ dates_in_months((dates), (tl months))


fun get_nth(names : string list, month : int ) =
    if month = 1
    then hd names
    else get_nth(( tl names), month -1)

		
fun date_to_string (date : (int * int * int)) =
    let
	val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	val date_num = Int.toString(#3 date);
	val year_num = Int.toString(#1 date);
	val month_str = get_nth(months, (#2 date))

    in
	month_str^" "^date_num^", "^year_num
    end

fun number_before_reaching_sum( lst : int list, sum : int) =
    if sum <= 0
    then ~1
    else 1 + number_before_reaching_sum((tl lst), sum - (hd lst))
				       
	
fun what_month(day: int) =
    let
	val days = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
	number_before_reaching_sum(days, day) +1
    end

fun month_range(day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1+1, day2)	
											    		
fun get_nth1(names : string list, month : int) =
    let
	fun cnt_string(counter: int) =
	    if counter = 1
	    then (hd names)
	    else ( (tl names);
	       cnt_string(counter -1)
	     )
    in
	cnt_string month
    end
	
