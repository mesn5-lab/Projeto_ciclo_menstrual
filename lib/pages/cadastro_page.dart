import 'package:flutter/material.dart';
import '../db/user_dao.dart';

class CadastroPage extends StatefulWidget{
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void dispose(){
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Nome',
              ),
            ),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'E-mail',
              ),
            ),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Senha',
              ),
            ),

        const SizedBox(height: 24),

        ElevatedButton(
          onPressed: cadastrar,
          child: const Text('Cadastrar'),
         ),
        ],
       ),
      ),
     );
   }
   Future<void> cadastrar() async{
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    await UserDao().cadastrarUsuario(nome, email, senha);

    Navigator.pop(context);
   }
 }