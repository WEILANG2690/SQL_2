alter procedure loop99 @x int ,@y int
    AS

    declare  @i int =1;
	declare  @j int =1;

    begin
	while (@i <= @x)
	begin
	while (@j <= @y)
     begin
	 print cast(@i as varchar(1))+' * '+cast(@j as varchar(1))+' = '+cast(@i*@j as varchar(2))
	 set @j = @j+1
	 end
	 set @i = @i+1
	 set @j = 1
	 end;
    end;

	exec loop99 5 ,5