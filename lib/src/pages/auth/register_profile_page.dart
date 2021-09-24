import 'package:flutter/material.dart';
import 'package:homehealth/src/widgets/background.dart';

class RegisterProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: TextField(
                onChanged: (value) => {},
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person_outline_sharp, color: Colors.black12),
                  hintText: "Nombre",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: TextField(
                onChanged: (value) => {},
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person_outline_sharp, color: Colors.black12),
                  hintText: "Apellido",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: TextField(
                onChanged: (value) => {},
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.credit_card, color: Colors.black12),
                  hintText: "Número de Identificación",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(29)),
              child: TextField(
                onChanged: (value) => {},
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone, color: Colors.black12),
                  hintText: "Número de Telefono",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(29)),
                child: TextField(
                  onChanged: (value) => {},
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today, color: Colors.black12),
                    hintText: "Fecha de Nacimiento",
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectDate(context);
                  },
                )),
            ElevatedButton(
                onPressed: (){},
                child: Container(
                  child: Text(
                    'Guardar',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 19, horizontal: 100),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29)),
                    elevation: 0.0,
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white))
          ],
        )),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      // setState(() {
      //   _inputFieldDateController.text = picked.toString();
      // });
    }
  }
}
