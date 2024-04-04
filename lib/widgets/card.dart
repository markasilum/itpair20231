import 'package:flutter/material.dart';
import 'package:itpair20231/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileCard extends StatelessWidget {
  final Person person;
  const ProfileCard({ Key? key, required this.person }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height*.13,
      width: screenSize.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Row(
        children: [
              CachedNetworkImage(
            imageUrl: person.thumb,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
        ),
          // Container(
          //   height: screenSize.height*.09,
          //   width: screenSize.width*.15,
          //   margin: EdgeInsets.only(right: 5),
          //   decoration: BoxDecoration(color: Colors.white,
          //     DecorationImage()

          //   ),
            
          // ),
          Column(
            children: [
              Text("Alumni Office"),
              Container(
                width: screenSize.width*.7,
                child: Text(person.title)),
            ],
          ),
        ],
      ));
  }
}