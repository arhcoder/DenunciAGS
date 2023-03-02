import 'package:flutter/material.dart';

class SelectMenuWidget extends StatefulWidget {
  final String hinttext;
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String?> onChanged;
  final bool obligatory;
  
  const SelectMenuWidget({
    Key? key,
    required this.hinttext,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.obligatory,
  }) : super(key: key);
  
  @override
  _SelectMenuWidgetState createState() => _SelectMenuWidgetState();
}

class _SelectMenuWidgetState extends State<SelectMenuWidget> {
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hinttext,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8,),
        DropdownButton<String>(
          value: widget.selectedOption,
          icon: Icon(Icons.arrow_drop_down_circle_outlined),
          items: widget.options.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(), 
          onChanged: ((String? value) {
            if(widget.obligatory && value == null) {
              setState(() {
              _errorText = null;                
              });
            }
            else {
              setState(() {
              _errorText = null;                
              });
            }
              widget.onChanged(value);
          }),
        ),
        Container(
          height: _errorText == null ? 0 : 0,
          child: Text(
            _errorText ?? '',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }

}

/*
class SelectMenuWidget extends StatefulWidget {
  final String hinttext;
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String?> onChanged;
  final bool obligatory;

  const SelectMenuWidget({
    Key? key,
    required this.hinttext,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.obligatory,
  }) : super(key: key);

  @override
  _SelectMenuWidgetState createState() => _SelectMenuWidgetState();
}

class _SelectMenuWidgetState extends State<SelectMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hinttext,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        DropdownButton<String>(
          value: widget.selectedOption,
          onChanged: widget.onChanged,
          items: widget.options.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
        ),
      ],
    );
  }
}*/