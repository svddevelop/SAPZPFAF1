@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Country'
}
define view entity ZC_COUNTRY
  as select from ZI_COUNTRY
  association [1..1] to ZI_COUNTRY as _BaseEntity on $projection.COUNTRYID = _BaseEntity.COUNTRYID
{
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  key CountryId,
  @Endusertext: {
    Label: 'Country', 
    Quickinfo: 'Country'
  }
  CountryName,
  @Endusertext: {
    Label: 'Angelegt von', 
    Quickinfo: 'Angelegt von Benutzer'
  }
  localcreatedby,
  @Endusertext: {
    Label: 'Angelegt am', 
    Quickinfo: 'Anlegedatum/-uhrzeit'
  }
  localcreatedat,
  @Endusertext: {
    Label: 'Geändert von', 
    Quickinfo: 'Letzte Änderung der lokalen Instanz durch Benutzer'
  }
  locallastchangedby,
  @Endusertext: {
    Label: 'Geändert am', 
    Quickinfo: 'Datum und Uhrzeit der letzten Änderung der lokalen Instanz'
  }
  locallastchangedat,
  _City,
  _BaseEntity
}
