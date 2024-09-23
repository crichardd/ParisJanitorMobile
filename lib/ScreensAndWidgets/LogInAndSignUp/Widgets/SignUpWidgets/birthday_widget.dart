import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:paris_janitor/Commons/Widgets/buttons/date_button.dart';

class BirthdayWidget extends StatefulWidget {
  const BirthdayWidget({super.key, this.onDateSelected, this.birthdayError});

  final ValueChanged<DateTime?>? onDateSelected;
  final String? birthdayError;

  @override
  State<BirthdayWidget> createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(_selectedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.date_of_birth,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: DateButton(
              dateText: _selectedDate == null
                  ? AppLocalizations.of(context)!.date_of_birth
                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              onPressed: () => _selectDate(context),
              height: 52,
              width: double.infinity,
            ),
          ),
        ),
        if (widget.birthdayError != null && widget.birthdayError!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
            child: Text(
              widget.birthdayError!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
         Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 8.0,
          ),
          child: Text(
            AppLocalizations.of(context)!.date_of_birth_desc,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        )
      ],
    );
  }
}
