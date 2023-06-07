import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_character_app/app/bloc/character_bloc.dart';
import 'package:flutter_character_app/app/components/character_card.dart';
import 'details_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3e50),
        elevation: 0,
        title: const Text('Characters'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: BlocProvider<CharacterBloc>(
              create: (context) => CharacterBloc()..add(CharacterFetch()),
              child: BlocBuilder<CharacterBloc, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF2c3e50),
                      ),
                    );
                  } else if (state is CharacterLoaded) {
                    return ListView.builder(
                      itemCount: state.characters.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final character = state.characters[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CharacterTile(
                            character: character,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CharacterDetailPage(
                                    character: character,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is CharacterFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
