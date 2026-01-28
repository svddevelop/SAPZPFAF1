@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTBL_2STREET'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TBL_2STREET
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TBL_2STREET
  association [1..1] to ZR_TBL_2STREET as _BaseEntity on $projection.STREETID = _BaseEntity.STREETID
{
  key StreetID,
  CityID,
  Street,
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
