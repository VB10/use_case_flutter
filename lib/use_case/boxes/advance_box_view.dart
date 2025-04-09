import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/boxes/widgets/custom_box_deoration.dart';
import 'package:use_case_flutter/use_case/boxes/widgets/custom_sized_box.dart';

class AdvanceBoxView extends StatefulWidget {
  const AdvanceBoxView({super.key});

  @override
  State<AdvanceBoxView> createState() => _AdvanceBoxViewState();
}

class _AdvanceBoxViewState extends State<AdvanceBoxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          DecoratedBox(
            decoration: const CustomBoxDecoration.main(),
            child: Text(
              'Advnace Box View',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox.shrink(),
          const EmptySizedBoxHeight.large(),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 100,
              maxHeight: 100,
            ),
            child: ColoredBox(
              color: Colors.green,
              child: Text(
                'Hello',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 200,
            width: 500,
            child: ColoredBox(
              color: Colors.red,
              child: FractionallySizedBox(
                widthFactor: .4,
                heightFactor: .2,
                alignment: Alignment.topCenter,
                child: ColoredBox(
                  color: Colors.blue,
                  child: FlutterLogo(),
                ),
              ),
            ),
          ),
          LimitedBox(
            maxHeight: 20,
            maxWidth: 10,
            child: ColoredBox(
              color: Colors.green,
              child: Text(
                'Hello' * 50,
                maxLines: 5,
              ),
            ),
          ),
          UnconstrainedBox(
            child: SizedBox(
              height: 50,
              width: 100,
              child: ColoredBox(
                color: Colors.red,
                child: Text(
                  'Hello' * 50,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverFlow extends StatelessWidget {
  const _OverFlow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            'Advance Box View' * 4,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Ali' * 10, style: Theme.of(context).textTheme.labelSmall),
            SizedBox(
              height: 10,
              width: MediaQuery.of(context).size.width,
              child: OverflowBox(
                minWidth: MediaQuery.of(context).size.width,
                maxWidth: MediaQuery.of(context).size.width,
                child: const ColoredBox(
                  color: Colors.red,
                ),
              ),
            ),
            Text('Ali' * 10, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
