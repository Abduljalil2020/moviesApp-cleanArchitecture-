
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/movies/presentation/screens/movies_screen.dart';

class Navigate extends StatelessWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigate'
        ),

      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMoviesScreen()),
                  );
                }
                , child:Text('NAVIGATE')
            ),
          )
        ],
      ),
    );
  }
}
