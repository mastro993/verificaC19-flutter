## Initialize

This library needs to be initialized before it is used for the first time.

```dart
await VerificaC19.initialize();
```

## Sync

Once initialized it should be updated at least once a day in order to have all the medical rules and DCSs synced with the DGC provider
This can be done calling the `sync()` method.

```dart
await VerificaC19.update();
```

You can check if data needs to be updated with the `needsUpdate()` method and get the date of the last completed update with `getLastUpdateTime()`.

```dart

bool needsUpdate = VerificaC19.needUpdate();

if (needUpdate) {
    // We should update!
    await VerificaC19.update();
}

// You can also check the update status getting the last update time

DateTime? lastUpdateTime = VerificaC19.getLastUpdateTime();

if (lastUpdateTime != null) {
    print('Last successfull update was on ${lastUpdateTime.toString()}')
} else {
    print('VerificaC19 has never been updated. You should do it now.')
}

```

## DGC validation

You can get the validity of a DGC passing its base45 encoded data (QRCode content) to the `validateFromRaw` method.

```dart

ValidationResult result = await VerificaC19.validateFromRaw(r'HC1:NCFOXN%TSMAHN-H3ZSUZK+.V0ET9%6-AH-R61ROR$SIOO$-I68VBS4+WABJJ6L6SA3/-2E%5VR5VVBJZILDB523G*S2U2V8TQEDK8CD/SYJCZ8D/DC..DYMCR.C%USPSTNJSHKDL8CV.TL*SBVCYUSUJCLAD*+TJZIM-1U96UX4U96L*KDYPWGO+9A*DOXCRFE4IWMEK81:6G16IFNPCL694F$9DK4LC6DQ4939HHM 55ZIJIZI.EJJ14B2MZ8DC8C:R10%C:XIBEIVG395EV3EVCK09D5WCFVA.QO5VA81K0ECM8CXVDC8C90JK.A+ C/8DXEDKG0CGJ5AL5:4A930JB0CGBL6BQ99Q9E$BDZI65BXI1X-7I65M65TWAS4WW4NOXU3$UCPABPINXU: RFTIDG62QE/UIGSUYI93O89N86UG8KGQN88.R: BRQG84W: BCPI2YUFJ6LX3+KG% BTVBUVPQRHIY1* H2O1$S3I1AVTV%71AMBP:FZ4WA%B7L0B5GCXRRMLCSN.PDO7UJWKMMAU$5D$R8Y7MQFBQKY HJ:O-:K:IFG/VIIM8ZQS77YTFE.SH9PZDUA61C00+/DL4');

```

In case of successfull validation you will get a `ValidationResult` containing the `GreenCertificate` associated to the QRCode and its `CertificateStatus`.
