@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPFAF1_RAP2_COUNTRYHELP'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPFAF1_RAP2_COUNTRYHELP as select from ztbl_2country
{
    key country_id as CountryId,
    country as Country
    /*localcreatedby as Localcreatedby,
    localcreatedat as Localcreatedat,
    locallastchangedby as Locallastchangedby,
    locallastchangedat as Locallastchangedat*/
} 
