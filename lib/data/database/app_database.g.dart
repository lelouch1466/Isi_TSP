// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ModulosTable extends Modulos with TableInfo<$ModulosTable, ModuloData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModulosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idModuloMeta = const VerificationMeta(
    'idModulo',
  );
  @override
  late final GeneratedColumn<int> idModulo = GeneratedColumn<int>(
    'id_modulo',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _bloqueadoMeta = const VerificationMeta(
    'bloqueado',
  );
  @override
  late final GeneratedColumn<bool> bloqueado = GeneratedColumn<bool>(
    'bloqueado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("bloqueado" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idModulo,
    nombre,
    descripcion,
    bloqueado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modulos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ModuloData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_modulo')) {
      context.handle(
        _idModuloMeta,
        idModulo.isAcceptableOrUnknown(data['id_modulo']!, _idModuloMeta),
      );
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('bloqueado')) {
      context.handle(
        _bloqueadoMeta,
        bloqueado.isAcceptableOrUnknown(data['bloqueado']!, _bloqueadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idModulo};
  @override
  ModuloData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModuloData(
      idModulo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_modulo'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      bloqueado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}bloqueado'],
      )!,
    );
  }

  @override
  $ModulosTable createAlias(String alias) {
    return $ModulosTable(attachedDatabase, alias);
  }
}

