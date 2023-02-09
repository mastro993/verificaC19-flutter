// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoked_cert.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRevokedCertCollection on Isar {
  IsarCollection<RevokedCert> get revokedCerts => this.collection();
}

const RevokedCertSchema = CollectionSchema(
  name: r'RevokedCert',
  id: -6213489462130441013,
  properties: {
    r'cert': PropertySchema(
      id: 0,
      name: r'cert',
      type: IsarType.string,
    )
  },
  estimateSize: _revokedCertEstimateSize,
  serialize: _revokedCertSerialize,
  deserialize: _revokedCertDeserialize,
  deserializeProp: _revokedCertDeserializeProp,
  idName: r'id',
  indexes: {
    r'cert': IndexSchema(
      id: -867733277280422624,
      name: r'cert',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'cert',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _revokedCertGetId,
  getLinks: _revokedCertGetLinks,
  attach: _revokedCertAttach,
  version: '3.0.5',
);

int _revokedCertEstimateSize(
  RevokedCert object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cert.length * 3;
  return bytesCount;
}

void _revokedCertSerialize(
  RevokedCert object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cert);
}

RevokedCert _revokedCertDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RevokedCert();
  object.cert = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _revokedCertDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _revokedCertGetId(RevokedCert object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _revokedCertGetLinks(RevokedCert object) {
  return [];
}

void _revokedCertAttach(
    IsarCollection<dynamic> col, Id id, RevokedCert object) {
  object.id = id;
}

extension RevokedCertQueryWhereSort
    on QueryBuilder<RevokedCert, RevokedCert, QWhere> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RevokedCertQueryWhere
    on QueryBuilder<RevokedCert, RevokedCert, QWhereClause> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> certEqualTo(
      String cert) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cert',
        value: [cert],
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterWhereClause> certNotEqualTo(
      String cert) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cert',
              lower: [],
              upper: [cert],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cert',
              lower: [cert],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cert',
              lower: [cert],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cert',
              lower: [],
              upper: [cert],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RevokedCertQueryFilter
    on QueryBuilder<RevokedCert, RevokedCert, QFilterCondition> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cert',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cert',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cert',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cert',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cert',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cert',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cert',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cert',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> certIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cert',
        value: '',
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition>
      certIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cert',
        value: '',
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RevokedCertQueryObject
    on QueryBuilder<RevokedCert, RevokedCert, QFilterCondition> {}

extension RevokedCertQueryLinks
    on QueryBuilder<RevokedCert, RevokedCert, QFilterCondition> {}

extension RevokedCertQuerySortBy
    on QueryBuilder<RevokedCert, RevokedCert, QSortBy> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> sortByCert() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cert', Sort.asc);
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> sortByCertDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cert', Sort.desc);
    });
  }
}

extension RevokedCertQuerySortThenBy
    on QueryBuilder<RevokedCert, RevokedCert, QSortThenBy> {
  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenByCert() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cert', Sort.asc);
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenByCertDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cert', Sort.desc);
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RevokedCert, RevokedCert, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension RevokedCertQueryWhereDistinct
    on QueryBuilder<RevokedCert, RevokedCert, QDistinct> {
  QueryBuilder<RevokedCert, RevokedCert, QDistinct> distinctByCert(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cert', caseSensitive: caseSensitive);
    });
  }
}

extension RevokedCertQueryProperty
    on QueryBuilder<RevokedCert, RevokedCert, QQueryProperty> {
  QueryBuilder<RevokedCert, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RevokedCert, String, QQueryOperations> certProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cert');
    });
  }
}
