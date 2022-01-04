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
