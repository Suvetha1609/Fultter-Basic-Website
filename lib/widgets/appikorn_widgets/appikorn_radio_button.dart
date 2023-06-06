import '../../export.dart';

class appikorn_radio_button extends StatefulWidget {
  appikorn_radio_button({Key? key, required this.onchange, required this.lst}) : super(key: key);

  final Function(String) onchange;
  final List<String> lst;

  @override
  State<appikorn_radio_button> createState() => _appikorn_radio_buttonState();
}

class _appikorn_radio_buttonState extends State<appikorn_radio_button> {
  String _selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var k in widget.lst)
          Row(
            children: [
              Radio(
                value: k,
                groupValue: _selectedOption,
                onChanged: (value) {
                  widget.onchange(value.toString());
                  setState(() {
                    _selectedOption = value.toString();
                  });
                },
              ),
              Transform.translate(
                  offset: Offset(-10, 0),
                  child: appikorn_text(
                    text: k,
                    size: f1,
                  )),
            ],
          ),
      ],
    );
  }
}
