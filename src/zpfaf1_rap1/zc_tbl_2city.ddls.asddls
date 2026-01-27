@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTBL_2CITY'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TBL_2CITY
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TBL_2CITY
  association [1..1] to ZR_TBL_2CITY as _BaseEntity on $projection.CITYID = _BaseEntity.CITYID
{
  key CityID,
  CountryID,
  City,
  @Semantics: {
    User.Createdby: true
  }
  Localcreatedby,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  Localcreatedat,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  Locallastchangedby,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  Locallastchangedat,
  _BaseEntity
}
