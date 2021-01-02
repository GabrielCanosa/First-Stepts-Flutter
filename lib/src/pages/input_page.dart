import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  TextEditingController inputFieldDateController = new TextEditingController();
  List<String> _colores = [
    'negro',
    'rojo',
    'azul',
    'verde',
    'naranja',
    'amarillo',
    'violeta'
  ];
  String _opcionSeleccionada = 'negro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Caracteres ${_nombre.length}'),
          hintText: 'Nombre de la personsa',
          labelText: 'Texto',
          helperText: 'Sòlo es el nombre',
          suffixIcon: Icon(Icons.qr_code),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {});
        _nombre = valor;
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es : $_nombre'),
      subtitle: Text('Email es : $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email de la personsa',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {});
        _email = valor;
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.security),
          icon: Icon(Icons.paste_sharp)),
      onChanged: (valor) {
        setState(() {});
        _password = valor;
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today_sharp),
          icon: Icon(Icons.calendar_view_day_sharp)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2000),
        lastDate: new DateTime(2030),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> _getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _colores.forEach((color) {
      lista.add(DropdownMenuItem(
        child: Text(color),
        value: color,
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return DropdownButton(
        value: _opcionSeleccionada,
        items: _getOpcionesDropdown(),
        onChanged: (opt) {
          setState(() {
            _opcionSeleccionada = opt;
          });
        });
  }
}
