import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_character_app/app/models/character_model.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key? key, required this.character})
      : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3e50),
        elevation: 0,
        title: Text(character.name!),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 26),
            Hero(
              tag: character.name!,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2c3e50).withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: character.image!,
                      height: 250,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        color: Color(0xFF2c3e50),
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              character.name.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Text(
              character.actor!,
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.house.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              'Character Alive: ${character.alive.toString()}',
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.dateOfBirth.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.alternateActors.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.alternateNames.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.ancestry.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.eyeColour.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.hairColour.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.gender.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.hogwartsStaff.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.species.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.wand.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.patronus.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.hogwartsStudent.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.hogwartsStudent.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              character.yearOfBirth.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
