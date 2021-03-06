use CAGPAD
go


alter proc PAD.Equipment_List (
	@PadID int = null
) as

declare @CabinetId int,
		@DefibId int

create table #equipment (
	PadId int,
	CabinetId int,
	DefibId int,
	Name varchar(50),
	Description varchar(100),
	Supplier varchar(50),
	Expiry datetime,
	MinorIssues int,
	MajorIssues int
)

insert into #equipment (CabinetId, Name, Description, Supplier, Expiry, MinorIssues, MajorIssues)
select c.CabinetId, 'Cabinet', c.Description, c.Supplier, c.WarrantyExpiry,
(select count(*) from PAD.Issues i where i.CabinetId = c.CabinetId and i.Severity > 1),
(select count(*) from PAD.Issues i where i.CabinetId = c.CabinetId and i.Severity = 1)
from PAD.Cabinets c

insert into #equipment (DefibId, Name, Description, Supplier, Expiry, MinorIssues, MajorIssues)
select d.DefibId, 'Defibrillator', d.Description, d.Supplier, d.WarrantyExpires,
(select count(*) from PAD.Issues i where i.DefibId = d.DefibId and i.Severity > 1),
(select count(*) from PAD.Issues i where i.DefibId = d.DefibId and i.Severity = 1)
from PAD.Defibrillators d 

insert into #equipment (PadId, Name, Description, Expiry, MinorIssues, MajorIssues)
select p.PadId, 'Pads', 'Defibrillator Pads', p.PadsExpiry, 0, 0
from PAD.PADSites p 

insert into #equipment (DefibId, Name, Description, Expiry, MinorIssues, MajorIssues)
select d.DefibId, 'Battery', 'Defibrillator Battery', d.BatteryExpiry, 0, 0
from PAD.Defibrillators d

select
	PadId = isnull(e.PadId, isnull(pc.PadId,pd.PadId)),
	e.CabinetId,
	e.DefibId,
	e.Name,
	e.Description,
	e.Supplier,
	e.Expiry,
	e.MinorIssues,
	e.MajorIssues
into
	#eq
from 
	#equipment e
	left join PAD.PADSites pc on e.CabinetId = pc.Cabinet
	left join PAD.PADSites pd on e.DefibId = pd.Defib


select
	*
from 
	#eq
where
	isnull(PadId, 0) = isnull(@PadID, isnull(PadId, 0))
order by
	Expiry


go

exec PAD.Equipment_List 1