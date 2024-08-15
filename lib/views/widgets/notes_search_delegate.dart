import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        List<NoteModel> results = [];
        for (var note in notes) {
          if (note.title.toLowerCase().contains(query.toLowerCase()) ||
              note.subtitle.toLowerCase().contains(query.toLowerCase())) {
            results.add(note);
          }
        }
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: NoteItem(note: results[index]),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        List<NoteModel> suggestions = [];

        if (query.isNotEmpty) {
          for (var note in notes) {
            if (note.title.toLowerCase().contains(query.toLowerCase()) ||
                note.subtitle.toLowerCase().contains(query.toLowerCase())) {
              suggestions.add(note);
            }
          }
        }

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestions[index].title),
              subtitle: Text(suggestions[index].subtitle),
              onTap: () {
                query = suggestions[index].title;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
