# VerificaC19 package for Flutter

[![Flutter](https://github.com/mastro993/verificac19_flutter/actions/workflows/flutter-ci.yml/badge.svg?branch=master)](https://github.com/mastro993/verificac19_flutter/actions/workflows/flutter-ci.yml)
[![pub package](https://img.shields.io/pub/v/verificac19.svg)](https://pub.dev/packages/verificac19)
[![pub points](https://badges.bar/verificac19/pub%20points)](https://pub.dev/packages/verificac19/score)
[![popularity](https://badges.bar/verificac19/popularity)](https://pub.dev/packages/verificac19/score)
[![likes](https://badges.bar/verificac19/likes)](https://pub.dev/packages/verificac19/score)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/4f13e7d9b798479aa8c41d32ed1f6b6d)](https://www.codacy.com/gh/mastro993/verificaC19-flutter/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mastro993/verificaC19-flutter&amp;utm_campaign=Badge_Grade)


## About

This package allows to decode and validate any EU Digital Green Certificate in your Flutter application. It is based on the specifications contained in the [official it-dgc-verificac19-sdk-android repository](https://github.com/ministero-salute/it-dgc-verificac19-sdk-android).

This library requires an internet connection to download and cache rules, CRL and DSCs at least once per day. Once updated the entire process of validation can be done completely offline and in real-time.

Starting from version 1.4.3, this package has been included in the [list of verified SDKs by Italian authorities (Ministero della salute)](https://github.com/ministero-salute/it-dgc-verificac19-sdk-onboarding).  

## Development & testing

- Clone the repository

```sh
git clone https://github.com/mastro993/verificac19_flutter.git
```

- Get packages

```sh
cd verificac19_flutter

flutter pub get
```

- QR codes for testing can be obtained from this link: https://dgc.a-sit.at/ehn/testsuite

## Installation

```sh
flutter pub add verificac19
```

## Example app

An example application can be seen [here](https://github.com/mastro993/greenguard-app).

## Usage

### Setup

First thing to do is to initialize the package. This allows to all internal initializations to be done.

```dart
await VerificaC19.initialize();
```

### Download and cache rules, CRL data and DSCs

You can download and cache rules, CRL data and DSCs using the `update` function. This will update data only if the 24 hours update window is expired.

```dart
await VerificaC19.update();
```

You can also check if the data is expired (older than the 24 hours update window) without requiring an update with the `needsUpdate` function.

```dart
bool requiresUpdate = await VerificaC19.needsUpdate();
```

### Verify and validate a DGC

You can verify and validate a DGC from a String containing a base45 encoded data.

```dart
// Validate frombase45 encoded data
ValidationResult result = await VerificaC19.validateFromRaw('HC1:NCFOXN%TSM...');
```

The result is a `ValidationResult` object containing the decoded `Certificate` object and its `CertificateStatus` which can have the following values:

|     | Code        | Description                                    |
| --- | ----------- | ---------------------------------------------- |
| ✅  | valid       | Certificate is valid                           |
| ⚠   | testNeeded  | Test needed if verification mode is boosterDGP |
| ❌  | notValid    | Certificate is not valid                       |
| ❌  | notValidYet | Certificate is not valid yet                   |
| ❌  | revoked     | Certificate has been revoked                   |
| ❌  | notEuDCC    | Certificate is not an EU DCC                   |

You can also provide a `ValidationMode` parameter.

| Code           | Description                         |
| -------------- | ----------------------------------- |
| normalDGP      | Normal verification (default value) |
| superDGP       | Super Green Pass verification       |
| boosterDGP     | Booster verification mode           |
| workDGP        | Over 50Y verification mode          |
| entryITDGP     | Italy travel validation mode        |
| visitorsRSADGP | RSA visitors validation mode        |

Example:

```dart
ValidationResult result = await VerificaC19.validateFromRaw('HC1:NCFOXN%TSM...', mode: ValidationMode.normalDGP);
// or
ValidationResult result = await VerificaC19.validateFromRaw('HC1:NCFOXN%TSM...', mode: ValidationMode.superDGP);
```
