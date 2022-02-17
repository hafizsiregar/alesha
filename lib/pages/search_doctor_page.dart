import 'package:alesha/models/doctor_model.dart';
import 'package:alesha/services/doctor_service.dart';
import 'package:alesha/themes/theme.dart';
import 'package:alesha/widgets/search.dart';
import 'package:flutter/material.dart';

class SearchDoctorPage extends StatefulWidget {

  final String? query;
  SearchDoctorPage({required this.query});

  @override
  _SearchDoctorPageState createState() => _SearchDoctorPageState();
}

class _SearchDoctorPageState extends State<SearchDoctorPage> {

  final TextEditingController _searchController = TextEditingController();

  DoctorService _listDoctor = DoctorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text('Search Doctor'),
        centerTitle: true,
        actions: [
          IconButton( 
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              color: kWhiteColor,
            ),
        ],
      ),
      body: Container(
        child: FutureBuilder<List<DoctorModel>>(
          future: _listDoctor.getDoctorList(query: widget.query),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if(!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            '${data?[index].id}',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ),
                      SizedBox(width: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${data?[index].name}',
                              style: TextStyle(
                                color: kGreyColor,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${data?[index].email}',
                              style: TextStyle(
                                color: kGreyColor,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${data?[index].phone}',
                              style: TextStyle(
                                color: kGreyColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                    ]
                  ),
                ),
              );
            },
          );
          }
        ),
      ),
    );
  }
}