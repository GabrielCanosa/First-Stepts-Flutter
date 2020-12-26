import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  final nombreApellido = 'Juan Perez';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page')),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
            child: Text('Mostrar Alerta - normal'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlerta(context),
          ),
          RaisedButton(
            child: Text('Mostrar Alerta - error'),
            color: Colors.red,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlertaError(context),
          ),
          RaisedButton(
            child: Text('Mostrar Alerta - warning'),
            color: Colors.yellow,
            textColor: Colors.black,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlertaWarning(context),
          ),
          RaisedButton(
            child: Text('Mostrar Alerta - Exito'),
            color: Colors.green,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlertaExito(context),
          ),
          RaisedButton(
            child: Text('Mostrar Alerta - muy largo'),
            color: Colors.orange,
            textColor: Colors.black,
            onPressed: () => _mostrarAlertaMuyLargo(context),
          ),
          RaisedButton(
            child: Text('Mostrar Alerta - recibe dato'),
            color: Colors.pink,
            textColor: Colors.black,
            onPressed: () => _mostrarAlertaRecibeDato(context, nombreApellido),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restaurant),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titulo Dialog'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ok')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
            ],
          );
        });
  }

  _mostrarAlertaWarning(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Mensaje Warning'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning),
                Text('Este es un mensaje de warning'),
                Text(
                    'Tenga cuidado con la accion que va a tomar a continuacion')
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Si, deseo continuar'),
                color: Colors.green,
                textColor: Colors.black,
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
                color: Colors.red,
                textColor: Colors.black,
              )
            ],
          );
        });
  }

  _mostrarAlertaError(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error),
                Text('¡Error!'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text('Se ha producido un error crítico')],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Aceptar'),
                color: Colors.red,
              ),
            ],
          );
        });
  }

  _mostrarAlertaExito(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('La operacion se ha realizado con exito'),
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Row(
                    children: [Text(' Aceptar '), Icon(Icons.check_circle)],
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ],
          );
        });
  }

  _mostrarAlertaMuyLargo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Terminos y Condiciones'),
              content: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a finibus leo, dapibus porttitor turpis. Duis viverra diam fermentum placerat mattis. Aliquam ut erat justo. Praesent id pretium elit. Phasellus consequat egestas laoreet. Ut aliquam neque eu arcu eleifend sollicitudin. Nunc accumsan at justo eu porttitor. Sed sit amet lobortis mauris. Donec euismod mollis dolor eu consequat. Duis finibus diam ut nibh mollis, vel dictum velit finibus. Pellentesque ultrices turpis viverra dolor ornare condimentum.'),
                      Text(
                          'Mauris finibus tellus nulla, quis eleifend velit laoreet vel. Donec neque sem, fringilla sit amet facilisis id, pharetra nec neque. Phasellus ut blandit sapien, vitae venenatis nulla. Nam consectetur vitae nunc vitae eleifend. Sed imperdiet commodo lectus, quis auctor risus porttitor egestas. Vestibulum nec semper nibh. Aliquam ornare tristique ante, sed mollis libero eleifend egestas. Aliquam accumsan ipsum at nisi interdum commodo. Maecenas at enim at metus laoreet hendrerit. Pellentesque viverra condimentum sapien, non sodales quam molestie eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer volutpat dapibus ante vel iaculis. Donec mauris justo, condimentum in velit et, aliquet condimentum mauris.'),
                      Text(
                          'Vivamus feugiat arcu in mi imperdiet, posuere eleifend ipsum fringilla. Sed vitae quam eget tortor mollis placerat. Sed et ante semper, blandit leo vel, iaculis est. Mauris purus arcu, pulvinar eu interdum quis, ullamcorper in nunc. Suspendisse a magna volutpat, lobortis velit vel, vulputate diam. Donec volutpat mi sapien. Nunc et sollicitudin risus, non iaculis nibh. Integer eget sem sit amet dolor faucibus tempus. Fusce mattis metus justo, vitae ultrices neque pharetra quis. Cras aliquet ornare nunc ut facilisis.'),
                      Text(
                          'Donec vulputate suscipit mauris, ut auctor urna tempor et. Vestibulum lacinia ipsum in augue placerat, dapibus interdum velit volutpat. In vulputate magna sagittis fermentum condimentum. Donec rutrum, nisi nec vestibulum suscipit, est risus tristique nisl, eget suscipit tellus urna sit amet nulla. Cras ultricies at quam nec condimentum. Curabitur eget est nec eros mollis dignissim sed sed tellus. Aenean laoreet id dolor accumsan lobortis. Nam a purus et dui vulputate tempor eget quis mi. Suspendisse laoreet est eu mi accumsan rutrum. Ut vehicula dignissim metus, eu bibendum est vulputate in. Integer pulvinar arcu maximus nisi tempus, vehicula mollis turpis aliquet.'),
                      Text(
                          'Donec risus metus, vestibulum et dui vitae, eleifend tincidunt purus. Morbi consectetur porta neque et venenatis. Fusce tempor mauris ac risus vulputate, ac scelerisque neque laoreet. Etiam eros eros, rutrum sit amet neque quis, tempus auctor mauris. Quisque vel dui luctus, efficitur metus a, iaculis nibh. Suspendisse potenti. In facilisis hendrerit dapibus. Sed nunc nisi, iaculis quis placerat vitae, interdum ac ipsum. Nam sit amet sapien sed arcu auctor ornare. Morbi leo erat, bibendum eu leo ut, volutpat laoreet orci. Aliquam mattis erat et est hendrerit luctus.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Acepto'),
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Cancelar'),
                            color: Colors.white,
                            textColor: Colors.red,
                            hoverColor: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  _mostrarAlertaRecibeDato(BuildContext context, String nombreApellido) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Alert recibe dato')],
            ),
            content: Text(
                'Bienvenido $nombreApellido, nos alegra verlo de nuevo por aqui'),
          );
        });
  }
}
