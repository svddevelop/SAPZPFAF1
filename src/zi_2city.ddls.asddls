@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'City'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_2CITY
  as select from ztbl_2city
  association        to parent ZI_2Country as _Country on $projection.CountryId = _Country.CountryId
  association [1..*] to ZI_2Street         as _Street  on $projection.CityId = _Street.CityId
{
  key city_id            as CityId,
      country_id         as CountryId,
      city               as City,
      localcreatedby     as Localcreatedby,
      localcreatedat     as Localcreatedat,
      locallastchangedby as Locallastchangedby,
      locallastchangedat as Locallastchangedat,
      _Country // Make association public
}
