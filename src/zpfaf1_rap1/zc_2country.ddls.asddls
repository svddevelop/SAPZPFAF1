@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Country view'
}
define view entity ZC_2COUNTRY
  as select from ZI_2COUNTRY
  association [1..1] to ZI_2COUNTRY as _BaseEntity on $projection.COUNTRYID = _BaseEntity.COUNTRYID
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
  Country,
  @Endusertext: {
    Label: 'Angelegt von', 
    Quickinfo: 'Angelegt von Benutzer'
  }
  Localcreatedby,
  @Endusertext: {
    Label: 'Angelegt am', 
    Quickinfo: 'Anlegedatum/-uhrzeit'
  }
  Localcreatedat,
  @Endusertext: {
    Label: 'Geändert von', 
    Quickinfo: 'Letzte Änderung der lokalen Instanz durch Benutzer'
  }
  Locallastchangedby,
  @Endusertext: {
    Label: 'Geändert am', 
    Quickinfo: 'Datum und Uhrzeit der letzten Änderung der lokalen Instanz'
  }
  Locallastchangedat,
  _BaseEntity
}
