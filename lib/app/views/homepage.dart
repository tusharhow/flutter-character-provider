import 'package:flutter/material.dart';
import 'package:flutter_character_app/app/components/character_card.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';
import 'details_screen.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CharacterController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3e50),
        elevation: 0,
        title: Text(controller.isLoading ? 'Loading...' : 'Characters'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF2c3e50),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: controller.characters.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final character = controller.characters[index];
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
                      }),
                ),
        ],
      ),
    );
  }
}
