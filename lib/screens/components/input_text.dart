import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late String textValue;

class InputText extends StatefulWidget {

  final String label;
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final bool isDigit;
  final bool isMultiLine;

  const InputText({
    required this.label,
    required this.hintText,
    required this.icon,
    Key? key,
    required this.controller,
    required this.isDigit,
    required this.isMultiLine,

  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  _InputTextState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Container(
          width: 320,
          padding: EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (text) {
              textValue = text;
            },
            controller: widget.controller,
            keyboardType: widget.isDigit ? TextInputType.number : TextInputType.text,
            maxLines: widget.isMultiLine ? 3 : 1,
            inputFormatters: widget.isDigit ? [FilteringTextInputFormatter.digitsOnly] : [] ,


            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              prefixIcon: widget.icon,
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              labelText: widget.label,
              hintText: widget.hintText,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
