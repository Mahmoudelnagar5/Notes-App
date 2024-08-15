import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        note.delete();
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            behavior: SnackBarBehavior.fixed,
            backgroundColor: Colors.red,
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Text(
              'Note Deleted Successfully...',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              FontAwesomeIcons.trash,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
      key: Key(note.title),
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 32,
                ),
                splashColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditNotesView(note: note)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                note.date,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
// import 'package:notes_app/models/note_model.dart';
// import 'package:notes_app/views/edit_notes_view.dart';

// class NoteItem extends StatelessWidget {
//   const NoteItem({super.key, required this.note});
//   final NoteModel note;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return EditNotesView(
//             note: note,
//           );
//         }));
//       },
//       child: Container(
//         padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
//         decoration: BoxDecoration(
//           color: Color(note.color),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             ListTile(
//               title: Text(
//                 note.title,
//                 style: const TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(top: 16, bottom: 10),
//                 child: Text(
//                   note.subtitle,
//                   style: TextStyle(
//                     fontSize: 19,
//                     color: Colors.black.withOpacity(0.6),
//                   ),
//                 ),
//               ),
//               trailing: IconButton(
//                 splashColor: Colors.transparent,
//                 onPressed: () {
//                   note.delete();
//                   BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(16)),
//                       ),
//                       behavior: SnackBarBehavior.fixed,
//                       backgroundColor: Colors.red,
//                       showCloseIcon: true,
//                       closeIconColor: Colors.white,
//                       content: Text(
//                         'Note Deleted Successfully...',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 icon: const Icon(
//                   FontAwesomeIcons.trash,
//                   color: Colors.black,
//                   size: 25,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: Text(
//                 note.date,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black.withOpacity(0.6),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }