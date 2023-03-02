import 'package:flutter/material.dart';

class SelectMenuWidget extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String?> onChanged;

  const SelectMenuWidget({
    Key? key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption,
      onChanged: this.onChanged,
      items: options.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val),
        );
      }).toList(),
    );
  }
}

/*
class SelectMenuWidget extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onChanged;

  const SelectMenuWidget({
    Key? key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption,
      onChanged: onChanged,
      items: options
          .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
          .toList(),
    );
  }
}*/
