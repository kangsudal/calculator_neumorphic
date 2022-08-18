import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import 'package:calculator/provider/pageData.dart';

class ModeChangeWidget extends StatefulWidget {
  const ModeChangeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ModeChangeWidget> createState() => _ModeChangeWidgetState();
}

class _ModeChangeWidgetState extends State<ModeChangeWidget> {
  @override
  Widget build(BuildContext context) {
    int? groupValue = Provider.of<PageData>(context).pageIndex;
    return Row(
      children: [
        NeumorphicRadio(
          groupValue:
              groupValue, //The groupValue is the currently selected value for a group of radio buttons.
          value: 0,
          onChanged: (int? value) {
            if(value != null) {
              Provider.of<PageData>(context, listen: false)
                  .setPageIndex(value);
            }else{}
          },
          padding: EdgeInsets.all(8.0),
          child: Text("Calculator"),
        ),
        SizedBox(
          width: 10,
        ),
        NeumorphicRadio(
          groupValue: groupValue,
          value: 1,
          onChanged: (int? value) {
            if(value != null){
              Provider.of<PageData>(context, listen: false)
                  .setPageIndex(value);
            }else{}
          },
          padding: EdgeInsets.all(8.0),
          child: Text("Currency"),
        ),
      ],
    );
  }
}
