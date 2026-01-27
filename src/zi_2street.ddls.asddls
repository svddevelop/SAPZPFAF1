@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STREET View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_2Street
  as select from ztbl_2street
  association to parent ZI_2CITY as _City on $projection.CityId = _City.CityId
{
  key street_id          as StreetId,
      city_id            as CityId,
      street             as Street,
      localcreatedby     as Localcreatedby,
      localcreatedat     as Localcreatedat,
      locallastchangedby as Locallastchangedby,
      locallastchangedat as Locallastchangedat,
      _City // Make association public
}
