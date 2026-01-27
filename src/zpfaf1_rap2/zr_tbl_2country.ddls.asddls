@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTBL_2COUNTRY'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TBL_2COUNTRY
  as select from ZTBL_2COUNTRY
{
  key country_id as CountryID,
  country as Country,
  @Semantics.user.createdBy: true
  localcreatedby as Localcreatedby,
  @Semantics.systemDateTime.createdAt: true
  localcreatedat as Localcreatedat,
  @Semantics.user.localInstanceLastChangedBy: true
  locallastchangedby as Locallastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchangedat as Locallastchangedat
}
