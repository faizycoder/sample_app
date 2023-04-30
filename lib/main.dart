import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/provider/provider.dart';

import 'screens/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MostPopularProvider>(create: (_) => MostPopularProvider()),
      ],
      child:  MaterialApp(
      title: 'NY Times',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late MostPopularProvider _provider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MostPopularProvider>(
      create: (BuildContext context) {
        _provider = MostPopularProvider();
        _provider.initProvider(context);
        return _provider;
      },
      builder: (context, child) {
        return Consumer<MostPopularProvider>(
          builder: (context, provider, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('NY Times Most Popular',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            body:ListView.builder(
              itemCount: provider.results!.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DetailsPage(data: provider.results![index])));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Card(
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(provider.results![index].media![0].mediaMetadata![1].url!),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: Column(
                            children: [
                              Text(provider.results![index].title!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                              const SizedBox(height: 5),
                              Text(provider.results![index].abstract!,style: const TextStyle(fontSize: 12,),maxLines: 2,overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.date_range,size: 15),
                                  const SizedBox(width: 5),
                                  Text(provider.results![index].publishedDate!,style: const TextStyle(fontSize: 12))
                                ],
                              )
                            ],
                          )),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: Colors.grey)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
