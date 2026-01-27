@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'CiTY View'
}
define view entity ZC_CITY
  as select from ZI_CITY
  association [1..1] to ZI_CITY as _BaseEntity on $projection.COUNTRYID = _BaseEntity.COUNTRYID and $projection.CITYID = _BaseEntity.CITYID
{
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  key CountryId,
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  key CityId,
  @Endusertext: {
    Label: 'City', 
    Quickinfo: 'City'
  }
  CityName,
  _Country,
  _Street,
  _BaseEntity
}
