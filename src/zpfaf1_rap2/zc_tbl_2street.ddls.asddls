@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZTBL_2STREET'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TBL_2STREET
  provider contract transactional_query
  as projection on ZR_TBL_2STREET
  association [1..1] to ZR_TBL_2STREET as _BaseEntity on $projection.StreetID = _BaseEntity.StreetID
{
  key StreetID,
  
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'ZPFAF1_RAP2_CITYHELPER', 
    entity.element: 'CityId', 
    useForValidation: true
  } ]
   CityID,
  Street,
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
  _BaseEntity
}
