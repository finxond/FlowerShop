import 'package:flutter/material.dart';

import 'product_screen.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Регистрация'),
        ),
        body: Stack(
            children: <Widget> [
              Align(
                  alignment: const Alignment(0.6, 0.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: const BorderSide(width: 3, color: Colors.black)
                            )
                        )
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Зарегистрироваться'),
                  )
                  ),
              Align(
                  alignment: const Alignment(-0.9, 0.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                        color: Colors.white54),
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    child:  TextFormField(decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.login),
                        labelText: 'Логин'
                    ),
                    ),
                    )

              ),
              Align(
                  alignment: const Alignment(-0.9, 0.2),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                        color: Colors.white54),
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    child:  TextFormField(decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.password),
                        labelText: 'Пароль'
                    ),
                    ),
                    )
              )
            ]
        )
    );
  }
}
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Stack(
          children: <Widget> [
            Align(
                alignment: const Alignment(0.6,0.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                  ),
                  onPressed: () {
                    Navigator.push(context,  
                     MaterialPageRoute(builder: (context) => const ProductScreen()
                     ),
                     );
                  },
                  child: const Text('Авторизоваться'),
                )
              ),
            Align(
                alignment: const Alignment(1.0,1.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                  ),
                  
              
                  onPressed: () {
                    
                    Navigator.push(context,  
                    MaterialPageRoute(builder: (context) => const SecondScreen()),);
                  },
                  child: const Text('Еще не зарегистрированы? Самое время исправить это!'),
                )
              ),
            Align(
                alignment: const Alignment(-0.9, 0.0),
                child: Container(

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                      color: Colors.white54),
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  child: TextFormField(decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      icon: Icon(Icons.accessible_forward_rounded),
                      labelText: 'Логин'
                  ),
                  ),
                  )
              ),
            Align(alignment: const Alignment(-0.9, 0.2),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                      color: Colors.white54),
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  child: TextFormField(decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  icon: Icon(Icons.adb_outlined),
                  labelText: 'Пароль'
              ),
            ),
          )
        )
       ]
      ),
    );
  }
}

  

