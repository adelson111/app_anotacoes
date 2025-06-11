import 'package:app_anotacoes/config/localization_config.dart';
import 'package:app_anotacoes/model/anotacao.dart';
import 'package:app_anotacoes/model/categoria.dart';
import 'package:app_anotacoes/repository/anotacao_repository.dart';
import 'package:app_anotacoes/screen/component/menu_categoria.dart';
import 'package:app_anotacoes/screen/gerenciar_categoria.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarAnotacao extends StatefulWidget {
  const EditarAnotacao({super.key, required this.anotacao});

  final Anotacao anotacao;

  @override
  State<EditarAnotacao> createState() => _EditarAnotacaoState();
}

class _EditarAnotacaoState extends State<EditarAnotacao> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _descricaoController = TextEditingController();

  Categoria? _categoriaSelecionada;

  @override
  void initState() {
    super.initState();
    _tituloController.text = widget.anotacao.titulo;
    _descricaoController.text = widget.anotacao.descricao;
    _categoriaSelecionada = widget.anotacao.categoria;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.category_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GerenciarCategoria()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MenuCategoria(
                selected: _categoriaSelecionada,
                onChanged: (categoria) {
                  setState(() => _categoriaSelecionada = categoria);
                },
              ),
              TextFormField(
                controller: _tituloController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hint: Text(generateLanguage(context).titulo),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return generateLanguage(context).informarTitulo;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hint: Text(generateLanguage(context).descricao),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return generateLanguage(context).informarDescricao;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check_rounded),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<AnotacaoRepository>().edit(
              Anotacao(
                widget.anotacao.id,
                _tituloController.text,
                _descricaoController.text,
                _categoriaSelecionada!,
              ),
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
