import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas_3/data/covid_data_source.dart';
import 'package:tugas_3/model/countries_model.dart';

class PageDetailCountries extends StatefulWidget {
  const PageDetailCountries({Key? key}) : super(key: key);

  @override
  _PageDetailCountriesState createState() => _PageDetailCountriesState();
}

class _PageDetailCountriesState extends State<PageDetailCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries Detail"),
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return FutureBuilder(
      future: CovidDataSource.instance.loadCountries(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        } else if (snapshot.hasData) {
          CountriesModel countriesModel = CountriesModel.fromJson(snapshot.data);
          return _buildSuccessSection(countriesModel);
        }
        return _buildLoadingSection();
      },
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CountriesModel data) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: _buildItemCountries('${data.countries?[index].name}'),
                        subtitle: _buildItemCountries('${data.countries?[index].iso3}'),
                        shape: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
                itemCount: data.countries?.length,
              )
          ),
        ],
      ),
    );
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }
}