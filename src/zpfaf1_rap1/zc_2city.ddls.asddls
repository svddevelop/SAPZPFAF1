@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'City'
}
define view entity ZC_2CITY
  as select from ZI_2CITY
  association [1..1] to ZI_2CITY as _BaseEntity on $projection.CITYID = _BaseEntity.CITYID
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
  CountryId,
  @Endusertext: {
    Label: 'City', 
    Quickinfo: 'City'
  }
  City,
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
