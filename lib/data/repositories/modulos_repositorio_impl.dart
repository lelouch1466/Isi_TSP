// Se importa con prefijo "bd" porque Drift tambien genera una clase "Modulos"
// (la tabla). Asi "Modulos" sin prefijo es la entidad y "bd.Modulos" la tabla.
import 'package:isi_tsp/data/database/app_database.dart' as bd;
import 'package:isi_tsp/domain/entities/modulos.dart';
import 'package:isi_tsp/domain/repositories/modulos_repositorio.dart';

// Implementacion del contrato usando Drift.
class ModulosRepositorioImpl implements ModulosRepositorio {
  final bd.AppDatabase _baseDatos;

  ModulosRepositorioImpl(this._baseDatos);

  @override
  Future<List<Modulos>> obtenerModulos() async {
    final List<bd.ModuloData> filas = await _baseDatos.obtenerModulos();
    return _aEntidades(filas);
  }

  @override
  Stream<List<Modulos>> observarModulos() {
    // cada vez que Drift emite filas nuevas, se convierten a entidades
    return _baseDatos.observarModulos().map(_aEntidades);
  }

  @override
  Future<void> desbloquearModulo(int moduloId) {
    return _baseDatos.desbloquearModulo(moduloId);
  }

  // Convierte las filas de Drift (ModuloData) en entidades del dominio (Modulos)
  List<Modulos> _aEntidades(List<bd.ModuloData> filas) {
    return filas
        .map(
          (fila) => Modulos(
            moduloId: fila.idModulo,
            nombre: fila.nombre,
            bloqueado: fila.bloqueado,
          ),
        )
        .toList();
  }
}
