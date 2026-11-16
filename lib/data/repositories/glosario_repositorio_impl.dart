// Se importa con prefijo "bd" porque Drift tambien genera una clase "Glosarios"
// (la tabla). Asi "Glosarios" sin prefijo es la entidad y "bd.Glosarios" la tabla.
import 'package:isi_tsp/data/database/app_database.dart' as bd;
import 'package:isi_tsp/domain/entities/glosarios.dart';
import 'package:isi_tsp/domain/repositories/glosario_repositorio.dart';

// Implementacion del contrato usando Drift.
class GlosarioRepositorioImpl implements GlosarioRepositorio {
  final bd.AppDatabase _baseDatos;

  GlosarioRepositorioImpl(this._baseDatos);

  @override
  Future<List<Glosarios>> obtenerGlosario() async {
    final List<bd.GlosarioData> filas = await _baseDatos.obtenerGlosario();
    return _aEntidades(filas);
  }

  // Convierte las filas de Drift (GlosarioData) en entidades (Glosarios)
  List<Glosarios> _aEntidades(List<bd.GlosarioData> filas) {
    return filas
        .map(
          (fila) => Glosarios(
            glosarioId: fila.idGlosario,
            termino: fila.termino,
            descripcion: fila.descripcion,
          ),
        )
        .toList();
  }
}