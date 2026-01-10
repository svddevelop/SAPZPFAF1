@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CiTY View'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_City
  as select from ztbl_city
  association [1..1] to ZI_Country as _Country
    on $projection.CountryId = _Country.CountryId
{
  key country_id as CountryId,
  key city_id    as CityId,
      city       as CityName,
      _Country
}
