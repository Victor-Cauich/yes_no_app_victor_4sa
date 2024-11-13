import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:yes_no_app_victor_4sa/domain/entities/message.dart";

class HerMessageBubble extends StatelessWidget{
   final Message message;
   const HerMessageBubble({super.key, required this.message});
  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final timeSent = DateFormat('hh:mm a').format(message.timestamp); // Formatea la hora

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        Container(
           decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
           ),
           child: Padding(
             padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
             child: Text(
              message.text,
               style: const TextStyle( color: Colors.white),),
           ),
        ),

        const SizedBox(height: 5),

        _ImageBubble(
          imageUrl: message.imageUrl!
        ),

         Text(
          timeSent,
          style: TextStyle(color: colors.onBackground.withOpacity(0.6), fontSize: 12),
        ),

        const SizedBox( height: 10),

      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
   const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
      imageUrl,
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        
         if ( loadingProgress == null ) return child;

        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text("Mi amor esta enviando una imagen"),
        );
      },
      ));
  }
}