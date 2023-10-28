import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:diary/cubit/note_cubit/note_cubit.dart';
import 'package:diary/cubit/note_cubit/note_states.dart';
import 'package:diary/view/custom_textformfield.dart';
import 'package:diary/view/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NoteCubit>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<NoteCubit, NoteStates>(
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                    hintText: 'search a note by title',
                    onChanged: (value) {
                      cubit.search(titleSearch: value);
                                        
            
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ConditionalBuilder(
                      condition: state is FoundSearchState,
            
                      builder: (context) => Expanded(
                            child: Container(
                                height: MediaQuery.of(context).size.height,
                                child: ItemListViewSearch()),
                          ),
                      fallback: (context) => Container()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemListViewSearch extends StatelessWidget {
  const ItemListViewSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NoteCubit>(context);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return NoteItem(
          noteModel: cubit.noteSearch![index],
        );
      },
      separatorBuilder: (context, index) => const Divider(
        //color: Colors.white,
        height: 10,
      ),
      itemCount:
          cubit.noteSearch!.length, 

    );
  }
}
