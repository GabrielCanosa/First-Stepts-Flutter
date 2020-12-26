import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avatar Page'), actions: [
        Container(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://estaticos.muyinteresante.es/media/cache/680x_thumb/uploads/images/article/55365cd93787b2187a1f09b7/gen-simpson-p.jpg'),
            radius: 30.0,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            child: Text('GC'),
            backgroundColor: Colors.purple,
          ),
        )
      ]),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://static.wikia.nocookie.net/lossimpson/images/b/bd/Homer_Simpson.png/revision/latest?cb=20100522180809&path-prefix=es'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      ),
    );
  }
}
