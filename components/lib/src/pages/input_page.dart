import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '', _email = '', _date = '';
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  String _optionSelected = 'Volar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createDate(context),
            Divider(),
            _createPerson(),
            Divider(),
            _createDropdown()
          ],
        ));
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() => _name = value);
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() => _email = value);
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Clave',
        labelText: 'Clave',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {},
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_optionSelected),
    );
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _optionSelected,
            items: getOptionsDropdown(),
            onChanged: (option) {
              setState(() {
                _optionSelected = option;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];
    _poderes.forEach((poder) {
      list.add(DropdownMenuItem(child: Text(poder), value: poder));
    });

    return list;
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2023),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }
}
