@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country'
define  view entity ZI_Country
  as select from ztbl_country
  association [1..*] to ZI_City as _City
  on $projection.CountryId = _City.CountryId
{
  key country_id as CountryId,
      country    as CountryName,
      localcreatedby,
      localcreatedat,
      locallastchangedby,
      locallastchangedat,
      _City
}
