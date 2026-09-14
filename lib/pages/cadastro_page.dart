import 'package:flutter/material.dart';
import '../db/user_dao.dart';
import '../api/endereco_api.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final enderecoController = TextEditingController();
  final cepController = TextEditingController();

  Future<void> buscarCep() async {
    try {
      final endereco = await EnderecoApi().buscarEndereco(
        cepController.text,
      );

      setState(() {
        enderecoController.text =
        '${endereco.logradouro}, ${endereco.bairro}, '
            '${endereco.localidade} - ${endereco.uf}';
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro: $e'),
        ),
      );
    }
  }

  Future<void> cadastrar() async {
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    String endereco = enderecoController.text;

    await UserDao().cadastrarUsuario(
      nome,
      email,
      senha,
      endereco,
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    enderecoController.dispose();
    cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color(0xFFD8B4E2),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/topo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/rodape.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Criar conta',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),

                      const SizedBox(height: 25),

                      TextField(
                        controller: nomeController,
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: senhaController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: cepController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'CEP',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      ElevatedButton(
                        onPressed: buscarCep,
                        child: const Text('Buscar endereço'),
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: enderecoController,
                        decoration: const InputDecoration(
                          hintText: 'Endereço',
                          filled: true,
                          fillColor: Colors.white,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
