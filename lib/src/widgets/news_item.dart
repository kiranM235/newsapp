import 'package:flutter/material.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/screens/news_detail_screen.dart';
import 'package:news/src/widgets/loading_container.dart';

class NewsItem extends StatelessWidget {
  final Future<ItemModel> item;
  final int id;

  const NewsItem({Key? key, required this.item, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: item,
      builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return LoadingContainer();
        }
        final model = snapshot.data;
        print("Is the model null $id");
        return ListTile(
          title:  Text(model!.title!),
          subtitle: Text("${model.score!} votes"),
          trailing: Column(
            children: [
              Icon(Icons.comment),
              Text("${model.descendants ?? 0 }"),
            ],
          ),
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return NewsDetailScreen(item: model);
                  },
                ),
            );
          },
        );
      },
    );
  }
}
