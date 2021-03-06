use CAGPAD
go

alter proc PAD.PadSite_List (
	@PadId int = null
) as

with lastchecks as (
    select
        p.PadId,
        LastCheck = max(p.Completed)
    from
        PAD.GuardianChecks p
    group by
        p.PadId
)

select
	p.PadId,
	p.Location,
	p.Address,
	p.Description,
	c.CabinetId,
	Cabinet = c.Name,
	d.DefibId,
	Defib = d.Name,
	p.Owner,
	p.OwnerTel,
	p.OwnerEmail,
	p.InstallDate,
	p.Funding,
	p.Amount,
	Insurance = isnull(p.Insurance, 'None'),
    l.LastCheck,
    p.Map,
    p.PadsExpiry
from
	PAD.PADSites p
	left join PAD.Cabinets c on p.Cabinet = c.CabinetId
	left join PAD.Defibrillators d on p.Defib = d.DefibId
    left join lastchecks l on p.PadId = l.PadId
where
	p.PadId = ISNULL(@PadId, p.PadId)

go

exec PAD.PadSite_List