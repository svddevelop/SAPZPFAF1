@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'User'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_USERS
  as select from ztbl_users

  association [0..1] to ZI_Street as _Street
    on  $projection.StreetId = _Street.StreetId
    and $projection.CityId   = _Street.CityId

  association [0..1] to ZI_City as _City
    on  $projection.CityId    = _City.CityId
    and $projection.CountryId = _City.CountryId

  association [0..1] to ZI_Country as _Country
    on $projection.CountryId = _Country.CountryId

{
  key id as UserId,

      email       as Email,
      lang        as LangKi,
      cur_ki      as CurrencyKey,
      countryid   as CountryId,
      country     as CountryName,
      zipcode     as ZipCode,
      city_id     as CityId,
      city        as CityName,
      street_id   as StreetId,
      street      as StreetName,

      _Street,
      _City,
      _Country
}
