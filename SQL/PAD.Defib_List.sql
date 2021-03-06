use CAGPAD
go

alter proc PAD.Defib_List (
	@DefibId int = null,
    @Selected bit = null
) as

select * into #Selected from PAD.PADSites where Defib is not null

select
	d.DefibId, 
	d.Name, 
	d.Description, 
	d.Supplier, 
	d.Serial, 
	d.WarrantyExpires, 
	d.BatteryExpiry,
    p.PadId,
    p.Location
into
    #Defibs
from
	PAD.Defibrillators d
    left join PAD.PADSites p on d.DefibId = p.Defib
where
	d.DefibId = ISNULL(@DefibId, d.DefibId)

if @Selected = 1
    select
        d.*
    from
        #Defibs d
        join #Selected s on d.DefibId = s.Defib

if @Selected = 0
    select 
        d.*
    from
        #Defibs d
    where
        d.DefibId not in (select Defib from #Selected)

if @Selected is null
    select * from #Defibs


go

exec pad.Defib_List null, null