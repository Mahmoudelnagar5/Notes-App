import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            CustomTextField(
              hintText: 'Title',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'Content',
              maxLines: 5,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
