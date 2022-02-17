import 'package:alesha/models/doctor_model.dart';
import 'package:alesha/services/doctor_service.dart';
import 'package:alesha/themes/theme.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  DoctorService _listDoctor = DoctorService();

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        child: FutureBuilder<List<DoctorModel>>(
          future: _listDoctor.getDoctorList(query: query),
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
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Doctor'),
    );
  }
}