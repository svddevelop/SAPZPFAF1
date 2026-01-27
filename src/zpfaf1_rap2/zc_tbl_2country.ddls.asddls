@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTBL_2COUNTRY'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TBL_2COUNTRY
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TBL_2COUNTRY
  association [1..1] to ZR_TBL_2COUNTRY as _BaseEntity on $projection.COUNTRYID = _BaseEntity.COUNTRYID
{
  key CountryID,
  Country,
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
