libname chinook "C:\Users\cpayet\Documents\IESEG\SAS SQL\BRT-master\BRT-master\Extra_dataset"; run;

proc sql;
create table chinook.Data_All as
select *
from chinook.albums as al,
	chinook.artists as ar,
	chinook.customers as cu,
	chinook.employees as em,
	chinook.genres as ge,
	chinook.invoices as in,
	chinook.invoice_items as ii,
	chinook.media_types as mt,
	chinook.playlists as pl,
	chinook.playlist_track as pt,
	chinook.tracks as tr
where mt.MediaTypeId = tr.MediaTypeId
	and ge.genreid = tr.genreid
	and pl.playlistid = pt.playlistid
	and pt.trackid = tr.trackid
	and ar.artistid = al.artistid
	and al.albumid = tr.albumid
	and ii.trackid = tr.trackid
	and in.invoiceid = ii.invoiceid
	and in.customerid = cu.customerid
	and cu.supportrepid = em.employeeid
;
quit;
run;

proc sql;
select distinct country,count(customerid)
from chinook.customers
group by 1
order by 1;
quit;
run;





