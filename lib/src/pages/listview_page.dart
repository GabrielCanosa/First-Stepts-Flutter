import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> numeros = new List();
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarDiezImagenes();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregarDiezImagenes();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            final imagen = numeros[index];
            return FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300?random=$imagen'));
          },
          itemCount: numeros.length,
        ),
        onRefresh: obtenerPaginaUno);
  }

  Future<void> obtenerPaginaUno() async {
    final _duration = new Duration(seconds: 2);
    new Timer(_duration, () {
      numeros.clear();
      _ultimoNumero++;
      _agregarDiezImagenes();
    });

    return Future.delayed(_duration);
  }

  void _agregarDiezImagenes() {
    for (var i = 1; i < 10; i++) {
      _ultimoNumero++;
      numeros.add(_ultimoNumero);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final _duration = new Duration(seconds: 2);
    new Timer(_duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: new Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _agregarDiezImagenes();
  }

  Widget _crearLoading() {
    if (_isLoading)
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          )
        ],
      );
    else
      return Container();
  }
}
