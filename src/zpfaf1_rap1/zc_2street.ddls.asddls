@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'STREET View'
}
define view entity ZC_2STREET
  as select from ZI_2STREET
  association [1..1] to ZI_2STREET as _BaseEntity on $projection.STREETID = _BaseEntity.STREETID
{
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  key StreetId,
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  CityId,
  @Endusertext: {
    Label: 'Street', 
    Quickinfo: 'Street'
  }
  Street,
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
