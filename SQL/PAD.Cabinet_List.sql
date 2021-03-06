USE CAGPAD
GO

alter proc PAD.Cabinet_List (
	@CabinetId int = null,
    @Selected bit = null
) as

select * into #selected from PAD.PADSites where Cabinet is not null

select
	c.CabinetId, 
	c.Name, 
	c.Description, 
	c.Supplier, 
	c.HeartSafeNumber, 
	c.WarrantyExpiry,
    p.PadId,
    p.Location
into
    #cabinets
from
	PAD.Cabinets c
    left join PAD.PADSites p on c.CabinetId = p.Cabinet
where
	c.CabinetId = ISNULL(@CabinetId, c.CabinetId)

if @Selected = 1
    select
        c.*
    from 
        #cabinets c
        join #selected s on c.CabinetId = s.Cabinet

if @Selected = 0
    select
        c.*
    from
        #cabinets c
    where
        c.CabinetId not in (select Cabinet from #selected)

if @Selected is null
    select * from #cabinets

go

exec pad.Cabinet_List null, null