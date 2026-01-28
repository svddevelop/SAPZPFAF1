@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPFAF1_RAP2_CITYHELPER'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPFAF1_RAP2_CITYHELPER as select from ztbl_2city
association [1..1] to ZPFAF1_RAP2_COUNTRYHELP as _Country on $projection.CountryId = _Country.CountryId 
{
    key city_id as CityId,
    city as City,
    country_id as CountryId,
    _Country.Country,
    _Country
}