class ModuloData extends DataClass implements Insertable<ModuloData> {
  final int idModulo;
  final String nombre;
  final String descripcion;
  final bool bloqueado;
  const ModuloData({
    required this.idModulo,
    required this.nombre,
    required this.descripcion,
    required this.bloqueado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_modulo'] = Variable<int>(idModulo);
    map['nombre'] = Variable<String>(nombre);
    map['descripcion'] = Variable<String>(descripcion);
    map['bloqueado'] = Variable<bool>(bloqueado);
    return map;
  }

  ModulosCompanion toCompanion(bool nullToAbsent) {
    return ModulosCompanion(
      idModulo: Value(idModulo),
      nombre: Value(nombre),
      descripcion: Value(descripcion),
      bloqueado: Value(bloqueado),
    );
  }

  factory ModuloData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModuloData(
      idModulo: serializer.fromJson<int>(json['idModulo']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      bloqueado: serializer.fromJson<bool>(json['bloqueado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idModulo': serializer.toJson<int>(idModulo),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String>(descripcion),
      'bloqueado': serializer.toJson<bool>(bloqueado),
    };
  }

  ModuloData copyWith({
    int? idModulo,
    String? nombre,
    String? descripcion,
    bool? bloqueado,
  }) => ModuloData(
    idModulo: idModulo ?? this.idModulo,
    nombre: nombre ?? this.nombre,
    descripcion: descripcion ?? this.descripcion,
    bloqueado: bloqueado ?? this.bloqueado,
  );
  ModuloData copyWithCompanion(ModulosCompanion data) {
    return ModuloData(
      idModulo: data.idModulo.present ? data.idModulo.value : this.idModulo,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      bloqueado: data.bloqueado.present ? data.bloqueado.value : this.bloqueado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModuloData(')
          ..write('idModulo: $idModulo, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('bloqueado: $bloqueado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idModulo, nombre, descripcion, bloqueado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModuloData &&
          other.idModulo == this.idModulo &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.bloqueado == this.bloqueado);
}

class ModulosCompanion extends UpdateCompanion<ModuloData> {
  final Value<int> idModulo;
  final Value<String> nombre;
  final Value<String> descripcion;
  final Value<bool> bloqueado;
  const ModulosCompanion({
    this.idModulo = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.bloqueado = const Value.absent(),
  });
  ModulosCompanion.insert({
    this.idModulo = const Value.absent(),
    required String nombre,
    this.descripcion = const Value.absent(),
    this.bloqueado = const Value.absent(),
  }) : nombre = Value(nombre);
  static Insertable<ModuloData> custom({
    Expression<int>? idModulo,
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<bool>? bloqueado,
  }) {
    return RawValuesInsertable({
      if (idModulo != null) 'id_modulo': idModulo,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (bloqueado != null) 'bloqueado': bloqueado,
    });
  }

  ModulosCompanion copyWith({
    Value<int>? idModulo,
    Value<String>? nombre,
    Value<String>? descripcion,
    Value<bool>? bloqueado,
  }) {
    return ModulosCompanion(
      idModulo: idModulo ?? this.idModulo,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      bloqueado: bloqueado ?? this.bloqueado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idModulo.present) {
      map['id_modulo'] = Variable<int>(idModulo.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (bloqueado.present) {
      map['bloqueado'] = Variable<bool>(bloqueado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModulosCompanion(')
          ..write('idModulo: $idModulo, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('bloqueado: $bloqueado')
          ..write(')'))
        .toString();
  }
}

class $PasosTable extends Pasos with TableInfo<$PasosTable, PasoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PasosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPasoMeta = const VerificationMeta('idPaso');
  @override
  late final GeneratedColumn<int> idPaso = GeneratedColumn<int>(
    'id_paso',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idModuloMeta = const VerificationMeta(
    'idModulo',
  );
  @override
  late final GeneratedColumn<int> idModulo = GeneratedColumn<int>(
    'id_modulo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES modulos (id_modulo)',
    ),
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<int> numero = GeneratedColumn<int>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreLeccionMeta = const VerificationMeta(
    'nombreLeccion',
  );
  @override
  late final GeneratedColumn<String> nombreLeccion = GeneratedColumn<String>(
    'nombre_leccion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bloqueadoMeta = const VerificationMeta(
    'bloqueado',
  );
  @override
  late final GeneratedColumn<bool> bloqueado = GeneratedColumn<bool>(
    'bloqueado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("bloqueado" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _tipoContenidoMeta = const VerificationMeta(
    'tipoContenido',
  );
  @override
  late final GeneratedColumn<String> tipoContenido = GeneratedColumn<String>(
    'tipo_contenido',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idPaso,
    idModulo,
    numero,
    nombreLeccion,
    bloqueado,
    tipoContenido,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pasos';
  @override
  VerificationContext validateIntegrity(
    Insertable<PasoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_paso')) {
      context.handle(
        _idPasoMeta,
        idPaso.isAcceptableOrUnknown(data['id_paso']!, _idPasoMeta),
      );
    }
    if (data.containsKey('id_modulo')) {
      context.handle(
        _idModuloMeta,
        idModulo.isAcceptableOrUnknown(data['id_modulo']!, _idModuloMeta),
      );
    } else if (isInserting) {
      context.missing(_idModuloMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('nombre_leccion')) {
      context.handle(
        _nombreLeccionMeta,
        nombreLeccion.isAcceptableOrUnknown(
          data['nombre_leccion']!,
          _nombreLeccionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nombreLeccionMeta);
    }
    if (data.containsKey('bloqueado')) {
      context.handle(
        _bloqueadoMeta,
        bloqueado.isAcceptableOrUnknown(data['bloqueado']!, _bloqueadoMeta),
      );
    }
    if (data.containsKey('tipo_contenido')) {
      context.handle(
        _tipoContenidoMeta,
        tipoContenido.isAcceptableOrUnknown(
          data['tipo_contenido']!,
          _tipoContenidoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoContenidoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPaso};
  @override
  PasoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PasoData(
      idPaso: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_paso'],
      )!,
      idModulo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_modulo'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}numero'],
      )!,
      nombreLeccion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_leccion'],
      )!,
      bloqueado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}bloqueado'],
      )!,
      tipoContenido: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_contenido'],
      )!,
    );
  }

  @override
  $PasosTable createAlias(String alias) {
    return $PasosTable(attachedDatabase, alias);
  }
}

class PasoData extends DataClass implements Insertable<PasoData> {
  final int idPaso;
  final int idModulo;
  final int numero;
  final String nombreLeccion;
  final bool bloqueado;
  final String tipoContenido;
  const PasoData({
    required this.idPaso,
    required this.idModulo,
    required this.numero,
    required this.nombreLeccion,
    required this.bloqueado,
    required this.tipoContenido,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_paso'] = Variable<int>(idPaso);
    map['id_modulo'] = Variable<int>(idModulo);
    map['numero'] = Variable<int>(numero);
    map['nombre_leccion'] = Variable<String>(nombreLeccion);
    map['bloqueado'] = Variable<bool>(bloqueado);
    map['tipo_contenido'] = Variable<String>(tipoContenido);
    return map;
  }

  PasosCompanion toCompanion(bool nullToAbsent) {
    return PasosCompanion(
      idPaso: Value(idPaso),
      idModulo: Value(idModulo),
      numero: Value(numero),
      nombreLeccion: Value(nombreLeccion),
      bloqueado: Value(bloqueado),
      tipoContenido: Value(tipoContenido),
    );
  }

  factory PasoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PasoData(
      idPaso: serializer.fromJson<int>(json['idPaso']),
      idModulo: serializer.fromJson<int>(json['idModulo']),
      numero: serializer.fromJson<int>(json['numero']),
      nombreLeccion: serializer.fromJson<String>(json['nombreLeccion']),
      bloqueado: serializer.fromJson<bool>(json['bloqueado']),
      tipoContenido: serializer.fromJson<String>(json['tipoContenido']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPaso': serializer.toJson<int>(idPaso),
      'idModulo': serializer.toJson<int>(idModulo),
      'numero': serializer.toJson<int>(numero),
      'nombreLeccion': serializer.toJson<String>(nombreLeccion),
      'bloqueado': serializer.toJson<bool>(bloqueado),
      'tipoContenido': serializer.toJson<String>(tipoContenido),
    };
  }

  PasoData copyWith({
    int? idPaso,
    int? idModulo,
    int? numero,
    String? nombreLeccion,
    bool? bloqueado,
    String? tipoContenido,
  }) => PasoData(
    idPaso: idPaso ?? this.idPaso,
    idModulo: idModulo ?? this.idModulo,
    numero: numero ?? this.numero,
    nombreLeccion: nombreLeccion ?? this.nombreLeccion,
    bloqueado: bloqueado ?? this.bloqueado,
    tipoContenido: tipoContenido ?? this.tipoContenido,
  );
  PasoData copyWithCompanion(PasosCompanion data) {
    return PasoData(
      idPaso: data.idPaso.present ? data.idPaso.value : this.idPaso,
      idModulo: data.idModulo.present ? data.idModulo.value : this.idModulo,
      numero: data.numero.present ? data.numero.value : this.numero,
      nombreLeccion: data.nombreLeccion.present
          ? data.nombreLeccion.value
          : this.nombreLeccion,
      bloqueado: data.bloqueado.present ? data.bloqueado.value : this.bloqueado,
      tipoContenido: data.tipoContenido.present
          ? data.tipoContenido.value
          : this.tipoContenido,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PasoData(')
          ..write('idPaso: $idPaso, ')
          ..write('idModulo: $idModulo, ')
          ..write('numero: $numero, ')
          ..write('nombreLeccion: $nombreLeccion, ')
          ..write('bloqueado: $bloqueado, ')
          ..write('tipoContenido: $tipoContenido')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idPaso,
    idModulo,
    numero,
    nombreLeccion,
    bloqueado,
    tipoContenido,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PasoData &&
          other.idPaso == this.idPaso &&
          other.idModulo == this.idModulo &&
          other.numero == this.numero &&
          other.nombreLeccion == this.nombreLeccion &&
          other.bloqueado == this.bloqueado &&
          other.tipoContenido == this.tipoContenido);
}

class PasosCompanion extends UpdateCompanion<PasoData> {
  final Value<int> idPaso;
  final Value<int> idModulo;
  final Value<int> numero;
  final Value<String> nombreLeccion;
  final Value<bool> bloqueado;
  final Value<String> tipoContenido;
  const PasosCompanion({
    this.idPaso = const Value.absent(),
    this.idModulo = const Value.absent(),
    this.numero = const Value.absent(),
    this.nombreLeccion = const Value.absent(),
    this.bloqueado = const Value.absent(),
    this.tipoContenido = const Value.absent(),
  });
  PasosCompanion.insert({
    this.idPaso = const Value.absent(),
    required int idModulo,
    required int numero,
    required String nombreLeccion,
    this.bloqueado = const Value.absent(),
    required String tipoContenido,
  }) : idModulo = Value(idModulo),
       numero = Value(numero),
       nombreLeccion = Value(nombreLeccion),
       tipoContenido = Value(tipoContenido);
  static Insertable<PasoData> custom({
    Expression<int>? idPaso,
    Expression<int>? idModulo,
    Expression<int>? numero,
    Expression<String>? nombreLeccion,
    Expression<bool>? bloqueado,
    Expression<String>? tipoContenido,
  }) {
    return RawValuesInsertable({
      if (idPaso != null) 'id_paso': idPaso,
      if (idModulo != null) 'id_modulo': idModulo,
      if (numero != null) 'numero': numero,
      if (nombreLeccion != null) 'nombre_leccion': nombreLeccion,
      if (bloqueado != null) 'bloqueado': bloqueado,
      if (tipoContenido != null) 'tipo_contenido': tipoContenido,
    });
  }

  PasosCompanion copyWith({
    Value<int>? idPaso,
    Value<int>? idModulo,
    Value<int>? numero,
    Value<String>? nombreLeccion,
    Value<bool>? bloqueado,
    Value<String>? tipoContenido,
  }) {
    return PasosCompanion(
      idPaso: idPaso ?? this.idPaso,
      idModulo: idModulo ?? this.idModulo,
      numero: numero ?? this.numero,
      nombreLeccion: nombreLeccion ?? this.nombreLeccion,
      bloqueado: bloqueado ?? this.bloqueado,
      tipoContenido: tipoContenido ?? this.tipoContenido,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPaso.present) {
      map['id_paso'] = Variable<int>(idPaso.value);
    }
    if (idModulo.present) {
      map['id_modulo'] = Variable<int>(idModulo.value);
    }
    if (numero.present) {
      map['numero'] = Variable<int>(numero.value);
    }
    if (nombreLeccion.present) {
      map['nombre_leccion'] = Variable<String>(nombreLeccion.value);
    }
    if (bloqueado.present) {
      map['bloqueado'] = Variable<bool>(bloqueado.value);
    }
    if (tipoContenido.present) {
      map['tipo_contenido'] = Variable<String>(tipoContenido.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PasosCompanion(')
          ..write('idPaso: $idPaso, ')
          ..write('idModulo: $idModulo, ')
          ..write('numero: $numero, ')
          ..write('nombreLeccion: $nombreLeccion, ')
          ..write('bloqueado: $bloqueado, ')
          ..write('tipoContenido: $tipoContenido')
          ..write(')'))
        .toString();
  }
}

class $PreguntasTable extends Preguntas
    with TableInfo<$PreguntasTable, PreguntaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreguntasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPreguntaMeta = const VerificationMeta(
    'idPregunta',
  );
  @override
  late final GeneratedColumn<int> idPregunta = GeneratedColumn<int>(
    'id_pregunta',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idModuloMeta = const VerificationMeta(
    'idModulo',
  );
  @override
  late final GeneratedColumn<int> idModulo = GeneratedColumn<int>(
    'id_modulo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES modulos (id_modulo)',
    ),
  );
  static const VerificationMeta _idPasoMeta = const VerificationMeta('idPaso');
  @override
  late final GeneratedColumn<int> idPaso = GeneratedColumn<int>(
    'id_paso',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pasos (id_paso)',
    ),
  );
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idPregunta, idModulo, idPaso, titulo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preguntas';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreguntaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_pregunta')) {
      context.handle(
        _idPreguntaMeta,
        idPregunta.isAcceptableOrUnknown(data['id_pregunta']!, _idPreguntaMeta),
      );
    }
    if (data.containsKey('id_modulo')) {
      context.handle(
        _idModuloMeta,
        idModulo.isAcceptableOrUnknown(data['id_modulo']!, _idModuloMeta),
      );
    } else if (isInserting) {
      context.missing(_idModuloMeta);
    }
    if (data.containsKey('id_paso')) {
      context.handle(
        _idPasoMeta,
        idPaso.isAcceptableOrUnknown(data['id_paso']!, _idPasoMeta),
      );
    } else if (isInserting) {
      context.missing(_idPasoMeta);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _tituloMeta,
        titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta),
      );
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPregunta};
  @override
  PreguntaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreguntaData(
      idPregunta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_pregunta'],
      )!,
      idModulo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_modulo'],
      )!,
      idPaso: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_paso'],
      )!,
      titulo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
    );
  }

  @override
  $PreguntasTable createAlias(String alias) {
    return $PreguntasTable(attachedDatabase, alias);
  }
}

class PreguntaData extends DataClass implements Insertable<PreguntaData> {
  final int idPregunta;
  final int idModulo;
  final int idPaso;
  final String titulo;
  const PreguntaData({
    required this.idPregunta,
    required this.idModulo,
    required this.idPaso,
    required this.titulo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_pregunta'] = Variable<int>(idPregunta);
    map['id_modulo'] = Variable<int>(idModulo);
    map['id_paso'] = Variable<int>(idPaso);
    map['titulo'] = Variable<String>(titulo);
    return map;
  }

  PreguntasCompanion toCompanion(bool nullToAbsent) {
    return PreguntasCompanion(
      idPregunta: Value(idPregunta),
      idModulo: Value(idModulo),
      idPaso: Value(idPaso),
      titulo: Value(titulo),
    );
  }

  factory PreguntaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreguntaData(
      idPregunta: serializer.fromJson<int>(json['idPregunta']),
      idModulo: serializer.fromJson<int>(json['idModulo']),
      idPaso: serializer.fromJson<int>(json['idPaso']),
      titulo: serializer.fromJson<String>(json['titulo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPregunta': serializer.toJson<int>(idPregunta),
      'idModulo': serializer.toJson<int>(idModulo),
      'idPaso': serializer.toJson<int>(idPaso),
      'titulo': serializer.toJson<String>(titulo),
    };
  }

  PreguntaData copyWith({
    int? idPregunta,
    int? idModulo,
    int? idPaso,
    String? titulo,
  }) => PreguntaData(
    idPregunta: idPregunta ?? this.idPregunta,
    idModulo: idModulo ?? this.idModulo,
    idPaso: idPaso ?? this.idPaso,
    titulo: titulo ?? this.titulo,
  );
  PreguntaData copyWithCompanion(PreguntasCompanion data) {
    return PreguntaData(
      idPregunta: data.idPregunta.present
          ? data.idPregunta.value
          : this.idPregunta,
      idModulo: data.idModulo.present ? data.idModulo.value : this.idModulo,
      idPaso: data.idPaso.present ? data.idPaso.value : this.idPaso,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreguntaData(')
          ..write('idPregunta: $idPregunta, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('titulo: $titulo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPregunta, idModulo, idPaso, titulo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreguntaData &&
          other.idPregunta == this.idPregunta &&
          other.idModulo == this.idModulo &&
          other.idPaso == this.idPaso &&
          other.titulo == this.titulo);
}

class PreguntasCompanion extends UpdateCompanion<PreguntaData> {
  final Value<int> idPregunta;
  final Value<int> idModulo;
  final Value<int> idPaso;
  final Value<String> titulo;
  const PreguntasCompanion({
    this.idPregunta = const Value.absent(),
    this.idModulo = const Value.absent(),
    this.idPaso = const Value.absent(),
    this.titulo = const Value.absent(),
  });
  PreguntasCompanion.insert({
    this.idPregunta = const Value.absent(),
    required int idModulo,
    required int idPaso,
    required String titulo,
  }) : idModulo = Value(idModulo),
       idPaso = Value(idPaso),
       titulo = Value(titulo);
  static Insertable<PreguntaData> custom({
    Expression<int>? idPregunta,
    Expression<int>? idModulo,
    Expression<int>? idPaso,
    Expression<String>? titulo,
  }) {
    return RawValuesInsertable({
      if (idPregunta != null) 'id_pregunta': idPregunta,
      if (idModulo != null) 'id_modulo': idModulo,
      if (idPaso != null) 'id_paso': idPaso,
      if (titulo != null) 'titulo': titulo,
    });
  }

  PreguntasCompanion copyWith({
    Value<int>? idPregunta,
    Value<int>? idModulo,
    Value<int>? idPaso,
    Value<String>? titulo,
  }) {
    return PreguntasCompanion(
      idPregunta: idPregunta ?? this.idPregunta,
      idModulo: idModulo ?? this.idModulo,
      idPaso: idPaso ?? this.idPaso,
      titulo: titulo ?? this.titulo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPregunta.present) {
      map['id_pregunta'] = Variable<int>(idPregunta.value);
    }
    if (idModulo.present) {
      map['id_modulo'] = Variable<int>(idModulo.value);
    }
    if (idPaso.present) {
      map['id_paso'] = Variable<int>(idPaso.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreguntasCompanion(')
          ..write('idPregunta: $idPregunta, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('titulo: $titulo')
          ..write(')'))
        .toString();
  }
}

class $PreguntaOpcionesTable extends PreguntaOpciones
    with TableInfo<$PreguntaOpcionesTable, PreguntaOpcionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreguntaOpcionesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOpcionMeta = const VerificationMeta(
    'idOpcion',
  );
  @override
  late final GeneratedColumn<int> idOpcion = GeneratedColumn<int>(
    'id_opcion',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idPreguntaMeta = const VerificationMeta(
    'idPregunta',
  );
  @override
  late final GeneratedColumn<int> idPregunta = GeneratedColumn<int>(
    'id_pregunta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES preguntas (id_pregunta)',
    ),
  );
  static const VerificationMeta _idModuloMeta = const VerificationMeta(
    'idModulo',
  );
  @override
  late final GeneratedColumn<int> idModulo = GeneratedColumn<int>(
    'id_modulo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES modulos (id_modulo)',
    ),
  );
  static const VerificationMeta _idPasoMeta = const VerificationMeta('idPaso');
  @override
  late final GeneratedColumn<int> idPaso = GeneratedColumn<int>(
    'id_paso',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pasos (id_paso)',
    ),
  );
  static const VerificationMeta _respuestaMeta = const VerificationMeta(
    'respuesta',
  );
  @override
  late final GeneratedColumn<String> respuesta = GeneratedColumn<String>(
    'respuesta',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorMeta = const VerificationMeta('valor');
  @override
  late final GeneratedColumn<bool> valor = GeneratedColumn<bool>(
    'valor',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("valor" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idOpcion,
    idPregunta,
    idModulo,
    idPaso,
    respuesta,
    valor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pregunta_opciones';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreguntaOpcionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_opcion')) {
      context.handle(
        _idOpcionMeta,
        idOpcion.isAcceptableOrUnknown(data['id_opcion']!, _idOpcionMeta),
      );
    }
    if (data.containsKey('id_pregunta')) {
      context.handle(
        _idPreguntaMeta,
        idPregunta.isAcceptableOrUnknown(data['id_pregunta']!, _idPreguntaMeta),
      );
    } else if (isInserting) {
      context.missing(_idPreguntaMeta);
    }
    if (data.containsKey('id_modulo')) {
      context.handle(
        _idModuloMeta,
        idModulo.isAcceptableOrUnknown(data['id_modulo']!, _idModuloMeta),
      );
    } else if (isInserting) {
      context.missing(_idModuloMeta);
    }
    if (data.containsKey('id_paso')) {
      context.handle(
        _idPasoMeta,
        idPaso.isAcceptableOrUnknown(data['id_paso']!, _idPasoMeta),
      );
    } else if (isInserting) {
      context.missing(_idPasoMeta);
    }
    if (data.containsKey('respuesta')) {
      context.handle(
        _respuestaMeta,
        respuesta.isAcceptableOrUnknown(data['respuesta']!, _respuestaMeta),
      );
    } else if (isInserting) {
      context.missing(_respuestaMeta);
    }
    if (data.containsKey('valor')) {
      context.handle(
        _valorMeta,
        valor.isAcceptableOrUnknown(data['valor']!, _valorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOpcion};
  @override
  PreguntaOpcionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreguntaOpcionData(
      idOpcion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_opcion'],
      )!,
      idPregunta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_pregunta'],
      )!,
      idModulo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_modulo'],
      )!,
      idPaso: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_paso'],
      )!,
      respuesta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}respuesta'],
      )!,
      valor: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}valor'],
      )!,
    );
  }

  @override
  $PreguntaOpcionesTable createAlias(String alias) {
    return $PreguntaOpcionesTable(attachedDatabase, alias);
  }
}

class PreguntaOpcionData extends DataClass
    implements Insertable<PreguntaOpcionData> {
  final int idOpcion;
  final int idPregunta;
  final int idModulo;
  final int idPaso;
  final String respuesta;
  final bool valor;
  const PreguntaOpcionData({
    required this.idOpcion,
    required this.idPregunta,
    required this.idModulo,
    required this.idPaso,
    required this.respuesta,
    required this.valor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_opcion'] = Variable<int>(idOpcion);
    map['id_pregunta'] = Variable<int>(idPregunta);
    map['id_modulo'] = Variable<int>(idModulo);
    map['id_paso'] = Variable<int>(idPaso);
    map['respuesta'] = Variable<String>(respuesta);
    map['valor'] = Variable<bool>(valor);
    return map;
  }

  PreguntaOpcionesCompanion toCompanion(bool nullToAbsent) {
    return PreguntaOpcionesCompanion(
      idOpcion: Value(idOpcion),
      idPregunta: Value(idPregunta),
      idModulo: Value(idModulo),
      idPaso: Value(idPaso),
      respuesta: Value(respuesta),
      valor: Value(valor),
    );
  }

  factory PreguntaOpcionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreguntaOpcionData(
      idOpcion: serializer.fromJson<int>(json['idOpcion']),
      idPregunta: serializer.fromJson<int>(json['idPregunta']),
      idModulo: serializer.fromJson<int>(json['idModulo']),
      idPaso: serializer.fromJson<int>(json['idPaso']),
      respuesta: serializer.fromJson<String>(json['respuesta']),
      valor: serializer.fromJson<bool>(json['valor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOpcion': serializer.toJson<int>(idOpcion),
      'idPregunta': serializer.toJson<int>(idPregunta),
      'idModulo': serializer.toJson<int>(idModulo),
      'idPaso': serializer.toJson<int>(idPaso),
      'respuesta': serializer.toJson<String>(respuesta),
      'valor': serializer.toJson<bool>(valor),
    };
  }

  PreguntaOpcionData copyWith({
    int? idOpcion,
    int? idPregunta,
    int? idModulo,
    int? idPaso,
    String? respuesta,
    bool? valor,
  }) => PreguntaOpcionData(
    idOpcion: idOpcion ?? this.idOpcion,
    idPregunta: idPregunta ?? this.idPregunta,
    idModulo: idModulo ?? this.idModulo,
    idPaso: idPaso ?? this.idPaso,
    respuesta: respuesta ?? this.respuesta,
    valor: valor ?? this.valor,
  );
  PreguntaOpcionData copyWithCompanion(PreguntaOpcionesCompanion data) {
    return PreguntaOpcionData(
      idOpcion: data.idOpcion.present ? data.idOpcion.value : this.idOpcion,
      idPregunta: data.idPregunta.present
          ? data.idPregunta.value
          : this.idPregunta,
      idModulo: data.idModulo.present ? data.idModulo.value : this.idModulo,
      idPaso: data.idPaso.present ? data.idPaso.value : this.idPaso,
      respuesta: data.respuesta.present ? data.respuesta.value : this.respuesta,
      valor: data.valor.present ? data.valor.value : this.valor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreguntaOpcionData(')
          ..write('idOpcion: $idOpcion, ')
          ..write('idPregunta: $idPregunta, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('respuesta: $respuesta, ')
          ..write('valor: $valor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idOpcion, idPregunta, idModulo, idPaso, respuesta, valor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreguntaOpcionData &&
          other.idOpcion == this.idOpcion &&
          other.idPregunta == this.idPregunta &&
          other.idModulo == this.idModulo &&
          other.idPaso == this.idPaso &&
          other.respuesta == this.respuesta &&
          other.valor == this.valor);
}

class PreguntaOpcionesCompanion extends UpdateCompanion<PreguntaOpcionData> {
  final Value<int> idOpcion;
  final Value<int> idPregunta;
  final Value<int> idModulo;
  final Value<int> idPaso;
  final Value<String> respuesta;
  final Value<bool> valor;
  const PreguntaOpcionesCompanion({
    this.idOpcion = const Value.absent(),
    this.idPregunta = const Value.absent(),
    this.idModulo = const Value.absent(),
    this.idPaso = const Value.absent(),
    this.respuesta = const Value.absent(),
    this.valor = const Value.absent(),
  });
  PreguntaOpcionesCompanion.insert({
    this.idOpcion = const Value.absent(),
    required int idPregunta,
    required int idModulo,
    required int idPaso,
    required String respuesta,
    this.valor = const Value.absent(),
  }) : idPregunta = Value(idPregunta),
       idModulo = Value(idModulo),
       idPaso = Value(idPaso),
       respuesta = Value(respuesta);
  static Insertable<PreguntaOpcionData> custom({
    Expression<int>? idOpcion,
    Expression<int>? idPregunta,
    Expression<int>? idModulo,
    Expression<int>? idPaso,
    Expression<String>? respuesta,
    Expression<bool>? valor,
  }) {
    return RawValuesInsertable({
      if (idOpcion != null) 'id_opcion': idOpcion,
      if (idPregunta != null) 'id_pregunta': idPregunta,
      if (idModulo != null) 'id_modulo': idModulo,
      if (idPaso != null) 'id_paso': idPaso,
      if (respuesta != null) 'respuesta': respuesta,
      if (valor != null) 'valor': valor,
    });
  }

  PreguntaOpcionesCompanion copyWith({
    Value<int>? idOpcion,
    Value<int>? idPregunta,
    Value<int>? idModulo,
    Value<int>? idPaso,
    Value<String>? respuesta,
    Value<bool>? valor,
  }) {
    return PreguntaOpcionesCompanion(
      idOpcion: idOpcion ?? this.idOpcion,
      idPregunta: idPregunta ?? this.idPregunta,
      idModulo: idModulo ?? this.idModulo,
      idPaso: idPaso ?? this.idPaso,
      respuesta: respuesta ?? this.respuesta,
      valor: valor ?? this.valor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOpcion.present) {
      map['id_opcion'] = Variable<int>(idOpcion.value);
    }
    if (idPregunta.present) {
      map['id_pregunta'] = Variable<int>(idPregunta.value);
    }
    if (idModulo.present) {
      map['id_modulo'] = Variable<int>(idModulo.value);
    }
    if (idPaso.present) {
      map['id_paso'] = Variable<int>(idPaso.value);
    }
    if (respuesta.present) {
      map['respuesta'] = Variable<String>(respuesta.value);
    }
    if (valor.present) {
      map['valor'] = Variable<bool>(valor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreguntaOpcionesCompanion(')
          ..write('idOpcion: $idOpcion, ')
          ..write('idPregunta: $idPregunta, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('respuesta: $respuesta, ')
          ..write('valor: $valor')
          ..write(')'))
        .toString();
  }
}

class $TeoriasTable extends Teorias with TableInfo<$TeoriasTable, TeoriaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeoriasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idTeoriaMeta = const VerificationMeta(
    'idTeoria',
  );
  @override
  late final GeneratedColumn<int> idTeoria = GeneratedColumn<int>(
    'id_teoria',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idModuloMeta = const VerificationMeta(
    'idModulo',
  );
  @override
  late final GeneratedColumn<int> idModulo = GeneratedColumn<int>(
    'id_modulo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES modulos (id_modulo)',
    ),
  );
  static const VerificationMeta _idPasoMeta = const VerificationMeta('idPaso');
  @override
  late final GeneratedColumn<int> idPaso = GeneratedColumn<int>(
    'id_paso',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pasos (id_paso)',
    ),
  );
  static const VerificationMeta _paginaMeta = const VerificationMeta('pagina');
  @override
  late final GeneratedColumn<int> pagina = GeneratedColumn<int>(
    'pagina',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _escritoMeta = const VerificationMeta(
    'escrito',
  );
  @override
  late final GeneratedColumn<String> escrito = GeneratedColumn<String>(
    'escrito',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idTeoria,
    idModulo,
    idPaso,
    pagina,
    escrito,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teorias';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeoriaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_teoria')) {
      context.handle(
        _idTeoriaMeta,
        idTeoria.isAcceptableOrUnknown(data['id_teoria']!, _idTeoriaMeta),
      );
    }
    if (data.containsKey('id_modulo')) {
      context.handle(
        _idModuloMeta,
        idModulo.isAcceptableOrUnknown(data['id_modulo']!, _idModuloMeta),
      );
    } else if (isInserting) {
      context.missing(_idModuloMeta);
    }
    if (data.containsKey('id_paso')) {
      context.handle(
        _idPasoMeta,
        idPaso.isAcceptableOrUnknown(data['id_paso']!, _idPasoMeta),
      );
    } else if (isInserting) {
      context.missing(_idPasoMeta);
    }
    if (data.containsKey('pagina')) {
      context.handle(
        _paginaMeta,
        pagina.isAcceptableOrUnknown(data['pagina']!, _paginaMeta),
      );
    }
    if (data.containsKey('escrito')) {
      context.handle(
        _escritoMeta,
        escrito.isAcceptableOrUnknown(data['escrito']!, _escritoMeta),
      );
    } else if (isInserting) {
      context.missing(_escritoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idTeoria};
  @override
  TeoriaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeoriaData(
      idTeoria: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_teoria'],
      )!,
      idModulo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_modulo'],
      )!,
      idPaso: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_paso'],
      )!,
      pagina: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pagina'],
      )!,
      escrito: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}escrito'],
      )!,
    );
  }

  @override
  $TeoriasTable createAlias(String alias) {
    return $TeoriasTable(attachedDatabase, alias);
  }
}

class TeoriaData extends DataClass implements Insertable<TeoriaData> {
  final int idTeoria;
  final int idModulo;
  final int idPaso;
  final int pagina;
  final String escrito;
  const TeoriaData({
    required this.idTeoria,
    required this.idModulo,
    required this.idPaso,
    required this.pagina,
    required this.escrito,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_teoria'] = Variable<int>(idTeoria);
    map['id_modulo'] = Variable<int>(idModulo);
    map['id_paso'] = Variable<int>(idPaso);
    map['pagina'] = Variable<int>(pagina);
    map['escrito'] = Variable<String>(escrito);
    return map;
  }

  TeoriasCompanion toCompanion(bool nullToAbsent) {
    return TeoriasCompanion(
      idTeoria: Value(idTeoria),
      idModulo: Value(idModulo),
      idPaso: Value(idPaso),
      pagina: Value(pagina),
      escrito: Value(escrito),
    );
  }

  factory TeoriaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeoriaData(
      idTeoria: serializer.fromJson<int>(json['idTeoria']),
      idModulo: serializer.fromJson<int>(json['idModulo']),
      idPaso: serializer.fromJson<int>(json['idPaso']),
      pagina: serializer.fromJson<int>(json['pagina']),
      escrito: serializer.fromJson<String>(json['escrito']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idTeoria': serializer.toJson<int>(idTeoria),
      'idModulo': serializer.toJson<int>(idModulo),
      'idPaso': serializer.toJson<int>(idPaso),
      'pagina': serializer.toJson<int>(pagina),
      'escrito': serializer.toJson<String>(escrito),
    };
  }

  TeoriaData copyWith({
    int? idTeoria,
    int? idModulo,
    int? idPaso,
    int? pagina,
    String? escrito,
  }) => TeoriaData(
    idTeoria: idTeoria ?? this.idTeoria,
    idModulo: idModulo ?? this.idModulo,
    idPaso: idPaso ?? this.idPaso,
    pagina: pagina ?? this.pagina,
    escrito: escrito ?? this.escrito,
  );
  TeoriaData copyWithCompanion(TeoriasCompanion data) {
    return TeoriaData(
      idTeoria: data.idTeoria.present ? data.idTeoria.value : this.idTeoria,
      idModulo: data.idModulo.present ? data.idModulo.value : this.idModulo,
      idPaso: data.idPaso.present ? data.idPaso.value : this.idPaso,
      pagina: data.pagina.present ? data.pagina.value : this.pagina,
      escrito: data.escrito.present ? data.escrito.value : this.escrito,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeoriaData(')
          ..write('idTeoria: $idTeoria, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('pagina: $pagina, ')
          ..write('escrito: $escrito')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idTeoria, idModulo, idPaso, pagina, escrito);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeoriaData &&
          other.idTeoria == this.idTeoria &&
          other.idModulo == this.idModulo &&
          other.idPaso == this.idPaso &&
          other.pagina == this.pagina &&
          other.escrito == this.escrito);
}

class TeoriasCompanion extends UpdateCompanion<TeoriaData> {
  final Value<int> idTeoria;
  final Value<int> idModulo;
  final Value<int> idPaso;
  final Value<int> pagina;
  final Value<String> escrito;
  const TeoriasCompanion({
    this.idTeoria = const Value.absent(),
    this.idModulo = const Value.absent(),
    this.idPaso = const Value.absent(),
    this.pagina = const Value.absent(),
    this.escrito = const Value.absent(),
  });
  TeoriasCompanion.insert({
    this.idTeoria = const Value.absent(),
    required int idModulo,
    required int idPaso,
    this.pagina = const Value.absent(),
    required String escrito,
  }) : idModulo = Value(idModulo),
       idPaso = Value(idPaso),
       escrito = Value(escrito);
  static Insertable<TeoriaData> custom({
    Expression<int>? idTeoria,
    Expression<int>? idModulo,
    Expression<int>? idPaso,
    Expression<int>? pagina,
    Expression<String>? escrito,
  }) {
    return RawValuesInsertable({
      if (idTeoria != null) 'id_teoria': idTeoria,
      if (idModulo != null) 'id_modulo': idModulo,
      if (idPaso != null) 'id_paso': idPaso,
      if (pagina != null) 'pagina': pagina,
      if (escrito != null) 'escrito': escrito,
    });
  }

  TeoriasCompanion copyWith({
    Value<int>? idTeoria,
    Value<int>? idModulo,
    Value<int>? idPaso,
    Value<int>? pagina,
    Value<String>? escrito,
  }) {
    return TeoriasCompanion(
      idTeoria: idTeoria ?? this.idTeoria,
      idModulo: idModulo ?? this.idModulo,
      idPaso: idPaso ?? this.idPaso,
      pagina: pagina ?? this.pagina,
      escrito: escrito ?? this.escrito,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idTeoria.present) {
      map['id_teoria'] = Variable<int>(idTeoria.value);
    }
    if (idModulo.present) {
      map['id_modulo'] = Variable<int>(idModulo.value);
    }
    if (idPaso.present) {
      map['id_paso'] = Variable<int>(idPaso.value);
    }
    if (pagina.present) {
      map['pagina'] = Variable<int>(pagina.value);
    }
    if (escrito.present) {
      map['escrito'] = Variable<String>(escrito.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeoriasCompanion(')
          ..write('idTeoria: $idTeoria, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('pagina: $pagina, ')
          ..write('escrito: $escrito')
          ..write(')'))
        .toString();
  }
}

class $PuntajeCuestionarioTable extends PuntajeCuestionario
    with TableInfo<$PuntajeCuestionarioTable, PuntajeCuestionarioData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuntajeCuestionarioTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPuntajeMeta = const VerificationMeta(
    'idPuntaje',
  );
  @override
  late final GeneratedColumn<int> idPuntaje = GeneratedColumn<int>(
    'id_puntaje',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idModuloMeta = const VerificationMeta(
    'idModulo',
  );
  @override
  late final GeneratedColumn<int> idModulo = GeneratedColumn<int>(
    'id_modulo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES modulos (id_modulo)',
    ),
  );
  static const VerificationMeta _idPasoMeta = const VerificationMeta('idPaso');
  @override
  late final GeneratedColumn<int> idPaso = GeneratedColumn<int>(
    'id_paso',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pasos (id_paso)',
    ),
  );
  static const VerificationMeta _puntajeMeta = const VerificationMeta(
    'puntaje',
  );
  @override
  late final GeneratedColumn<int> puntaje = GeneratedColumn<int>(
    'puntaje',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [idPuntaje, idModulo, idPaso, puntaje];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'puntaje_cuestionario';
  @override
  VerificationContext validateIntegrity(
    Insertable<PuntajeCuestionarioData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_puntaje')) {
      context.handle(
        _idPuntajeMeta,
        idPuntaje.isAcceptableOrUnknown(data['id_puntaje']!, _idPuntajeMeta),
      );
    }
    if (data.containsKey('id_modulo')) {
      context.handle(
        _idModuloMeta,
        idModulo.isAcceptableOrUnknown(data['id_modulo']!, _idModuloMeta),
      );
    } else if (isInserting) {
      context.missing(_idModuloMeta);
    }
    if (data.containsKey('id_paso')) {
      context.handle(
        _idPasoMeta,
        idPaso.isAcceptableOrUnknown(data['id_paso']!, _idPasoMeta),
      );
    } else if (isInserting) {
      context.missing(_idPasoMeta);
    }
    if (data.containsKey('puntaje')) {
      context.handle(
        _puntajeMeta,
        puntaje.isAcceptableOrUnknown(data['puntaje']!, _puntajeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPuntaje};
  @override
  PuntajeCuestionarioData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuntajeCuestionarioData(
      idPuntaje: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_puntaje'],
      )!,
      idModulo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_modulo'],
      )!,
      idPaso: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_paso'],
      )!,
      puntaje: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}puntaje'],
      )!,
    );
  }

  @override
  $PuntajeCuestionarioTable createAlias(String alias) {
    return $PuntajeCuestionarioTable(attachedDatabase, alias);
  }
}

class PuntajeCuestionarioData extends DataClass
    implements Insertable<PuntajeCuestionarioData> {
  final int idPuntaje;
  final int idModulo;
  final int idPaso;
  final int puntaje;
  const PuntajeCuestionarioData({
    required this.idPuntaje,
    required this.idModulo,
    required this.idPaso,
    required this.puntaje,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_puntaje'] = Variable<int>(idPuntaje);
    map['id_modulo'] = Variable<int>(idModulo);
    map['id_paso'] = Variable<int>(idPaso);
    map['puntaje'] = Variable<int>(puntaje);
    return map;
  }

  PuntajeCuestionarioCompanion toCompanion(bool nullToAbsent) {
    return PuntajeCuestionarioCompanion(
      idPuntaje: Value(idPuntaje),
      idModulo: Value(idModulo),
      idPaso: Value(idPaso),
      puntaje: Value(puntaje),
    );
  }

  factory PuntajeCuestionarioData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuntajeCuestionarioData(
      idPuntaje: serializer.fromJson<int>(json['idPuntaje']),
      idModulo: serializer.fromJson<int>(json['idModulo']),
      idPaso: serializer.fromJson<int>(json['idPaso']),
      puntaje: serializer.fromJson<int>(json['puntaje']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPuntaje': serializer.toJson<int>(idPuntaje),
      'idModulo': serializer.toJson<int>(idModulo),
      'idPaso': serializer.toJson<int>(idPaso),
      'puntaje': serializer.toJson<int>(puntaje),
    };
  }

  PuntajeCuestionarioData copyWith({
    int? idPuntaje,
    int? idModulo,
    int? idPaso,
    int? puntaje,
  }) => PuntajeCuestionarioData(
    idPuntaje: idPuntaje ?? this.idPuntaje,
    idModulo: idModulo ?? this.idModulo,
    idPaso: idPaso ?? this.idPaso,
    puntaje: puntaje ?? this.puntaje,
  );
  PuntajeCuestionarioData copyWithCompanion(PuntajeCuestionarioCompanion data) {
    return PuntajeCuestionarioData(
      idPuntaje: data.idPuntaje.present ? data.idPuntaje.value : this.idPuntaje,
      idModulo: data.idModulo.present ? data.idModulo.value : this.idModulo,
      idPaso: data.idPaso.present ? data.idPaso.value : this.idPaso,
      puntaje: data.puntaje.present ? data.puntaje.value : this.puntaje,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PuntajeCuestionarioData(')
          ..write('idPuntaje: $idPuntaje, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('puntaje: $puntaje')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPuntaje, idModulo, idPaso, puntaje);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuntajeCuestionarioData &&
          other.idPuntaje == this.idPuntaje &&
          other.idModulo == this.idModulo &&
          other.idPaso == this.idPaso &&
          other.puntaje == this.puntaje);
}

class PuntajeCuestionarioCompanion
    extends UpdateCompanion<PuntajeCuestionarioData> {
  final Value<int> idPuntaje;
  final Value<int> idModulo;
  final Value<int> idPaso;
  final Value<int> puntaje;
  const PuntajeCuestionarioCompanion({
    this.idPuntaje = const Value.absent(),
    this.idModulo = const Value.absent(),
    this.idPaso = const Value.absent(),
    this.puntaje = const Value.absent(),
  });
  PuntajeCuestionarioCompanion.insert({
    this.idPuntaje = const Value.absent(),
    required int idModulo,
    required int idPaso,
    this.puntaje = const Value.absent(),
  }) : idModulo = Value(idModulo),
       idPaso = Value(idPaso);
  static Insertable<PuntajeCuestionarioData> custom({
    Expression<int>? idPuntaje,
    Expression<int>? idModulo,
    Expression<int>? idPaso,
    Expression<int>? puntaje,
  }) {
    return RawValuesInsertable({
      if (idPuntaje != null) 'id_puntaje': idPuntaje,
      if (idModulo != null) 'id_modulo': idModulo,
      if (idPaso != null) 'id_paso': idPaso,
      if (puntaje != null) 'puntaje': puntaje,
    });
  }

  PuntajeCuestionarioCompanion copyWith({
    Value<int>? idPuntaje,
    Value<int>? idModulo,
    Value<int>? idPaso,
    Value<int>? puntaje,
  }) {
    return PuntajeCuestionarioCompanion(
      idPuntaje: idPuntaje ?? this.idPuntaje,
      idModulo: idModulo ?? this.idModulo,
      idPaso: idPaso ?? this.idPaso,
      puntaje: puntaje ?? this.puntaje,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPuntaje.present) {
      map['id_puntaje'] = Variable<int>(idPuntaje.value);
    }
    if (idModulo.present) {
      map['id_modulo'] = Variable<int>(idModulo.value);
    }
    if (idPaso.present) {
      map['id_paso'] = Variable<int>(idPaso.value);
    }
    if (puntaje.present) {
      map['puntaje'] = Variable<int>(puntaje.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuntajeCuestionarioCompanion(')
          ..write('idPuntaje: $idPuntaje, ')
          ..write('idModulo: $idModulo, ')
          ..write('idPaso: $idPaso, ')
          ..write('puntaje: $puntaje')
          ..write(')'))
        .toString();
  }
}

class $PuntajeExamenTable extends PuntajeExamen
    with TableInfo<$PuntajeExamenTable, PuntajeExamenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuntajeExamenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPuntajeExamenMeta = const VerificationMeta(
    'idPuntajeExamen',
  );
  @override
  late final GeneratedColumn<int> idPuntajeExamen = GeneratedColumn<int>(
    'id_puntaje_examen',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idModuloMeta = const VerificationMeta(
    'idModulo',
  );
  @override
  late final GeneratedColumn<int> idModulo = GeneratedColumn<int>(
    'id_modulo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES modulos (id_modulo)',
    ),
  );
  static const VerificationMeta _puntajeMeta = const VerificationMeta(
    'puntaje',
  );
  @override
  late final GeneratedColumn<int> puntaje = GeneratedColumn<int>(
    'puntaje',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [idPuntajeExamen, idModulo, puntaje];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'puntaje_examen';
  @override
  VerificationContext validateIntegrity(
    Insertable<PuntajeExamenData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_puntaje_examen')) {
      context.handle(
        _idPuntajeExamenMeta,
        idPuntajeExamen.isAcceptableOrUnknown(
          data['id_puntaje_examen']!,
          _idPuntajeExamenMeta,
        ),
      );
    }
    if (data.containsKey('id_modulo')) {
      context.handle(
        _idModuloMeta,
        idModulo.isAcceptableOrUnknown(data['id_modulo']!, _idModuloMeta),
      );
    } else if (isInserting) {
      context.missing(_idModuloMeta);
    }
    if (data.containsKey('puntaje')) {
      context.handle(
        _puntajeMeta,
        puntaje.isAcceptableOrUnknown(data['puntaje']!, _puntajeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPuntajeExamen};
  @override
  PuntajeExamenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuntajeExamenData(
      idPuntajeExamen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_puntaje_examen'],
      )!,
      idModulo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_modulo'],
      )!,
      puntaje: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}puntaje'],
      )!,
    );
  }

  @override
  $PuntajeExamenTable createAlias(String alias) {
    return $PuntajeExamenTable(attachedDatabase, alias);
  }
}

class PuntajeExamenData extends DataClass
    implements Insertable<PuntajeExamenData> {
  final int idPuntajeExamen;
  final int idModulo;
  final int puntaje;
  const PuntajeExamenData({
    required this.idPuntajeExamen,
    required this.idModulo,
    required this.puntaje,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_puntaje_examen'] = Variable<int>(idPuntajeExamen);
    map['id_modulo'] = Variable<int>(idModulo);
    map['puntaje'] = Variable<int>(puntaje);
    return map;
  }

  PuntajeExamenCompanion toCompanion(bool nullToAbsent) {
    return PuntajeExamenCompanion(
      idPuntajeExamen: Value(idPuntajeExamen),
      idModulo: Value(idModulo),
      puntaje: Value(puntaje),
    );
  }

  factory PuntajeExamenData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuntajeExamenData(
      idPuntajeExamen: serializer.fromJson<int>(json['idPuntajeExamen']),
      idModulo: serializer.fromJson<int>(json['idModulo']),
      puntaje: serializer.fromJson<int>(json['puntaje']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPuntajeExamen': serializer.toJson<int>(idPuntajeExamen),
      'idModulo': serializer.toJson<int>(idModulo),
      'puntaje': serializer.toJson<int>(puntaje),
    };
  }

  PuntajeExamenData copyWith({
    int? idPuntajeExamen,
    int? idModulo,
    int? puntaje,
  }) => PuntajeExamenData(
    idPuntajeExamen: idPuntajeExamen ?? this.idPuntajeExamen,
    idModulo: idModulo ?? this.idModulo,
    puntaje: puntaje ?? this.puntaje,
  );
  PuntajeExamenData copyWithCompanion(PuntajeExamenCompanion data) {
    return PuntajeExamenData(
      idPuntajeExamen: data.idPuntajeExamen.present
          ? data.idPuntajeExamen.value
          : this.idPuntajeExamen,
      idModulo: data.idModulo.present ? data.idModulo.value : this.idModulo,
      puntaje: data.puntaje.present ? data.puntaje.value : this.puntaje,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PuntajeExamenData(')
          ..write('idPuntajeExamen: $idPuntajeExamen, ')
          ..write('idModulo: $idModulo, ')
          ..write('puntaje: $puntaje')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPuntajeExamen, idModulo, puntaje);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuntajeExamenData &&
          other.idPuntajeExamen == this.idPuntajeExamen &&
          other.idModulo == this.idModulo &&
          other.puntaje == this.puntaje);
}

class PuntajeExamenCompanion extends UpdateCompanion<PuntajeExamenData> {
  final Value<int> idPuntajeExamen;
  final Value<int> idModulo;
  final Value<int> puntaje;
  const PuntajeExamenCompanion({
    this.idPuntajeExamen = const Value.absent(),
    this.idModulo = const Value.absent(),
    this.puntaje = const Value.absent(),
  });
  PuntajeExamenCompanion.insert({
    this.idPuntajeExamen = const Value.absent(),
    required int idModulo,
    this.puntaje = const Value.absent(),
  }) : idModulo = Value(idModulo);
  static Insertable<PuntajeExamenData> custom({
    Expression<int>? idPuntajeExamen,
    Expression<int>? idModulo,
    Expression<int>? puntaje,
  }) {
    return RawValuesInsertable({
      if (idPuntajeExamen != null) 'id_puntaje_examen': idPuntajeExamen,
      if (idModulo != null) 'id_modulo': idModulo,
      if (puntaje != null) 'puntaje': puntaje,
    });
  }

  PuntajeExamenCompanion copyWith({
    Value<int>? idPuntajeExamen,
    Value<int>? idModulo,
    Value<int>? puntaje,
  }) {
    return PuntajeExamenCompanion(
      idPuntajeExamen: idPuntajeExamen ?? this.idPuntajeExamen,
      idModulo: idModulo ?? this.idModulo,
      puntaje: puntaje ?? this.puntaje,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPuntajeExamen.present) {
      map['id_puntaje_examen'] = Variable<int>(idPuntajeExamen.value);
    }
    if (idModulo.present) {
      map['id_modulo'] = Variable<int>(idModulo.value);
    }
    if (puntaje.present) {
      map['puntaje'] = Variable<int>(puntaje.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuntajeExamenCompanion(')
          ..write('idPuntajeExamen: $idPuntajeExamen, ')
          ..write('idModulo: $idModulo, ')
          ..write('puntaje: $puntaje')
          ..write(')'))
        .toString();
  }
}

class $GlosariosTable extends Glosarios
    with TableInfo<$GlosariosTable, GlosarioData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GlosariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idGlosarioMeta = const VerificationMeta(
    'idGlosario',
  );
  @override
  late final GeneratedColumn<int> idGlosario = GeneratedColumn<int>(
    'id_glosario',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _terminoMeta = const VerificationMeta(
    'termino',
  );
  @override
  late final GeneratedColumn<String> termino = GeneratedColumn<String>(
    'termino',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idGlosario, termino, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'glosarios';
  @override
  VerificationContext validateIntegrity(
    Insertable<GlosarioData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_glosario')) {
      context.handle(
        _idGlosarioMeta,
        idGlosario.isAcceptableOrUnknown(data['id_glosario']!, _idGlosarioMeta),
      );
    }
    if (data.containsKey('termino')) {
      context.handle(
        _terminoMeta,
        termino.isAcceptableOrUnknown(data['termino']!, _terminoMeta),
      );
    } else if (isInserting) {
      context.missing(_terminoMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idGlosario};
  @override
  GlosarioData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GlosarioData(
      idGlosario: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_glosario'],
      )!,
      termino: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}termino'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
    );
  }

  @override
  $GlosariosTable createAlias(String alias) {
    return $GlosariosTable(attachedDatabase, alias);
  }
}

class GlosarioData extends DataClass implements Insertable<GlosarioData> {
  final int idGlosario;
  final String termino;
  final String descripcion;
  const GlosarioData({
    required this.idGlosario,
    required this.termino,
    required this.descripcion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_glosario'] = Variable<int>(idGlosario);
    map['termino'] = Variable<String>(termino);
    map['descripcion'] = Variable<String>(descripcion);
    return map;
  }

  GlosariosCompanion toCompanion(bool nullToAbsent) {
    return GlosariosCompanion(
      idGlosario: Value(idGlosario),
      termino: Value(termino),
      descripcion: Value(descripcion),
    );
  }

  factory GlosarioData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GlosarioData(
      idGlosario: serializer.fromJson<int>(json['idGlosario']),
      termino: serializer.fromJson<String>(json['termino']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idGlosario': serializer.toJson<int>(idGlosario),
      'termino': serializer.toJson<String>(termino),
      'descripcion': serializer.toJson<String>(descripcion),
    };
  }

  GlosarioData copyWith({
    int? idGlosario,
    String? termino,
    String? descripcion,
  }) => GlosarioData(
    idGlosario: idGlosario ?? this.idGlosario,
    termino: termino ?? this.termino,
    descripcion: descripcion ?? this.descripcion,
  );
  GlosarioData copyWithCompanion(GlosariosCompanion data) {
    return GlosarioData(
      idGlosario: data.idGlosario.present
          ? data.idGlosario.value
          : this.idGlosario,
      termino: data.termino.present ? data.termino.value : this.termino,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GlosarioData(')
          ..write('idGlosario: $idGlosario, ')
          ..write('termino: $termino, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idGlosario, termino, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GlosarioData &&
          other.idGlosario == this.idGlosario &&
          other.termino == this.termino &&
          other.descripcion == this.descripcion);
}

class GlosariosCompanion extends UpdateCompanion<GlosarioData> {
  final Value<int> idGlosario;
  final Value<String> termino;
  final Value<String> descripcion;
  const GlosariosCompanion({
    this.idGlosario = const Value.absent(),
    this.termino = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  GlosariosCompanion.insert({
    this.idGlosario = const Value.absent(),
    required String termino,
    required String descripcion,
  }) : termino = Value(termino),
       descripcion = Value(descripcion);
  static Insertable<GlosarioData> custom({
    Expression<int>? idGlosario,
    Expression<String>? termino,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (idGlosario != null) 'id_glosario': idGlosario,
      if (termino != null) 'termino': termino,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  GlosariosCompanion copyWith({
    Value<int>? idGlosario,
    Value<String>? termino,
    Value<String>? descripcion,
  }) {
    return GlosariosCompanion(
      idGlosario: idGlosario ?? this.idGlosario,
      termino: termino ?? this.termino,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idGlosario.present) {
      map['id_glosario'] = Variable<int>(idGlosario.value);
    }
    if (termino.present) {
      map['termino'] = Variable<String>(termino.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GlosariosCompanion(')
          ..write('idGlosario: $idGlosario, ')
          ..write('termino: $termino, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ModulosTable modulos = $ModulosTable(this);
  late final $PasosTable pasos = $PasosTable(this);
  late final $PreguntasTable preguntas = $PreguntasTable(this);
  late final $PreguntaOpcionesTable preguntaOpciones = $PreguntaOpcionesTable(
    this,
  );
  late final $TeoriasTable teorias = $TeoriasTable(this);
  late final $PuntajeCuestionarioTable puntajeCuestionario =
      $PuntajeCuestionarioTable(this);
  late final $PuntajeExamenTable puntajeExamen = $PuntajeExamenTable(this);
  late final $GlosariosTable glosarios = $GlosariosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    modulos,
    pasos,
    preguntas,
    preguntaOpciones,
    teorias,
    puntajeCuestionario,
    puntajeExamen,
    glosarios,
  ];
}

typedef $$ModulosTableCreateCompanionBuilder =
    ModulosCompanion Function({
      Value<int> idModulo,
      required String nombre,
      Value<String> descripcion,
      Value<bool> bloqueado,
    });
typedef $$ModulosTableUpdateCompanionBuilder =
    ModulosCompanion Function({
      Value<int> idModulo,
      Value<String> nombre,
      Value<String> descripcion,
      Value<bool> bloqueado,
    });

final class $$ModulosTableReferences
    extends BaseReferences<_$AppDatabase, $ModulosTable, ModuloData> {
  $$ModulosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PasosTable, List<PasoData>> _pasosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pasos,
    aliasName: 'modulos__id_modulo__pasos__id_modulo',
  );

  $$PasosTableProcessedTableManager get pasosRefs {
    final manager = $$PasosTableTableManager($_db, $_db.pasos).filter(
      (f) => f.idModulo.idModulo.sqlEquals($_itemColumn<int>('id_modulo')!),
    );

    final cache = $_typedResult.readTableOrNull(_pasosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PreguntasTable, List<PreguntaData>>
  _preguntasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.preguntas,
    aliasName: 'modulos__id_modulo__preguntas__id_modulo',
  );

  $$PreguntasTableProcessedTableManager get preguntasRefs {
    final manager = $$PreguntasTableTableManager($_db, $_db.preguntas).filter(
      (f) => f.idModulo.idModulo.sqlEquals($_itemColumn<int>('id_modulo')!),
    );

    final cache = $_typedResult.readTableOrNull(_preguntasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PreguntaOpcionesTable, List<PreguntaOpcionData>>
  _preguntaOpcionesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.preguntaOpciones,
    aliasName: 'modulos__id_modulo__pregunta_opciones__id_modulo',
  );

  $$PreguntaOpcionesTableProcessedTableManager get preguntaOpcionesRefs {
    final manager =
        $$PreguntaOpcionesTableTableManager($_db, $_db.preguntaOpciones).filter(
          (f) => f.idModulo.idModulo.sqlEquals($_itemColumn<int>('id_modulo')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _preguntaOpcionesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TeoriasTable, List<TeoriaData>> _teoriasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.teorias,
    aliasName: 'modulos__id_modulo__teorias__id_modulo',
  );

  $$TeoriasTableProcessedTableManager get teoriasRefs {
    final manager = $$TeoriasTableTableManager($_db, $_db.teorias).filter(
      (f) => f.idModulo.idModulo.sqlEquals($_itemColumn<int>('id_modulo')!),
    );

    final cache = $_typedResult.readTableOrNull(_teoriasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PuntajeCuestionarioTable,
    List<PuntajeCuestionarioData>
  >
  _puntajeCuestionarioRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.puntajeCuestionario,
        aliasName: 'modulos__id_modulo__puntaje_cuestionario__id_modulo',
      );

  $$PuntajeCuestionarioTableProcessedTableManager get puntajeCuestionarioRefs {
    final manager =
        $$PuntajeCuestionarioTableTableManager(
          $_db,
          $_db.puntajeCuestionario,
        ).filter(
          (f) => f.idModulo.idModulo.sqlEquals($_itemColumn<int>('id_modulo')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _puntajeCuestionarioRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PuntajeExamenTable, List<PuntajeExamenData>>
  _puntajeExamenRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.puntajeExamen,
    aliasName: 'modulos__id_modulo__puntaje_examen__id_modulo',
  );

  $$PuntajeExamenTableProcessedTableManager get puntajeExamenRefs {
    final manager = $$PuntajeExamenTableTableManager($_db, $_db.puntajeExamen)
        .filter(
          (f) => f.idModulo.idModulo.sqlEquals($_itemColumn<int>('id_modulo')!),
        );

    final cache = $_typedResult.readTableOrNull(_puntajeExamenRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ModulosTableFilterComposer
    extends Composer<_$AppDatabase, $ModulosTable> {
  $$ModulosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idModulo => $composableBuilder(
    column: $table.idModulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get bloqueado => $composableBuilder(
    column: $table.bloqueado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> pasosRefs(
    Expression<bool> Function($$PasosTableFilterComposer f) f,
  ) {
    final $$PasosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableFilterComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> preguntasRefs(
    Expression<bool> Function($$PreguntasTableFilterComposer f) f,
  ) {
    final $$PreguntasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableFilterComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> preguntaOpcionesRefs(
    Expression<bool> Function($$PreguntaOpcionesTableFilterComposer f) f,
  ) {
    final $$PreguntaOpcionesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.preguntaOpciones,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntaOpcionesTableFilterComposer(
            $db: $db,
            $table: $db.preguntaOpciones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> teoriasRefs(
    Expression<bool> Function($$TeoriasTableFilterComposer f) f,
  ) {
    final $$TeoriasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.teorias,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeoriasTableFilterComposer(
            $db: $db,
            $table: $db.teorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> puntajeCuestionarioRefs(
    Expression<bool> Function($$PuntajeCuestionarioTableFilterComposer f) f,
  ) {
    final $$PuntajeCuestionarioTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.puntajeCuestionario,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuntajeCuestionarioTableFilterComposer(
            $db: $db,
            $table: $db.puntajeCuestionario,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> puntajeExamenRefs(
    Expression<bool> Function($$PuntajeExamenTableFilterComposer f) f,
  ) {
    final $$PuntajeExamenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.puntajeExamen,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuntajeExamenTableFilterComposer(
            $db: $db,
            $table: $db.puntajeExamen,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ModulosTableOrderingComposer
    extends Composer<_$AppDatabase, $ModulosTable> {
  $$ModulosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idModulo => $composableBuilder(
    column: $table.idModulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get bloqueado => $composableBuilder(
    column: $table.bloqueado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ModulosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModulosTable> {
  $$ModulosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idModulo =>
      $composableBuilder(column: $table.idModulo, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get bloqueado =>
      $composableBuilder(column: $table.bloqueado, builder: (column) => column);

  Expression<T> pasosRefs<T extends Object>(
    Expression<T> Function($$PasosTableAnnotationComposer a) f,
  ) {
    final $$PasosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableAnnotationComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> preguntasRefs<T extends Object>(
    Expression<T> Function($$PreguntasTableAnnotationComposer a) f,
  ) {
    final $$PreguntasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> preguntaOpcionesRefs<T extends Object>(
    Expression<T> Function($$PreguntaOpcionesTableAnnotationComposer a) f,
  ) {
    final $$PreguntaOpcionesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.preguntaOpciones,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntaOpcionesTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntaOpciones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> teoriasRefs<T extends Object>(
    Expression<T> Function($$TeoriasTableAnnotationComposer a) f,
  ) {
    final $$TeoriasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.teorias,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeoriasTableAnnotationComposer(
            $db: $db,
            $table: $db.teorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> puntajeCuestionarioRefs<T extends Object>(
    Expression<T> Function($$PuntajeCuestionarioTableAnnotationComposer a) f,
  ) {
    final $$PuntajeCuestionarioTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idModulo,
          referencedTable: $db.puntajeCuestionario,
          getReferencedColumn: (t) => t.idModulo,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PuntajeCuestionarioTableAnnotationComposer(
                $db: $db,
                $table: $db.puntajeCuestionario,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> puntajeExamenRefs<T extends Object>(
    Expression<T> Function($$PuntajeExamenTableAnnotationComposer a) f,
  ) {
    final $$PuntajeExamenTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.puntajeExamen,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuntajeExamenTableAnnotationComposer(
            $db: $db,
            $table: $db.puntajeExamen,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ModulosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ModulosTable,
          ModuloData,
          $$ModulosTableFilterComposer,
          $$ModulosTableOrderingComposer,
          $$ModulosTableAnnotationComposer,
          $$ModulosTableCreateCompanionBuilder,
          $$ModulosTableUpdateCompanionBuilder,
          (ModuloData, $$ModulosTableReferences),
          ModuloData,
          PrefetchHooks Function({
            bool pasosRefs,
            bool preguntasRefs,
            bool preguntaOpcionesRefs,
            bool teoriasRefs,
            bool puntajeCuestionarioRefs,
            bool puntajeExamenRefs,
          })
        > {
  $$ModulosTableTableManager(_$AppDatabase db, $ModulosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModulosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModulosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModulosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idModulo = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<bool> bloqueado = const Value.absent(),
              }) => ModulosCompanion(
                idModulo: idModulo,
                nombre: nombre,
                descripcion: descripcion,
                bloqueado: bloqueado,
              ),
          createCompanionCallback:
              ({
                Value<int> idModulo = const Value.absent(),
                required String nombre,
                Value<String> descripcion = const Value.absent(),
                Value<bool> bloqueado = const Value.absent(),
              }) => ModulosCompanion.insert(
                idModulo: idModulo,
                nombre: nombre,
                descripcion: descripcion,
                bloqueado: bloqueado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ModulosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                pasosRefs = false,
                preguntasRefs = false,
                preguntaOpcionesRefs = false,
                teoriasRefs = false,
                puntajeCuestionarioRefs = false,
                puntajeExamenRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (pasosRefs) db.pasos,
                    if (preguntasRefs) db.preguntas,
                    if (preguntaOpcionesRefs) db.preguntaOpciones,
                    if (teoriasRefs) db.teorias,
                    if (puntajeCuestionarioRefs) db.puntajeCuestionario,
                    if (puntajeExamenRefs) db.puntajeExamen,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (pasosRefs)
                        await $_getPrefetchedData<
                          ModuloData,
                          $ModulosTable,
                          PasoData
                        >(
                          currentTable: table,
                          referencedTable: $$ModulosTableReferences
                              ._pasosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ModulosTableReferences(db, table, p0).pasosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idModulo == item.idModulo,
                              ),
                          typedResults: items,
                        ),
                      if (preguntasRefs)
                        await $_getPrefetchedData<
                          ModuloData,
                          $ModulosTable,
                          PreguntaData
                        >(
                          currentTable: table,
                          referencedTable: $$ModulosTableReferences
                              ._preguntasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ModulosTableReferences(
                                db,
                                table,
                                p0,
                              ).preguntasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idModulo == item.idModulo,
                              ),
                          typedResults: items,
                        ),
                      if (preguntaOpcionesRefs)
                        await $_getPrefetchedData<
                          ModuloData,
                          $ModulosTable,
                          PreguntaOpcionData
                        >(
                          currentTable: table,
                          referencedTable: $$ModulosTableReferences
                              ._preguntaOpcionesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ModulosTableReferences(
                                db,
                                table,
                                p0,
                              ).preguntaOpcionesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idModulo == item.idModulo,
                              ),
                          typedResults: items,
                        ),
                      if (teoriasRefs)
                        await $_getPrefetchedData<
                          ModuloData,
                          $ModulosTable,
                          TeoriaData
                        >(
                          currentTable: table,
                          referencedTable: $$ModulosTableReferences
                              ._teoriasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ModulosTableReferences(
                                db,
                                table,
                                p0,
                              ).teoriasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idModulo == item.idModulo,
                              ),
                          typedResults: items,
                        ),
                      if (puntajeCuestionarioRefs)
                        await $_getPrefetchedData<
                          ModuloData,
                          $ModulosTable,
                          PuntajeCuestionarioData
                        >(
                          currentTable: table,
                          referencedTable: $$ModulosTableReferences
                              ._puntajeCuestionarioRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ModulosTableReferences(
                                db,
                                table,
                                p0,
                              ).puntajeCuestionarioRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idModulo == item.idModulo,
                              ),
                          typedResults: items,
                        ),
                      if (puntajeExamenRefs)
                        await $_getPrefetchedData<
                          ModuloData,
                          $ModulosTable,
                          PuntajeExamenData
                        >(
                          currentTable: table,
                          referencedTable: $$ModulosTableReferences
                              ._puntajeExamenRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ModulosTableReferences(
                                db,
                                table,
                                p0,
                              ).puntajeExamenRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idModulo == item.idModulo,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ModulosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ModulosTable,
      ModuloData,
      $$ModulosTableFilterComposer,
      $$ModulosTableOrderingComposer,
      $$ModulosTableAnnotationComposer,
      $$ModulosTableCreateCompanionBuilder,
      $$ModulosTableUpdateCompanionBuilder,
      (ModuloData, $$ModulosTableReferences),
      ModuloData,
      PrefetchHooks Function({
        bool pasosRefs,
        bool preguntasRefs,
        bool preguntaOpcionesRefs,
        bool teoriasRefs,
        bool puntajeCuestionarioRefs,
        bool puntajeExamenRefs,
      })
    >;
typedef $$PasosTableCreateCompanionBuilder =
    PasosCompanion Function({
      Value<int> idPaso,
      required int idModulo,
      required int numero,
      required String nombreLeccion,
      Value<bool> bloqueado,
      required String tipoContenido,
    });
typedef $$PasosTableUpdateCompanionBuilder =
    PasosCompanion Function({
      Value<int> idPaso,
      Value<int> idModulo,
      Value<int> numero,
      Value<String> nombreLeccion,
      Value<bool> bloqueado,
      Value<String> tipoContenido,
    });

final class $$PasosTableReferences
    extends BaseReferences<_$AppDatabase, $PasosTable, PasoData> {
  $$PasosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ModulosTable _idModuloTable(_$AppDatabase db) =>
      db.modulos.createAlias('pasos__id_modulo__modulos__id_modulo');

  $$ModulosTableProcessedTableManager get idModulo {
    final $_column = $_itemColumn<int>('id_modulo')!;

    final manager = $$ModulosTableTableManager(
      $_db,
      $_db.modulos,
    ).filter((f) => f.idModulo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idModuloTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PreguntasTable, List<PreguntaData>>
  _preguntasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.preguntas,
    aliasName: 'pasos__id_paso__preguntas__id_paso',
  );

  $$PreguntasTableProcessedTableManager get preguntasRefs {
    final manager = $$PreguntasTableTableManager(
      $_db,
      $_db.preguntas,
    ).filter((f) => f.idPaso.idPaso.sqlEquals($_itemColumn<int>('id_paso')!));

    final cache = $_typedResult.readTableOrNull(_preguntasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PreguntaOpcionesTable, List<PreguntaOpcionData>>
  _preguntaOpcionesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.preguntaOpciones,
    aliasName: 'pasos__id_paso__pregunta_opciones__id_paso',
  );

  $$PreguntaOpcionesTableProcessedTableManager get preguntaOpcionesRefs {
    final manager = $$PreguntaOpcionesTableTableManager(
      $_db,
      $_db.preguntaOpciones,
    ).filter((f) => f.idPaso.idPaso.sqlEquals($_itemColumn<int>('id_paso')!));

    final cache = $_typedResult.readTableOrNull(
      _preguntaOpcionesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TeoriasTable, List<TeoriaData>> _teoriasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.teorias,
    aliasName: 'pasos__id_paso__teorias__id_paso',
  );

  $$TeoriasTableProcessedTableManager get teoriasRefs {
    final manager = $$TeoriasTableTableManager(
      $_db,
      $_db.teorias,
    ).filter((f) => f.idPaso.idPaso.sqlEquals($_itemColumn<int>('id_paso')!));

    final cache = $_typedResult.readTableOrNull(_teoriasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PuntajeCuestionarioTable,
    List<PuntajeCuestionarioData>
  >
  _puntajeCuestionarioRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.puntajeCuestionario,
        aliasName: 'pasos__id_paso__puntaje_cuestionario__id_paso',
      );

  $$PuntajeCuestionarioTableProcessedTableManager get puntajeCuestionarioRefs {
    final manager = $$PuntajeCuestionarioTableTableManager(
      $_db,
      $_db.puntajeCuestionario,
    ).filter((f) => f.idPaso.idPaso.sqlEquals($_itemColumn<int>('id_paso')!));

    final cache = $_typedResult.readTableOrNull(
      _puntajeCuestionarioRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PasosTableFilterComposer extends Composer<_$AppDatabase, $PasosTable> {
  $$PasosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPaso => $composableBuilder(
    column: $table.idPaso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreLeccion => $composableBuilder(
    column: $table.nombreLeccion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get bloqueado => $composableBuilder(
    column: $table.bloqueado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoContenido => $composableBuilder(
    column: $table.tipoContenido,
    builder: (column) => ColumnFilters(column),
  );

  $$ModulosTableFilterComposer get idModulo {
    final $$ModulosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableFilterComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> preguntasRefs(
    Expression<bool> Function($$PreguntasTableFilterComposer f) f,
  ) {
    final $$PreguntasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableFilterComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> preguntaOpcionesRefs(
    Expression<bool> Function($$PreguntaOpcionesTableFilterComposer f) f,
  ) {
    final $$PreguntaOpcionesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.preguntaOpciones,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntaOpcionesTableFilterComposer(
            $db: $db,
            $table: $db.preguntaOpciones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> teoriasRefs(
    Expression<bool> Function($$TeoriasTableFilterComposer f) f,
  ) {
    final $$TeoriasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.teorias,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeoriasTableFilterComposer(
            $db: $db,
            $table: $db.teorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> puntajeCuestionarioRefs(
    Expression<bool> Function($$PuntajeCuestionarioTableFilterComposer f) f,
  ) {
    final $$PuntajeCuestionarioTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.puntajeCuestionario,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuntajeCuestionarioTableFilterComposer(
            $db: $db,
            $table: $db.puntajeCuestionario,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PasosTableOrderingComposer
    extends Composer<_$AppDatabase, $PasosTable> {
  $$PasosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPaso => $composableBuilder(
    column: $table.idPaso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreLeccion => $composableBuilder(
    column: $table.nombreLeccion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get bloqueado => $composableBuilder(
    column: $table.bloqueado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoContenido => $composableBuilder(
    column: $table.tipoContenido,
    builder: (column) => ColumnOrderings(column),
  );

  $$ModulosTableOrderingComposer get idModulo {
    final $$ModulosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableOrderingComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PasosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PasosTable> {
  $$PasosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPaso =>
      $composableBuilder(column: $table.idPaso, builder: (column) => column);

  GeneratedColumn<int> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get nombreLeccion => $composableBuilder(
    column: $table.nombreLeccion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get bloqueado =>
      $composableBuilder(column: $table.bloqueado, builder: (column) => column);

  GeneratedColumn<String> get tipoContenido => $composableBuilder(
    column: $table.tipoContenido,
    builder: (column) => column,
  );

  $$ModulosTableAnnotationComposer get idModulo {
    final $$ModulosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableAnnotationComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> preguntasRefs<T extends Object>(
    Expression<T> Function($$PreguntasTableAnnotationComposer a) f,
  ) {
    final $$PreguntasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> preguntaOpcionesRefs<T extends Object>(
    Expression<T> Function($$PreguntaOpcionesTableAnnotationComposer a) f,
  ) {
    final $$PreguntaOpcionesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.preguntaOpciones,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntaOpcionesTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntaOpciones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> teoriasRefs<T extends Object>(
    Expression<T> Function($$TeoriasTableAnnotationComposer a) f,
  ) {
    final $$TeoriasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.teorias,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeoriasTableAnnotationComposer(
            $db: $db,
            $table: $db.teorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> puntajeCuestionarioRefs<T extends Object>(
    Expression<T> Function($$PuntajeCuestionarioTableAnnotationComposer a) f,
  ) {
    final $$PuntajeCuestionarioTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idPaso,
          referencedTable: $db.puntajeCuestionario,
          getReferencedColumn: (t) => t.idPaso,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PuntajeCuestionarioTableAnnotationComposer(
                $db: $db,
                $table: $db.puntajeCuestionario,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PasosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PasosTable,
          PasoData,
          $$PasosTableFilterComposer,
          $$PasosTableOrderingComposer,
          $$PasosTableAnnotationComposer,
          $$PasosTableCreateCompanionBuilder,
          $$PasosTableUpdateCompanionBuilder,
          (PasoData, $$PasosTableReferences),
          PasoData,
          PrefetchHooks Function({
            bool idModulo,
            bool preguntasRefs,
            bool preguntaOpcionesRefs,
            bool teoriasRefs,
            bool puntajeCuestionarioRefs,
          })
        > {
  $$PasosTableTableManager(_$AppDatabase db, $PasosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PasosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PasosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PasosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPaso = const Value.absent(),
                Value<int> idModulo = const Value.absent(),
                Value<int> numero = const Value.absent(),
                Value<String> nombreLeccion = const Value.absent(),
                Value<bool> bloqueado = const Value.absent(),
                Value<String> tipoContenido = const Value.absent(),
              }) => PasosCompanion(
                idPaso: idPaso,
                idModulo: idModulo,
                numero: numero,
                nombreLeccion: nombreLeccion,
                bloqueado: bloqueado,
                tipoContenido: tipoContenido,
              ),
          createCompanionCallback:
              ({
                Value<int> idPaso = const Value.absent(),
                required int idModulo,
                required int numero,
                required String nombreLeccion,
                Value<bool> bloqueado = const Value.absent(),
                required String tipoContenido,
              }) => PasosCompanion.insert(
                idPaso: idPaso,
                idModulo: idModulo,
                numero: numero,
                nombreLeccion: nombreLeccion,
                bloqueado: bloqueado,
                tipoContenido: tipoContenido,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PasosTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idModulo = false,
                preguntasRefs = false,
                preguntaOpcionesRefs = false,
                teoriasRefs = false,
                puntajeCuestionarioRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (preguntasRefs) db.preguntas,
                    if (preguntaOpcionesRefs) db.preguntaOpciones,
                    if (teoriasRefs) db.teorias,
                    if (puntajeCuestionarioRefs) db.puntajeCuestionario,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idModulo) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idModulo,
                                    referencedTable: $$PasosTableReferences
                                        ._idModuloTable(db),
                                    referencedColumn: $$PasosTableReferences
                                        ._idModuloTable(db)
                                        .idModulo,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (preguntasRefs)
                        await $_getPrefetchedData<
                          PasoData,
                          $PasosTable,
                          PreguntaData
                        >(
                          currentTable: table,
                          referencedTable: $$PasosTableReferences
                              ._preguntasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PasosTableReferences(
                                db,
                                table,
                                p0,
                              ).preguntasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idPaso == item.idPaso,
                              ),
                          typedResults: items,
                        ),
                      if (preguntaOpcionesRefs)
                        await $_getPrefetchedData<
                          PasoData,
                          $PasosTable,
                          PreguntaOpcionData
                        >(
                          currentTable: table,
                          referencedTable: $$PasosTableReferences
                              ._preguntaOpcionesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PasosTableReferences(
                                db,
                                table,
                                p0,
                              ).preguntaOpcionesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idPaso == item.idPaso,
                              ),
                          typedResults: items,
                        ),
                      if (teoriasRefs)
                        await $_getPrefetchedData<
                          PasoData,
                          $PasosTable,
                          TeoriaData
                        >(
                          currentTable: table,
                          referencedTable: $$PasosTableReferences
                              ._teoriasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PasosTableReferences(db, table, p0).teoriasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idPaso == item.idPaso,
                              ),
                          typedResults: items,
                        ),
                      if (puntajeCuestionarioRefs)
                        await $_getPrefetchedData<
                          PasoData,
                          $PasosTable,
                          PuntajeCuestionarioData
                        >(
                          currentTable: table,
                          referencedTable: $$PasosTableReferences
                              ._puntajeCuestionarioRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PasosTableReferences(
                                db,
                                table,
                                p0,
                              ).puntajeCuestionarioRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idPaso == item.idPaso,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PasosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PasosTable,
      PasoData,
      $$PasosTableFilterComposer,
      $$PasosTableOrderingComposer,
      $$PasosTableAnnotationComposer,
      $$PasosTableCreateCompanionBuilder,
      $$PasosTableUpdateCompanionBuilder,
      (PasoData, $$PasosTableReferences),
      PasoData,
      PrefetchHooks Function({
        bool idModulo,
        bool preguntasRefs,
        bool preguntaOpcionesRefs,
        bool teoriasRefs,
        bool puntajeCuestionarioRefs,
      })
    >;
typedef $$PreguntasTableCreateCompanionBuilder =
    PreguntasCompanion Function({
      Value<int> idPregunta,
      required int idModulo,
      required int idPaso,
      required String titulo,
    });
typedef $$PreguntasTableUpdateCompanionBuilder =
    PreguntasCompanion Function({
      Value<int> idPregunta,
      Value<int> idModulo,
      Value<int> idPaso,
      Value<String> titulo,
    });

final class $$PreguntasTableReferences
    extends BaseReferences<_$AppDatabase, $PreguntasTable, PreguntaData> {
  $$PreguntasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ModulosTable _idModuloTable(_$AppDatabase db) =>
      db.modulos.createAlias('preguntas__id_modulo__modulos__id_modulo');

  $$ModulosTableProcessedTableManager get idModulo {
    final $_column = $_itemColumn<int>('id_modulo')!;

    final manager = $$ModulosTableTableManager(
      $_db,
      $_db.modulos,
    ).filter((f) => f.idModulo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idModuloTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PasosTable _idPasoTable(_$AppDatabase db) =>
      db.pasos.createAlias('preguntas__id_paso__pasos__id_paso');

  $$PasosTableProcessedTableManager get idPaso {
    final $_column = $_itemColumn<int>('id_paso')!;

    final manager = $$PasosTableTableManager(
      $_db,
      $_db.pasos,
    ).filter((f) => f.idPaso.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPasoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PreguntaOpcionesTable, List<PreguntaOpcionData>>
  _preguntaOpcionesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.preguntaOpciones,
    aliasName: 'preguntas__id_pregunta__pregunta_opciones__id_pregunta',
  );

  $$PreguntaOpcionesTableProcessedTableManager get preguntaOpcionesRefs {
    final manager =
        $$PreguntaOpcionesTableTableManager($_db, $_db.preguntaOpciones).filter(
          (f) => f.idPregunta.idPregunta.sqlEquals(
            $_itemColumn<int>('id_pregunta')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _preguntaOpcionesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PreguntasTableFilterComposer
    extends Composer<_$AppDatabase, $PreguntasTable> {
  $$PreguntasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPregunta => $composableBuilder(
    column: $table.idPregunta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  $$ModulosTableFilterComposer get idModulo {
    final $$ModulosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableFilterComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableFilterComposer get idPaso {
    final $$PasosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableFilterComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> preguntaOpcionesRefs(
    Expression<bool> Function($$PreguntaOpcionesTableFilterComposer f) f,
  ) {
    final $$PreguntaOpcionesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPregunta,
      referencedTable: $db.preguntaOpciones,
      getReferencedColumn: (t) => t.idPregunta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntaOpcionesTableFilterComposer(
            $db: $db,
            $table: $db.preguntaOpciones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PreguntasTableOrderingComposer
    extends Composer<_$AppDatabase, $PreguntasTable> {
  $$PreguntasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPregunta => $composableBuilder(
    column: $table.idPregunta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  $$ModulosTableOrderingComposer get idModulo {
    final $$ModulosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableOrderingComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableOrderingComposer get idPaso {
    final $$PasosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableOrderingComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreguntasTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreguntasTable> {
  $$PreguntasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPregunta => $composableBuilder(
    column: $table.idPregunta,
    builder: (column) => column,
  );

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  $$ModulosTableAnnotationComposer get idModulo {
    final $$ModulosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableAnnotationComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableAnnotationComposer get idPaso {
    final $$PasosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableAnnotationComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> preguntaOpcionesRefs<T extends Object>(
    Expression<T> Function($$PreguntaOpcionesTableAnnotationComposer a) f,
  ) {
    final $$PreguntaOpcionesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPregunta,
      referencedTable: $db.preguntaOpciones,
      getReferencedColumn: (t) => t.idPregunta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntaOpcionesTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntaOpciones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PreguntasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreguntasTable,
          PreguntaData,
          $$PreguntasTableFilterComposer,
          $$PreguntasTableOrderingComposer,
          $$PreguntasTableAnnotationComposer,
          $$PreguntasTableCreateCompanionBuilder,
          $$PreguntasTableUpdateCompanionBuilder,
          (PreguntaData, $$PreguntasTableReferences),
          PreguntaData,
          PrefetchHooks Function({
            bool idModulo,
            bool idPaso,
            bool preguntaOpcionesRefs,
          })
        > {
  $$PreguntasTableTableManager(_$AppDatabase db, $PreguntasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreguntasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreguntasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreguntasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPregunta = const Value.absent(),
                Value<int> idModulo = const Value.absent(),
                Value<int> idPaso = const Value.absent(),
                Value<String> titulo = const Value.absent(),
              }) => PreguntasCompanion(
                idPregunta: idPregunta,
                idModulo: idModulo,
                idPaso: idPaso,
                titulo: titulo,
              ),
          createCompanionCallback:
              ({
                Value<int> idPregunta = const Value.absent(),
                required int idModulo,
                required int idPaso,
                required String titulo,
              }) => PreguntasCompanion.insert(
                idPregunta: idPregunta,
                idModulo: idModulo,
                idPaso: idPaso,
                titulo: titulo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PreguntasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idModulo = false,
                idPaso = false,
                preguntaOpcionesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (preguntaOpcionesRefs) db.preguntaOpciones,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idModulo) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idModulo,
                                    referencedTable: $$PreguntasTableReferences
                                        ._idModuloTable(db),
                                    referencedColumn: $$PreguntasTableReferences
                                        ._idModuloTable(db)
                                        .idModulo,
                                  )
                                  as T;
                        }
                        if (idPaso) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idPaso,
                                    referencedTable: $$PreguntasTableReferences
                                        ._idPasoTable(db),
                                    referencedColumn: $$PreguntasTableReferences
                                        ._idPasoTable(db)
                                        .idPaso,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (preguntaOpcionesRefs)
                        await $_getPrefetchedData<
                          PreguntaData,
                          $PreguntasTable,
                          PreguntaOpcionData
                        >(
                          currentTable: table,
                          referencedTable: $$PreguntasTableReferences
                              ._preguntaOpcionesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PreguntasTableReferences(
                                db,
                                table,
                                p0,
                              ).preguntaOpcionesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idPregunta == item.idPregunta,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PreguntasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreguntasTable,
      PreguntaData,
      $$PreguntasTableFilterComposer,
      $$PreguntasTableOrderingComposer,
      $$PreguntasTableAnnotationComposer,
      $$PreguntasTableCreateCompanionBuilder,
      $$PreguntasTableUpdateCompanionBuilder,
      (PreguntaData, $$PreguntasTableReferences),
      PreguntaData,
      PrefetchHooks Function({
        bool idModulo,
        bool idPaso,
        bool preguntaOpcionesRefs,
      })
    >;
typedef $$PreguntaOpcionesTableCreateCompanionBuilder =
    PreguntaOpcionesCompanion Function({
      Value<int> idOpcion,
      required int idPregunta,
      required int idModulo,
      required int idPaso,
      required String respuesta,
      Value<bool> valor,
    });
typedef $$PreguntaOpcionesTableUpdateCompanionBuilder =
    PreguntaOpcionesCompanion Function({
      Value<int> idOpcion,
      Value<int> idPregunta,
      Value<int> idModulo,
      Value<int> idPaso,
      Value<String> respuesta,
      Value<bool> valor,
    });

final class $$PreguntaOpcionesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PreguntaOpcionesTable,
          PreguntaOpcionData
        > {
  $$PreguntaOpcionesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PreguntasTable _idPreguntaTable(_$AppDatabase db) => db.preguntas
      .createAlias('pregunta_opciones__id_pregunta__preguntas__id_pregunta');

  $$PreguntasTableProcessedTableManager get idPregunta {
    final $_column = $_itemColumn<int>('id_pregunta')!;

    final manager = $$PreguntasTableTableManager(
      $_db,
      $_db.preguntas,
    ).filter((f) => f.idPregunta.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPreguntaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ModulosTable _idModuloTable(_$AppDatabase db) => db.modulos
      .createAlias('pregunta_opciones__id_modulo__modulos__id_modulo');

  $$ModulosTableProcessedTableManager get idModulo {
    final $_column = $_itemColumn<int>('id_modulo')!;

    final manager = $$ModulosTableTableManager(
      $_db,
      $_db.modulos,
    ).filter((f) => f.idModulo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idModuloTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PasosTable _idPasoTable(_$AppDatabase db) =>
      db.pasos.createAlias('pregunta_opciones__id_paso__pasos__id_paso');

  $$PasosTableProcessedTableManager get idPaso {
    final $_column = $_itemColumn<int>('id_paso')!;

    final manager = $$PasosTableTableManager(
      $_db,
      $_db.pasos,
    ).filter((f) => f.idPaso.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPasoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PreguntaOpcionesTableFilterComposer
    extends Composer<_$AppDatabase, $PreguntaOpcionesTable> {
  $$PreguntaOpcionesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idOpcion => $composableBuilder(
    column: $table.idOpcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get respuesta => $composableBuilder(
    column: $table.respuesta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get valor => $composableBuilder(
    column: $table.valor,
    builder: (column) => ColumnFilters(column),
  );

  $$PreguntasTableFilterComposer get idPregunta {
    final $$PreguntasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPregunta,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.idPregunta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableFilterComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ModulosTableFilterComposer get idModulo {
    final $$ModulosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableFilterComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableFilterComposer get idPaso {
    final $$PasosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableFilterComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreguntaOpcionesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreguntaOpcionesTable> {
  $$PreguntaOpcionesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idOpcion => $composableBuilder(
    column: $table.idOpcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get respuesta => $composableBuilder(
    column: $table.respuesta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get valor => $composableBuilder(
    column: $table.valor,
    builder: (column) => ColumnOrderings(column),
  );

  $$PreguntasTableOrderingComposer get idPregunta {
    final $$PreguntasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPregunta,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.idPregunta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableOrderingComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ModulosTableOrderingComposer get idModulo {
    final $$ModulosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableOrderingComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableOrderingComposer get idPaso {
    final $$PasosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableOrderingComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreguntaOpcionesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreguntaOpcionesTable> {
  $$PreguntaOpcionesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idOpcion =>
      $composableBuilder(column: $table.idOpcion, builder: (column) => column);

  GeneratedColumn<String> get respuesta =>
      $composableBuilder(column: $table.respuesta, builder: (column) => column);

  GeneratedColumn<bool> get valor =>
      $composableBuilder(column: $table.valor, builder: (column) => column);

  $$PreguntasTableAnnotationComposer get idPregunta {
    final $$PreguntasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPregunta,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.idPregunta,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ModulosTableAnnotationComposer get idModulo {
    final $$ModulosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableAnnotationComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableAnnotationComposer get idPaso {
    final $$PasosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableAnnotationComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreguntaOpcionesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreguntaOpcionesTable,
          PreguntaOpcionData,
          $$PreguntaOpcionesTableFilterComposer,
          $$PreguntaOpcionesTableOrderingComposer,
          $$PreguntaOpcionesTableAnnotationComposer,
          $$PreguntaOpcionesTableCreateCompanionBuilder,
          $$PreguntaOpcionesTableUpdateCompanionBuilder,
          (PreguntaOpcionData, $$PreguntaOpcionesTableReferences),
          PreguntaOpcionData,
          PrefetchHooks Function({bool idPregunta, bool idModulo, bool idPaso})
        > {
  $$PreguntaOpcionesTableTableManager(
    _$AppDatabase db,
    $PreguntaOpcionesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreguntaOpcionesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreguntaOpcionesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreguntaOpcionesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idOpcion = const Value.absent(),
                Value<int> idPregunta = const Value.absent(),
                Value<int> idModulo = const Value.absent(),
                Value<int> idPaso = const Value.absent(),
                Value<String> respuesta = const Value.absent(),
                Value<bool> valor = const Value.absent(),
              }) => PreguntaOpcionesCompanion(
                idOpcion: idOpcion,
                idPregunta: idPregunta,
                idModulo: idModulo,
                idPaso: idPaso,
                respuesta: respuesta,
                valor: valor,
              ),
          createCompanionCallback:
              ({
                Value<int> idOpcion = const Value.absent(),
                required int idPregunta,
                required int idModulo,
                required int idPaso,
                required String respuesta,
                Value<bool> valor = const Value.absent(),
              }) => PreguntaOpcionesCompanion.insert(
                idOpcion: idOpcion,
                idPregunta: idPregunta,
                idModulo: idModulo,
                idPaso: idPaso,
                respuesta: respuesta,
                valor: valor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PreguntaOpcionesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({idPregunta = false, idModulo = false, idPaso = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idPregunta) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idPregunta,
                                    referencedTable:
                                        $$PreguntaOpcionesTableReferences
                                            ._idPreguntaTable(db),
                                    referencedColumn:
                                        $$PreguntaOpcionesTableReferences
                                            ._idPreguntaTable(db)
                                            .idPregunta,
                                  )
                                  as T;
                        }
                        if (idModulo) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idModulo,
                                    referencedTable:
                                        $$PreguntaOpcionesTableReferences
                                            ._idModuloTable(db),
                                    referencedColumn:
                                        $$PreguntaOpcionesTableReferences
                                            ._idModuloTable(db)
                                            .idModulo,
                                  )
                                  as T;
                        }
                        if (idPaso) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idPaso,
                                    referencedTable:
                                        $$PreguntaOpcionesTableReferences
                                            ._idPasoTable(db),
                                    referencedColumn:
                                        $$PreguntaOpcionesTableReferences
                                            ._idPasoTable(db)
                                            .idPaso,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$PreguntaOpcionesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreguntaOpcionesTable,
      PreguntaOpcionData,
      $$PreguntaOpcionesTableFilterComposer,
      $$PreguntaOpcionesTableOrderingComposer,
      $$PreguntaOpcionesTableAnnotationComposer,
      $$PreguntaOpcionesTableCreateCompanionBuilder,
      $$PreguntaOpcionesTableUpdateCompanionBuilder,
      (PreguntaOpcionData, $$PreguntaOpcionesTableReferences),
      PreguntaOpcionData,
      PrefetchHooks Function({bool idPregunta, bool idModulo, bool idPaso})
    >;
typedef $$TeoriasTableCreateCompanionBuilder =
    TeoriasCompanion Function({
      Value<int> idTeoria,
      required int idModulo,
      required int idPaso,
      Value<int> pagina,
      required String escrito,
    });
typedef $$TeoriasTableUpdateCompanionBuilder =
    TeoriasCompanion Function({
      Value<int> idTeoria,
      Value<int> idModulo,
      Value<int> idPaso,
      Value<int> pagina,
      Value<String> escrito,
    });

final class $$TeoriasTableReferences
    extends BaseReferences<_$AppDatabase, $TeoriasTable, TeoriaData> {
  $$TeoriasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ModulosTable _idModuloTable(_$AppDatabase db) =>
      db.modulos.createAlias('teorias__id_modulo__modulos__id_modulo');

  $$ModulosTableProcessedTableManager get idModulo {
    final $_column = $_itemColumn<int>('id_modulo')!;

    final manager = $$ModulosTableTableManager(
      $_db,
      $_db.modulos,
    ).filter((f) => f.idModulo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idModuloTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PasosTable _idPasoTable(_$AppDatabase db) =>
      db.pasos.createAlias('teorias__id_paso__pasos__id_paso');

  $$PasosTableProcessedTableManager get idPaso {
    final $_column = $_itemColumn<int>('id_paso')!;

    final manager = $$PasosTableTableManager(
      $_db,
      $_db.pasos,
    ).filter((f) => f.idPaso.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPasoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TeoriasTableFilterComposer
    extends Composer<_$AppDatabase, $TeoriasTable> {
  $$TeoriasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idTeoria => $composableBuilder(
    column: $table.idTeoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pagina => $composableBuilder(
    column: $table.pagina,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get escrito => $composableBuilder(
    column: $table.escrito,
    builder: (column) => ColumnFilters(column),
  );

  $$ModulosTableFilterComposer get idModulo {
    final $$ModulosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableFilterComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableFilterComposer get idPaso {
    final $$PasosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableFilterComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeoriasTableOrderingComposer
    extends Composer<_$AppDatabase, $TeoriasTable> {
  $$TeoriasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idTeoria => $composableBuilder(
    column: $table.idTeoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pagina => $composableBuilder(
    column: $table.pagina,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get escrito => $composableBuilder(
    column: $table.escrito,
    builder: (column) => ColumnOrderings(column),
  );

  $$ModulosTableOrderingComposer get idModulo {
    final $$ModulosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableOrderingComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableOrderingComposer get idPaso {
    final $$PasosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableOrderingComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeoriasTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeoriasTable> {
  $$TeoriasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idTeoria =>
      $composableBuilder(column: $table.idTeoria, builder: (column) => column);

  GeneratedColumn<int> get pagina =>
      $composableBuilder(column: $table.pagina, builder: (column) => column);

  GeneratedColumn<String> get escrito =>
      $composableBuilder(column: $table.escrito, builder: (column) => column);

  $$ModulosTableAnnotationComposer get idModulo {
    final $$ModulosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableAnnotationComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableAnnotationComposer get idPaso {
    final $$PasosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableAnnotationComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeoriasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeoriasTable,
          TeoriaData,
          $$TeoriasTableFilterComposer,
          $$TeoriasTableOrderingComposer,
          $$TeoriasTableAnnotationComposer,
          $$TeoriasTableCreateCompanionBuilder,
          $$TeoriasTableUpdateCompanionBuilder,
          (TeoriaData, $$TeoriasTableReferences),
          TeoriaData,
          PrefetchHooks Function({bool idModulo, bool idPaso})
        > {
  $$TeoriasTableTableManager(_$AppDatabase db, $TeoriasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeoriasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeoriasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeoriasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idTeoria = const Value.absent(),
                Value<int> idModulo = const Value.absent(),
                Value<int> idPaso = const Value.absent(),
                Value<int> pagina = const Value.absent(),
                Value<String> escrito = const Value.absent(),
              }) => TeoriasCompanion(
                idTeoria: idTeoria,
                idModulo: idModulo,
                idPaso: idPaso,
                pagina: pagina,
                escrito: escrito,
              ),
          createCompanionCallback:
              ({
                Value<int> idTeoria = const Value.absent(),
                required int idModulo,
                required int idPaso,
                Value<int> pagina = const Value.absent(),
                required String escrito,
              }) => TeoriasCompanion.insert(
                idTeoria: idTeoria,
                idModulo: idModulo,
                idPaso: idPaso,
                pagina: pagina,
                escrito: escrito,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TeoriasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idModulo = false, idPaso = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idModulo) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idModulo,
                                referencedTable: $$TeoriasTableReferences
                                    ._idModuloTable(db),
                                referencedColumn: $$TeoriasTableReferences
                                    ._idModuloTable(db)
                                    .idModulo,
                              )
                              as T;
                    }
                    if (idPaso) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idPaso,
                                referencedTable: $$TeoriasTableReferences
                                    ._idPasoTable(db),
                                referencedColumn: $$TeoriasTableReferences
                                    ._idPasoTable(db)
                                    .idPaso,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TeoriasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeoriasTable,
      TeoriaData,
      $$TeoriasTableFilterComposer,
      $$TeoriasTableOrderingComposer,
      $$TeoriasTableAnnotationComposer,
      $$TeoriasTableCreateCompanionBuilder,
      $$TeoriasTableUpdateCompanionBuilder,
      (TeoriaData, $$TeoriasTableReferences),
      TeoriaData,
      PrefetchHooks Function({bool idModulo, bool idPaso})
    >;
typedef $$PuntajeCuestionarioTableCreateCompanionBuilder =
    PuntajeCuestionarioCompanion Function({
      Value<int> idPuntaje,
      required int idModulo,
      required int idPaso,
      Value<int> puntaje,
    });
typedef $$PuntajeCuestionarioTableUpdateCompanionBuilder =
    PuntajeCuestionarioCompanion Function({
      Value<int> idPuntaje,
      Value<int> idModulo,
      Value<int> idPaso,
      Value<int> puntaje,
    });

final class $$PuntajeCuestionarioTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PuntajeCuestionarioTable,
          PuntajeCuestionarioData
        > {
  $$PuntajeCuestionarioTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ModulosTable _idModuloTable(_$AppDatabase db) => db.modulos
      .createAlias('puntaje_cuestionario__id_modulo__modulos__id_modulo');

  $$ModulosTableProcessedTableManager get idModulo {
    final $_column = $_itemColumn<int>('id_modulo')!;

    final manager = $$ModulosTableTableManager(
      $_db,
      $_db.modulos,
    ).filter((f) => f.idModulo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idModuloTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PasosTable _idPasoTable(_$AppDatabase db) =>
      db.pasos.createAlias('puntaje_cuestionario__id_paso__pasos__id_paso');

  $$PasosTableProcessedTableManager get idPaso {
    final $_column = $_itemColumn<int>('id_paso')!;

    final manager = $$PasosTableTableManager(
      $_db,
      $_db.pasos,
    ).filter((f) => f.idPaso.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPasoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PuntajeCuestionarioTableFilterComposer
    extends Composer<_$AppDatabase, $PuntajeCuestionarioTable> {
  $$PuntajeCuestionarioTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPuntaje => $composableBuilder(
    column: $table.idPuntaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get puntaje => $composableBuilder(
    column: $table.puntaje,
    builder: (column) => ColumnFilters(column),
  );

  $$ModulosTableFilterComposer get idModulo {
    final $$ModulosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableFilterComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableFilterComposer get idPaso {
    final $$PasosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableFilterComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntajeCuestionarioTableOrderingComposer
    extends Composer<_$AppDatabase, $PuntajeCuestionarioTable> {
  $$PuntajeCuestionarioTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPuntaje => $composableBuilder(
    column: $table.idPuntaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get puntaje => $composableBuilder(
    column: $table.puntaje,
    builder: (column) => ColumnOrderings(column),
  );

  $$ModulosTableOrderingComposer get idModulo {
    final $$ModulosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableOrderingComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableOrderingComposer get idPaso {
    final $$PasosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableOrderingComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntajeCuestionarioTableAnnotationComposer
    extends Composer<_$AppDatabase, $PuntajeCuestionarioTable> {
  $$PuntajeCuestionarioTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPuntaje =>
      $composableBuilder(column: $table.idPuntaje, builder: (column) => column);

  GeneratedColumn<int> get puntaje =>
      $composableBuilder(column: $table.puntaje, builder: (column) => column);

  $$ModulosTableAnnotationComposer get idModulo {
    final $$ModulosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableAnnotationComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PasosTableAnnotationComposer get idPaso {
    final $$PasosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPaso,
      referencedTable: $db.pasos,
      getReferencedColumn: (t) => t.idPaso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PasosTableAnnotationComposer(
            $db: $db,
            $table: $db.pasos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntajeCuestionarioTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PuntajeCuestionarioTable,
          PuntajeCuestionarioData,
          $$PuntajeCuestionarioTableFilterComposer,
          $$PuntajeCuestionarioTableOrderingComposer,
          $$PuntajeCuestionarioTableAnnotationComposer,
          $$PuntajeCuestionarioTableCreateCompanionBuilder,
          $$PuntajeCuestionarioTableUpdateCompanionBuilder,
          (PuntajeCuestionarioData, $$PuntajeCuestionarioTableReferences),
          PuntajeCuestionarioData,
          PrefetchHooks Function({bool idModulo, bool idPaso})
        > {
  $$PuntajeCuestionarioTableTableManager(
    _$AppDatabase db,
    $PuntajeCuestionarioTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PuntajeCuestionarioTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PuntajeCuestionarioTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PuntajeCuestionarioTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> idPuntaje = const Value.absent(),
                Value<int> idModulo = const Value.absent(),
                Value<int> idPaso = const Value.absent(),
                Value<int> puntaje = const Value.absent(),
              }) => PuntajeCuestionarioCompanion(
                idPuntaje: idPuntaje,
                idModulo: idModulo,
                idPaso: idPaso,
                puntaje: puntaje,
              ),
          createCompanionCallback:
              ({
                Value<int> idPuntaje = const Value.absent(),
                required int idModulo,
                required int idPaso,
                Value<int> puntaje = const Value.absent(),
              }) => PuntajeCuestionarioCompanion.insert(
                idPuntaje: idPuntaje,
                idModulo: idModulo,
                idPaso: idPaso,
                puntaje: puntaje,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PuntajeCuestionarioTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idModulo = false, idPaso = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idModulo) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idModulo,
                                referencedTable:
                                    $$PuntajeCuestionarioTableReferences
                                        ._idModuloTable(db),
                                referencedColumn:
                                    $$PuntajeCuestionarioTableReferences
                                        ._idModuloTable(db)
                                        .idModulo,
                              )
                              as T;
                    }
                    if (idPaso) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idPaso,
                                referencedTable:
                                    $$PuntajeCuestionarioTableReferences
                                        ._idPasoTable(db),
                                referencedColumn:
                                    $$PuntajeCuestionarioTableReferences
                                        ._idPasoTable(db)
                                        .idPaso,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PuntajeCuestionarioTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PuntajeCuestionarioTable,
      PuntajeCuestionarioData,
      $$PuntajeCuestionarioTableFilterComposer,
      $$PuntajeCuestionarioTableOrderingComposer,
      $$PuntajeCuestionarioTableAnnotationComposer,
      $$PuntajeCuestionarioTableCreateCompanionBuilder,
      $$PuntajeCuestionarioTableUpdateCompanionBuilder,
      (PuntajeCuestionarioData, $$PuntajeCuestionarioTableReferences),
      PuntajeCuestionarioData,
      PrefetchHooks Function({bool idModulo, bool idPaso})
    >;
typedef $$PuntajeExamenTableCreateCompanionBuilder =
    PuntajeExamenCompanion Function({
      Value<int> idPuntajeExamen,
      required int idModulo,
      Value<int> puntaje,
    });
typedef $$PuntajeExamenTableUpdateCompanionBuilder =
    PuntajeExamenCompanion Function({
      Value<int> idPuntajeExamen,
      Value<int> idModulo,
      Value<int> puntaje,
    });

final class $$PuntajeExamenTableReferences
    extends
        BaseReferences<_$AppDatabase, $PuntajeExamenTable, PuntajeExamenData> {
  $$PuntajeExamenTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ModulosTable _idModuloTable(_$AppDatabase db) =>
      db.modulos.createAlias('puntaje_examen__id_modulo__modulos__id_modulo');

  $$ModulosTableProcessedTableManager get idModulo {
    final $_column = $_itemColumn<int>('id_modulo')!;

    final manager = $$ModulosTableTableManager(
      $_db,
      $_db.modulos,
    ).filter((f) => f.idModulo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idModuloTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PuntajeExamenTableFilterComposer
    extends Composer<_$AppDatabase, $PuntajeExamenTable> {
  $$PuntajeExamenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPuntajeExamen => $composableBuilder(
    column: $table.idPuntajeExamen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get puntaje => $composableBuilder(
    column: $table.puntaje,
    builder: (column) => ColumnFilters(column),
  );

  $$ModulosTableFilterComposer get idModulo {
    final $$ModulosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableFilterComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntajeExamenTableOrderingComposer
    extends Composer<_$AppDatabase, $PuntajeExamenTable> {
  $$PuntajeExamenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPuntajeExamen => $composableBuilder(
    column: $table.idPuntajeExamen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get puntaje => $composableBuilder(
    column: $table.puntaje,
    builder: (column) => ColumnOrderings(column),
  );

  $$ModulosTableOrderingComposer get idModulo {
    final $$ModulosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableOrderingComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntajeExamenTableAnnotationComposer
    extends Composer<_$AppDatabase, $PuntajeExamenTable> {
  $$PuntajeExamenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPuntajeExamen => $composableBuilder(
    column: $table.idPuntajeExamen,
    builder: (column) => column,
  );

  GeneratedColumn<int> get puntaje =>
      $composableBuilder(column: $table.puntaje, builder: (column) => column);

  $$ModulosTableAnnotationComposer get idModulo {
    final $$ModulosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idModulo,
      referencedTable: $db.modulos,
      getReferencedColumn: (t) => t.idModulo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModulosTableAnnotationComposer(
            $db: $db,
            $table: $db.modulos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntajeExamenTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PuntajeExamenTable,
          PuntajeExamenData,
          $$PuntajeExamenTableFilterComposer,
          $$PuntajeExamenTableOrderingComposer,
          $$PuntajeExamenTableAnnotationComposer,
          $$PuntajeExamenTableCreateCompanionBuilder,
          $$PuntajeExamenTableUpdateCompanionBuilder,
          (PuntajeExamenData, $$PuntajeExamenTableReferences),
          PuntajeExamenData,
          PrefetchHooks Function({bool idModulo})
        > {
  $$PuntajeExamenTableTableManager(_$AppDatabase db, $PuntajeExamenTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PuntajeExamenTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PuntajeExamenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PuntajeExamenTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPuntajeExamen = const Value.absent(),
                Value<int> idModulo = const Value.absent(),
                Value<int> puntaje = const Value.absent(),
              }) => PuntajeExamenCompanion(
                idPuntajeExamen: idPuntajeExamen,
                idModulo: idModulo,
                puntaje: puntaje,
              ),
          createCompanionCallback:
              ({
                Value<int> idPuntajeExamen = const Value.absent(),
                required int idModulo,
                Value<int> puntaje = const Value.absent(),
              }) => PuntajeExamenCompanion.insert(
                idPuntajeExamen: idPuntajeExamen,
                idModulo: idModulo,
                puntaje: puntaje,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PuntajeExamenTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idModulo = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idModulo) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idModulo,
                                referencedTable: $$PuntajeExamenTableReferences
                                    ._idModuloTable(db),
                                referencedColumn: $$PuntajeExamenTableReferences
                                    ._idModuloTable(db)
                                    .idModulo,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PuntajeExamenTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PuntajeExamenTable,
      PuntajeExamenData,
      $$PuntajeExamenTableFilterComposer,
      $$PuntajeExamenTableOrderingComposer,
      $$PuntajeExamenTableAnnotationComposer,
      $$PuntajeExamenTableCreateCompanionBuilder,
      $$PuntajeExamenTableUpdateCompanionBuilder,
      (PuntajeExamenData, $$PuntajeExamenTableReferences),
      PuntajeExamenData,
      PrefetchHooks Function({bool idModulo})
    >;
typedef $$GlosariosTableCreateCompanionBuilder =
    GlosariosCompanion Function({
      Value<int> idGlosario,
      required String termino,
      required String descripcion,
    });
typedef $$GlosariosTableUpdateCompanionBuilder =
    GlosariosCompanion Function({
      Value<int> idGlosario,
      Value<String> termino,
      Value<String> descripcion,
    });

class $$GlosariosTableFilterComposer
    extends Composer<_$AppDatabase, $GlosariosTable> {
  $$GlosariosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idGlosario => $composableBuilder(
    column: $table.idGlosario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get termino => $composableBuilder(
    column: $table.termino,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GlosariosTableOrderingComposer
    extends Composer<_$AppDatabase, $GlosariosTable> {
  $$GlosariosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idGlosario => $composableBuilder(
    column: $table.idGlosario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get termino => $composableBuilder(
    column: $table.termino,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GlosariosTableAnnotationComposer
    extends Composer<_$AppDatabase, $GlosariosTable> {
  $$GlosariosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idGlosario => $composableBuilder(
    column: $table.idGlosario,
    builder: (column) => column,
  );

  GeneratedColumn<String> get termino =>
      $composableBuilder(column: $table.termino, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );
}

class $$GlosariosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GlosariosTable,
          GlosarioData,
          $$GlosariosTableFilterComposer,
          $$GlosariosTableOrderingComposer,
          $$GlosariosTableAnnotationComposer,
          $$GlosariosTableCreateCompanionBuilder,
          $$GlosariosTableUpdateCompanionBuilder,
          (
            GlosarioData,
            BaseReferences<_$AppDatabase, $GlosariosTable, GlosarioData>,
          ),
          GlosarioData,
          PrefetchHooks Function()
        > {
  $$GlosariosTableTableManager(_$AppDatabase db, $GlosariosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GlosariosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GlosariosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GlosariosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idGlosario = const Value.absent(),
                Value<String> termino = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
              }) => GlosariosCompanion(
                idGlosario: idGlosario,
                termino: termino,
                descripcion: descripcion,
              ),
          createCompanionCallback:
              ({
                Value<int> idGlosario = const Value.absent(),
                required String termino,
                required String descripcion,
              }) => GlosariosCompanion.insert(
                idGlosario: idGlosario,
                termino: termino,
                descripcion: descripcion,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GlosariosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GlosariosTable,
      GlosarioData,
      $$GlosariosTableFilterComposer,
      $$GlosariosTableOrderingComposer,
      $$GlosariosTableAnnotationComposer,
      $$GlosariosTableCreateCompanionBuilder,
      $$GlosariosTableUpdateCompanionBuilder,
      (
        GlosarioData,
        BaseReferences<_$AppDatabase, $GlosariosTable, GlosarioData>,
      ),
      GlosarioData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ModulosTableTableManager get modulos =>
      $$ModulosTableTableManager(_db, _db.modulos);
  $$PasosTableTableManager get pasos =>
      $$PasosTableTableManager(_db, _db.pasos);
  $$PreguntasTableTableManager get preguntas =>
      $$PreguntasTableTableManager(_db, _db.preguntas);
  $$PreguntaOpcionesTableTableManager get preguntaOpciones =>
      $$PreguntaOpcionesTableTableManager(_db, _db.preguntaOpciones);
  $$TeoriasTableTableManager get teorias =>
      $$TeoriasTableTableManager(_db, _db.teorias);
  $$PuntajeCuestionarioTableTableManager get puntajeCuestionario =>
      $$PuntajeCuestionarioTableTableManager(_db, _db.puntajeCuestionario);
  $$PuntajeExamenTableTableManager get puntajeExamen =>
      $$PuntajeExamenTableTableManager(_db, _db.puntajeExamen);
  $$GlosariosTableTableManager get glosarios =>
      $$GlosariosTableTableManager(_db, _db.glosarios);
}
