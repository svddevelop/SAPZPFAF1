@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Street View'
}
define view entity ZC_STREET
  as select from ZI_STREET
  association [1..1] to ZI_STREET as _BaseEntity on $projection.CITYID = _BaseEntity.CITYID and $projection.STREETID = _BaseEntity.STREETID
{
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  key CityId,
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  key StreetId,
  @Endusertext: {
    Label: 'Street', 
    Quickinfo: 'Street'
  }
  StreetName,
  _City,
  _BaseEntity
}
