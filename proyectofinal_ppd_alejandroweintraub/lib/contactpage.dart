import 'package:flutter/material.dart';
import 'package:proyectofinal_ppd_alejandroweintraub/extensiones.dart';
import 'main.dart';

extension MoreContactPage on PrincipalViewState {
  goToContactPage(
    String playerName,
  ) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ContactPage(),
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, 1.0),
                  end: Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              );
            },
            settings: RouteSettings(arguments: [playerName])));
  }
}

class ContactPage extends StatelessWidget {
  Widget build(BuildContext context) {
    List<dynamic> playerName =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[900],
            title: Row(children: [
              Text(playerName[0]),
            ])),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return PortraitContactForm(context);
          } else {
            return LandscapeContactForm(context);
          }
        }));
  }
}

Widget PortraitContactForm(BuildContext context) {
  final nombreController = TextEditingController();
  final jugadorController = TextEditingController();
  final edadController = TextEditingController();
  final telefonoController = TextEditingController();
  final fechaController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    jugadorController.dispose();
    edadController.dispose();
    telefonoController.dispose();
    fechaController.dispose();
  }

  return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_box),
                  labelText: 'Nombre Completo',
                ),
                keyboardType: TextInputType.text,
                controller: nombreController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.workspace_premium),
                  labelText: 'Quien del top 10 de Sacks es tu favorito?',
                ),
                keyboardType: TextInputType.text,
                controller: jugadorController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_box),
                  labelText: 'Edad',
                ),
                keyboardType: TextInputType.number,
                controller: edadController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_box),
                  labelText: 'Numero de telefono',
                ),
                keyboardType: TextInputType.phone,
                controller: telefonoController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_box),
                  labelText: 'Fecha de Hoy',
                ),
                keyboardType: TextInputType.datetime,
                controller: fechaController,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Informacion de la cuenta'),
                          content: Column(
                            children: [
                              Text('Nombre: ${nombreController.text}'),
                              Text(
                                  'Jugador Favorito: ${jugadorController.text}'),
                              Text('Edad: ${edadController.text}'),
                              Text('Teléfono: ${telefonoController.text}'),
                              Text('Fecha de hoy: ${fechaController.text}'),
                            ],
                          ),
                        );
                      });
                },
                child: Text('Enviar'),
              )
            ],
          )));
}

Widget LandscapeContactForm(BuildContext context) {
  final nombreController = TextEditingController();
  final jugadorController = TextEditingController();
  final edadController = TextEditingController();
  final telefonoController = TextEditingController();
  final fechaController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    jugadorController.dispose();
    edadController.dispose();
    telefonoController.dispose();
    fechaController.dispose();
  }

  return SingleChildScrollView(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_box),
                labelText: 'Nombre Completo',
              ),
              keyboardType: TextInputType.text,
              controller: nombreController,
            ),
          ),
          SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.workspace_premium),
                  labelText: 'Quien del top 10 de Sacks es tu favorito?',
                ),
                keyboardType: TextInputType.text,
                controller: jugadorController,
              ))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_box),
                  labelText: 'Edad',
                ),
                keyboardType: TextInputType.number,
                controller: edadController,
              )),
          SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_box),
                  labelText: 'Numero de telefono',
                ),
                keyboardType: TextInputType.phone,
                controller: telefonoController,
              ))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 50,
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_box),
                labelText: 'Fecha de Hoy',
              ),
              keyboardType: TextInputType.datetime,
              controller: fechaController,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Informacion de la cuenta'),
                      content: Column(
                        children: [
                          Text('Nombre: ${nombreController.text}'),
                          Text('Jugador Favorito: ${jugadorController.text}'),
                          Text('Edad: ${edadController.text}'),
                          Text('Teléfono: ${telefonoController.text}'),
                          Text('Fecha de hoy: ${fechaController.text}'),
                        ],
                      ),
                    );
                  });
            },
            child: Text('Enviar'),
          )
        ],
      )
    ],
  ));
}
