// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoked_cert.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetRevokedCertCollection on Isar {
  IsarCollection<RevokedCert> get revokedCerts {
    return getCollection('RevokedCert');
  }
}

final RevokedCertSchema = CollectionSchema(
  name: 'RevokedCert',
  schema:
      '{"name":"RevokedCert","idName":"id","properties":[{"name":"cert","type":"String"}],"indexes":[{"name":"cert","unique":false,"properties":[{"name":"cert","type":"Hash","caseSensitive":true}]}],"links":[]}',
  nativeAdapter: const _RevokedCertNativeAdapter(),
  webAdapter: const _RevokedCertWebAdapter(),
  idName: 'id',
  propertyIds: {'cert': 0},
  listProperties: {},
  indexIds: {'cert': 0},
  indexTypes: {
    'cert': [
      NativeIndexType.stringHash,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _RevokedCertWebAdapter extends IsarWebTypeAdapter<RevokedCert> {
  const _RevokedCertWebAdapter();

  @override
  Object serialize(IsarCollection<RevokedCert> collection, RevokedCert object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'cert', object.cert);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    return jsObj;
  }

  @override
  RevokedCert deserialize(
      IsarCollection<RevokedCert> collection, dynamic jsObj) {
    final object = RevokedCert();
    object.cert = IsarNative.jsObjectGet(jsObj, 'cert') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'cert':
        return (IsarNative.jsObjectGet(jsObj, 'cert') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, RevokedCert object) {}
}

class _RevokedCertNativeAdapter extends IsarNativeTypeAdapter<RevokedCert> {
  const _RevokedCertNativeAdapter();

  @override
  void serialize(
      IsarCollection<RevokedCert> collection,
      IsarRawObject rawObj,
      RevokedCert object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.cert;
    final _cert = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_cert.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _cert);
  }

  @override
  RevokedCert deserialize(IsarCollection<RevokedCert> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = RevokedCert();
    object.cert = reader.readString(offsets[0]);
    object.id = id;
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, RevokedCert object) {}
}

extension RevokedCertQueryWhereSort
    on QueryBuilder<RevokedCert, RevokedCert, QWhere> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhere> anyCert() {
    return addWhereClauseInternal(const WhereClause(indexName: 'cert'));
  }
}

extension RevokedCertQueryWhere
    on QueryBuilder<RevokedCert, RevokedCert, QWhereClause> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> certEqualTo(
      String cert) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'cert',
      lower: [cert],
      includeLower: true,
      upper: [cert],
      includeUpper: true,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> certNotEqualTo(
      String cert) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'cert',
        upper: [cert],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'cert',
        lower: [cert],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'cert',
        lower: [cert],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'cert',
        upper: [cert],
        includeUpper: false,
      ));
    }
  }
}

extension RevokedCertQueryFilter
    on QueryBuilder<RevokedCert, RevokedCert, QFilterCondition> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'cert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'cert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'cert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cert',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'cert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'cert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cert',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cert',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension RevokedCertQueryLinks
    on QueryBuilder<RevokedCert, RevokedCert, QFilterCondition> {}

extension RevokedCertQueryWhereSortBy
    on QueryBuilder<RevokedCert, RevokedCert, QSortBy> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> sortByCert() {
    return addSortByInternal('cert', Sort.asc);
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> sortByCertDesc() {
    return addSortByInternal('cert', Sort.desc);
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension RevokedCertQueryWhereSortThenBy
    on QueryBuilder<RevokedCert, RevokedCert, QSortThenBy> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenByCert() {
    return addSortByInternal('cert', Sort.asc);
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenByCertDesc() {
    return addSortByInternal('cert', Sort.desc);
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension RevokedCertQueryWhereDistinct
    on QueryBuilder<RevokedCert, RevokedCert, QDistinct> {
  QueryBuilder<RevokedCert, RevokedCert, QDistinct> distinctByCert(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('cert', caseSensitive: caseSensitive);
  }

  QueryBuilder<RevokedCert, RevokedCert, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }
}

extension RevokedCertQueryProperty
    on QueryBuilder<RevokedCert, RevokedCert, QQueryProperty> {
  QueryBuilder<RevokedCert, String, QQueryOperations> certProperty() {
    return addPropertyNameInternal('cert');
  }

  QueryBuilder<RevokedCert, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }
}
