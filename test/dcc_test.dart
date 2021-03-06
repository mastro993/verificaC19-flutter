import 'package:flutter_test/flutter_test.dart';
import 'package:verificac19/src/model/certificate_info.dart';
import 'package:verificac19/src/utils/dcc_utils.dart';
import 'package:verificac19/verificac19.dart';

import 'fixtures/fixture_reader.dart';

void main() {
  test('Should read valid certificate from raw', () async {
    DCC dcc = await DccUtils.getDCCFromRawData(
        r"HC1:6BF+70790T9WJWG.FKY*4GO0.O1CV2 O5 N2FBBRW1*70HS8WY04AC*WIFN0AHCD8KD97TK0F90KECTHGWJC0FDC:5AIA%G7X+AQB9746HS80:54IBQF60R6$A80X6S1BTYACG6M+9XG8KIAWNA91AY%67092L4WJCT3EHS8XJC$+DXJCCWENF6OF63W5NW6WF6%JC QE/IAYJC5LEW34U3ET7DXC9 QE-ED8%E.JCBECB1A-:8$96646AL60A60S6Q$D.UDRYA 96NF6L/5QW6307KQEPD09WEQDD+Q6TW6FA7C466KCN9E%961A6DL6FA7D46JPCT3E5JDLA7$Q6E464W5TG6..DX%DZJC6/DTZ9 QE5$CB$DA/D JC1/D3Z8WED1ECW.CCWE.Y92OAGY8MY9L+9MPCG/D5 C5IA5N9$PC5$CUZCY$5Y$527B+A4KZNQG5TKOWWD9FL%I8U$F7O2IBM85CWOC%LEZU4R/BXHDAHN 11$CA5MRI:AONFN7091K9FKIGIY%VWSSSU9%01FO2*FTPQ3C3F");
    assert(dcc.payload['nam']['fn'] == 'Mustermann');
  });

  test('Should throw exception reading bad data', () async {
    String rawData =
        r"HC1:NCFOXN%TSMAHN-H/RCMPQ5GE5I00H9GBH3QNAD6.LQLX85ZS GJTSJ4NKP1HCV4*XUA2PSGH.+H$NI4L6F$S-N1FYBRR1$Q1+GOF+P$HQPHQHTQ.SQ6$PUKRN95404.W7UX4795L*KDYPWGO+9AZDOHCRL35IWMSDOP7OQ+M70AK$8 96XY4SBLU96:/6N9R%EPL8RY9DOA60-K.IA.C8KRDL4O54O4IGUJKJGI0JAXD15IAXMFU*GSHGRKMXGG6DBYCBMQN:HG5PAHGG8KES/F-1JW-K%B3A9ENO4B-S-*O4-G1FD/U47HAE1MI4OE0G1:HHD4AB874MM-6B:HKJSQ.TAG3CR1638W9AV88G64PB4VHRY2EK03NFJL4M10KP3AT2VK LT5GGFV85I0*10W2ZXJSBTMFW*+KM2T8-CXR32BMF7RAEAYKMWHE/NH UP4SNGENEWUY97 -3YM0.HAM:D:00ZY35XRT1100MFKWEWYHKCZIZJ0CAQYIKOZIZJ0DAQCDQGAE62ORR7HL0POYQCGMGBBEQFCBCDCT4VYFQZEPYFXK69ZRV9T8IY6NWAYEJF0VXVKNFCG/X9UIG5HFWRPEDW2EPW00S1K83I3900:919FUCKYOUALLGPSUPPORTERS9IKM24N21AW7ZUR2L013300EUISGOEINGDOWNNAZZYFUCKERS666I3AK96XYR01300STOREMYCODEMUTHERFUCKERANDGOTOHELLI5340XRT09SHUZVB33IR0IPUTAVIRUSHERE83H73KFI280I23KL0YRZT91Y0WITHLOVEFROMHA1*PWEOXCI/QXRLOZKN0LM*03I2RWT0Z";
    expect(
      () async => await DccUtils.getDCCFromRawData(rawData),
      throwsA(isA<DecodeException>()),
    );
  });

  test('Should read kid from raw certificate', () async {
    DCC dcc = await DccUtils.getDCCFromRawData(
        r"HC1:6BF+70790T9WJWG.FKY*4GO0.O1CV2 O5 N2FBBRW1*70HS8WY04AC*WIFN0AHCD8KD97TK0F90KECTHGWJC0FDC:5AIA%G7X+AQB9746HS80:54IBQF60R6$A80X6S1BTYACG6M+9XG8KIAWNA91AY%67092L4WJCT3EHS8XJC$+DXJCCWENF6OF63W5NW6WF6%JC QE/IAYJC5LEW34U3ET7DXC9 QE-ED8%E.JCBECB1A-:8$96646AL60A60S6Q$D.UDRYA 96NF6L/5QW6307KQEPD09WEQDD+Q6TW6FA7C466KCN9E%961A6DL6FA7D46JPCT3E5JDLA7$Q6E464W5TG6..DX%DZJC6/DTZ9 QE5$CB$DA/D JC1/D3Z8WED1ECW.CCWE.Y92OAGY8MY9L+9MPCG/D5 C5IA5N9$PC5$CUZCY$5Y$527B+A4KZNQG5TKOWWD9FL%I8U$F7O2IBM85CWOC%LEZU4R/BXHDAHN 11$CA5MRI:AONFN7091K9FKIGIY%VWSSSU9%01FO2*FTPQ3C3F");

    assert(dcc.kid == 'DEsVUSvpFAE=');
  });

  test('Should verify signature', () async {
    DCC dcc = await DccUtils.getDCCFromRawData(fixture('signed_cert.txt'));
    String pem = fixture('signing_certificate.crt');

    final verified = await DccUtils.checkSignatureWithCertificate(pem, dcc);

    assert(dcc.kid == '2Rk3X8HntrI=');
    assert(verified == true);
  });

  test('Should not verify signature', () async {
    DCC dcc = await DccUtils.getDCCFromRawData(fixture('signed_cert.txt'));
    String pem = fixture('wrong_signing_certificate.crt');

    final verified = await DccUtils.checkSignatureWithCertificate(pem, dcc);

    assert(dcc.kid == '2Rk3X8HntrI=');
    assert(verified == false);
  });

  test('Should get certificate info (extKeyUsage', () async {
    CertificateInfo info = DccUtils.getCertificateInfo(
      fixture('signing_certificate.crt'),
    );
    assert(info.country == 'AT');
    assert(info.extendedKeyUsage == false);
  });

  test('Should get certificate info (extKeyUsage)', () async {
    CertificateInfo info = DccUtils.getCertificateInfo(
      fixture('cert_info.crt'),
    );
    assert(info.country == 'NL');
    assert(info.extendedKeyUsage == true);
  });
}
