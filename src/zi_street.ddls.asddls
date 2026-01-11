@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Street View'
define view entity ZI_Street
  as select from ztbl_street
  association [1..*] to ZI_City as _City
    on  $projection.CityId = _City.CityId

{
  key city_id    as CityId,
  key street_id  as StreetId,
      street     as StreetName,
      _City
}
