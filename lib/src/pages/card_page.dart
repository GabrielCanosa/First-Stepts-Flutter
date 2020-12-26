import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          _cardTipo3()
        ],
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Esto es el titulo de la tarjeta'),
            subtitle: Text(
                'Esto es un subtitulo largo para que se pueda ver que tan largo puede llegar a se elsubtitulo de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://images.ferryhopper.com/locations/Valencia.jpg'),
            // fadeInDuration: Duration(seconds: 2),
            height: 250.0,
            fit: BoxFit.cover,
          )

          // Image(
          //     image: NetworkImage(
          //         'https://images.ferryhopper.com/locations/Valencia.jpg'))
          ,
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("l'oeanografic y Museo de las Artes y las Ciencias"),
          )
        ],
      ),
    );
  }

  _cardTipo3() {
    return Card(
      // elevation: 20.0,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.access_alarms,
              color: Colors.red,
            ),
            title: Text('Tituo de la tarjeta'),
            subtitle: Text('Subtitulo de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }
}
