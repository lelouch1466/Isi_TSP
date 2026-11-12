// Se importa con prefijo "bd" porque Drift tambien genera una clase "Teorias"
// (la tabla). Asi "Teorias" sin prefijo es la entidad y "bd.Teorias" la tabla.
import 'package:isi_tsp/data/database/app_database.dart' as bd;
import 'package:isi_tsp/domain/entities/teorias.dart';
import 'package:isi_tsp/domain/repositories/teoria_repositorio.dart';

// Implementacion del contrato usando Drift.
class TeoriaRepositorioImpl implements TeoriaRepositorio {
  final bd.AppDatabase _baseDatos;

  TeoriaRepositorioImpl(this._baseDatos);

  @override
  Future<List<Teorias>> obtenerTeoriasPorModuloYPaso(
    int moduloId,
    int pasoId,
  ) async {
    final List<bd.TeoriaData> filas = await _baseDatos
        .obtenerTeoriasPorModuloYPaso(moduloId, pasoId);
    return _aEntidades(filas);
  }

  @override
  Future<List<String>> obtenerTextosPorModuloYPaso(
    int moduloId,
    int pasoId,
  ) async {
    final List<Teorias> lista = await obtenerTeoriasPorModuloYPaso(
      moduloId,
      pasoId,
    );
    //cada registro se convierte en su texto, conservando el orden de pagina
    return lista.map((teoria) => teoria.escrito).toList();
  }

  // Convierte las filas de Drift (TeoriaData) en entidades (Teorias)
  List<Teorias> _aEntidades(List<bd.TeoriaData> filas) {
    return filas
        .map(
          (fila) => Teorias(
            teoriaId: fila.idTeoria,
            moduloId: fila.idModulo,
            pasoId: fila.idPaso,
            pagina: fila.pagina,
            escrito: fila.escrito,
          ),
        )
        .toList();
  }
}