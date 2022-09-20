import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:use_case_flutter/use_case/code_gen/mobx/code_gen_view_model.dart';

class CodeMobxGenView extends StatefulWidget {
  const CodeMobxGenView({super.key});
  @override
  State<CodeMobxGenView> createState() => _CodeMobxGenViewState();
}

class _CodeMobxGenViewState extends State<CodeMobxGenView> {
  late final CodeGenViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = CodeGenViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [_CircularLoading(viewModel: _viewModel)],
      ),
    );
  }
}

class _CircularLoading extends StatelessWidget {
  const _CircularLoading({
    required CodeGenViewModel viewModel,
  }) : _viewModel = viewModel;

  final CodeGenViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _viewModel.isLoading ? const CircularProgressIndicator() : const Text('data');
      },
    );
  }
}
