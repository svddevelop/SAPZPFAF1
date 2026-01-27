@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_2Country
  as select from ztbl_2country
  association [1..*] to ZI_2CITY as _City on $projection.CountryId = _City.CountryId
{
  key country_id         as CountryId,
      country            as Country,
      localcreatedby     as Localcreatedby,
      localcreatedat     as Localcreatedat,
      locallastchangedby as Locallastchangedby,
      locallastchangedat as Locallastchangedat
}
