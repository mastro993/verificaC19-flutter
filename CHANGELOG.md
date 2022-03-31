## 1.5.0+1

- Hot-fix

## 1.5.0

- Removed work validation mode ([DECRETO-LEGGE 24 marzo 2022, n. 24](https://www.gazzettaufficiale.it/eli/id/2022/03/24/22G00034/sg))
- Improved local storage

## 1.4.4

- Updated packages
- Updated Cbor package (version 5.x)

## 1.4.3

- Added package name and version in requests headers

## 1.4.2

- RSA Visitors validation mode

## 1.4.1

- WorkDGP validation logic fixes

## 1.4.0

- Removed School mode ([DECRETO-LEGGE 4 febbraio 2022, n. 5](https://www.gazzettaufficiale.it/eli/id/2022/02/04/22G00014/sg))
- Added Italy travel validation mode
- Validation logig bug fixes

## 1.3.3

- Fix: test not valid for over 50Y (mandatory vaccine for over 50Y).
- Fix: changed internal storage db names to (or at least to try to) prevent data corruption.

## 1.3.2

- Hot-fix: added missing CertificateValidator dipendency

## 1.3.1

- Added the ability to force update local data before its expiry (cached data)

## 1.3.0

- Added support for new scan modes: School, Work
- Added support for new verification rules

## 1.2.3

- Added vaccine exemptions support

## 1.2.2

- Bug fix

## 1.2.1

- Bug fix

## 1.2.0

- Added Booster validation mode for recovery statements and vaccinations
- Renamed Certificate to GreenCertificate to better differentiate from Signgin Certificates

## 1.1.1

- Fix: added ValidationMode in exports

## 1.1.0

- UVCI revoked list updates in chunks with version check

## 1.0.11

- Fixed UVCI revocation check

## 1.0.10

- Added booster validation mode
- Improved validation logic
- Covered more test cases
- Removed string message from validation result
- Removed error from validation result
- Removed parse funcion (you can get the certificate only though validation)

## 1.0.9

- Fixes

## 1.0.8

- Fixes

## 1.0.7

- Added method to retrieve the date and time of the last successfull update
- Removed unused methods
- Fixed bugs with Certificate validation
- Resolved Cache initialization error

## 1.0.6

- Validator returns an error if validation rules are expired (older than 24 hours)

## 1.0.5

- Rules, CRL and DSCs can be force updated before the 24 hours expiry window

## 1.0.4

- Added method to check if the data needs to be updated

## 1.0.3

- Added example

## 1.0.2

- Adds Web support

## 1.0.0

- Initial release
