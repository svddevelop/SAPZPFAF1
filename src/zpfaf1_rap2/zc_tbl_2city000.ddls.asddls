@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZTBL_2CITY000'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TBL_2CITY000
  provider contract transactional_query
  as projection on ZR_TBL_2CITY000
  association [1..1] to ZR_TBL_2CITY000 as _BaseEntity on $projection.CityID = _BaseEntity.CityID
  association [1..1] to ZPFAF1_RAP2_COUNTRYHELP as _Country on $projection.CountryID = _Country.CountryId
{
  key CityID,
  
  
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'ZPFAF1_RAP2_COUNTRYHELP', 
    entity.element: 'CountryId', 
    useForValidation: true
  } ]
    CountryID,


  City,
  @Semantics: {
    user.createdBy: true
  }
  Localcreatedby,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  Localcreatedat,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  Locallastchangedby,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  Locallastchangedat,
  _BaseEntity ,
  _Country 
}
