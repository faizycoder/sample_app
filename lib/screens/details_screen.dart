import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/utills/app_utills.dart';
import '../model/data_model.dart';

class DetailsPage extends StatefulWidget {
  final dynamic data;

  const DetailsPage({super.key, this.data});

  @override
  State<DetailsPage> createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  Results? result;


  @override
  void initState() {
    super.initState();
    result = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text('NY Times',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(result!.section!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          result!.media![0].mediaMetadata![1].url!,
                          fit: BoxFit.cover))),
              const SizedBox(height: 10),
              Text(result!.title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(AppUtils.getDate(result!.publishedDate!),
                      style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 5),
                  Text("Updated ${AppUtils.getDateTime(result!.updated!)}",
                      style: const TextStyle(fontSize: 12))
                ],
              ),
              const SizedBox(height: 10),
              Text(result!.abstract!, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: const Center(
          child: Text(
              "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
              style: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }
}
