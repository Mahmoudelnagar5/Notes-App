import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            icon: Icons.check,
            title: 'Edit Note',
          ),
          SizedBox(height: 50),
          CustomTextField(hintText: 'Title'),
          SizedBox(height: 20),
          CustomTextField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
