import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isi_tsp/domain/entities/glosarios.dart';
import 'package:isi_tsp/domain/repositories/glosario_repositorio.dart';
import 'package:isi_tsp/presentation/components/barra_app.dart';
import 'package:isi_tsp/presentation/components/termino_box.dart';

class GlosarioScreen extends StatefulWidget {
  const GlosarioScreen({super.key});

  @override
  State<GlosarioScreen> createState() => _GlosarioScreenState();
}

class _GlosarioScreenState extends State<GlosarioScreen> {
  //terminos del glosario; se piden una sola vez al entrar
  late final Future<List<Glosarios>> glosario_bd;

  //lo que el usuario escribio en el buscador
  String busqueda = "";

  @override
  void initState() {
    super.initState();
    glosario_bd = GetIt.instance<GlosarioRepositorio>().obtenerGlosario();
  }

  //pasa a minusculas y quita acentos, para que "metodologia"
  //encuentre "Metodología"
  String normalizar(String texto) {
    const conAcento = 'áéíóúüñ';
    const sinAcento = 'aeiouun';
    final StringBuffer resultado = StringBuffer();
    for (final letra in texto.toLowerCase().split('')) {
      final int posicion = conAcento.indexOf(letra);
      resultado.write(posicion == -1 ? letra : sinAcento[posicion]);
    }
    return resultado.toString();
  }

  //deja solo los terminos donde alguna palabra buscada aparece
  //en cualquier parte del termino o de su descripcion
  List<Glosarios> filtrar(List<Glosarios> terminos) {
    final List<String> palabras = normalizar(
      busqueda,
    ).split(' ').where((p) => p.isNotEmpty).toList();

    //sin texto en el buscador se muestran todos
    if (palabras.isEmpty) return terminos;

    return terminos.where((t) {
      final String texto = normalizar("${t.termino} ${t.descripcion}");
      return palabras.any((palabra) => texto.contains(palabra));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraApp.barrita("Glosario"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Escribe palabra(s) clave",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                //se redibuja la lista con el nuevo filtro
                setState(() {
                  busqueda = text;
                });
              },
            ),
          ),

          //lista de terminos: Expanded ocupa el espacio que queda debajo
          //del TextField, y dentro de ese espacio la lista hace scroll
          Expanded(
            child: FutureBuilder<List<Glosarios>>(
              future: glosario_bd,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error al cargar glosario: ${snapshot.error}"),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.data!.isEmpty) {
                  return const Center(child: Text("El glosario esta vacio"));
                }

                //solo los que coinciden con la busqueda
                final List<Glosarios> terminos = filtrar(snapshot.data!);

                if (terminos.isEmpty) {
                  return const Center(child: Text("Sin coincidencias"));
                }

                //ListView.builder solo construye los elementos visibles
                return Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: terminos.length,
                    itemBuilder: (context, index) {
                      final Glosarios termino = terminos[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            termino.termino,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          //maximo 2 renglones; si no cabe termina en ...
                          subtitle: Text(
                            termino.descripcion,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          //al tocar el termino se abre en grande
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => TerminoBox(
                                termino: termino.termino,
                                descripcion: termino.descripcion,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
