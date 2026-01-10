@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country'
define view entity ZI_Country
  as select from ztbl_country
{
  key country_id as CountryId,
      country    as CountryName,
      localcreatedby,
      localcreatedat,
      locallastchangedby,
      locallastchangedat
}
