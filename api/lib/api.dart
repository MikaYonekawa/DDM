// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {

  int userId = 0;
  int taskId =  0;
  String title ='';
  bool completed = false;

Future<void>obterTarefa()async{
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/19');
  final response = await http.get(url);

  if(response.statusCode==200){

    final data = response.body;
    // a gnt precisa pegar oq veio no corpo da resposta e transformar em json
    //variavel tarefa tem os dados em json

    Map<String, dynamic> tarefa =jsonDecode(data);
    print(tarefa);
    userId = (tarefa['userId']);
    taskId = (tarefa['id']);
    title = (tarefa['title']);
    completed = (tarefa['completed']);
    setState(() {
      
    });

  }else {
    print('Erro: ${response.statusCode}');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API'),
      backgroundColor: Colors.deepPurple),
      body: Center(child: Column(children: [
        ElevatedButton(onPressed: (){
          obterTarefa();
        }, child: Text('Buscar')),
        Text('ID usuário: $userId'),
        Text('ID tarefa: $taskId'),
        Text('Título: $title'),
        Text('Status: $completed'),
      ],),),
    );
  }
}