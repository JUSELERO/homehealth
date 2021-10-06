import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    getAllContacts();
  }

  getAllContacts() async {
    List<Contact> _contacts =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      contacts = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text('probando probando'),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = contacts[index];
                      return ListTile(
                        title: Text(contact.displayName),
                        subtitle: Text(contact.phones.elementAt(0).value),
                      );
                    })
              ],
            )));
  }
}
