import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicine_app/constants.dart';

class schemes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:kMainColor,
        body: SafeArea(
          child:
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Text('Central Government :',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                const ExpansionTile(
                  title: Text('Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY)'),
                  subtitle: Text('this is example'),
                  children: <Widget>[
                    ListTile(title: Text('Risk coverage under this scheme is for Rs. 2 lakh in case of death of the insured, due to any reason.',
                    style: TextStyle(
                      fontSize: 15.0
                    ),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                const ExpansionTile(
                  title: Text('Pradhan Mantri Jan Dhan Yojana (PMJDY)'),
                  subtitle: Text('this is example'),
                  children: <Widget>[
                    ListTile(title: Text('Accident Insurance Cover of Rs.1 lakh is available with RuPay card issued to the PMJDY account holders.',
                      style: TextStyle(
                        fontSize: 15.0,
                    ),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                const ExpansionTile(
                  title: Text('Pradhan Mantri Suraksha Bima Yojana (PMSBY)'),
                  subtitle: Text('this is example'),
                  children: <Widget>[
                    ListTile(title: Text('Risk coverage under the scheme is Rs. 2 lakh for accidental death and full disability and Rs. 1 lakh for partial disability.',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                const ExpansionTile(
                  title: Text('Pradhan Mantri Jan Arogya Yojana (PMJAY)'),
                  subtitle: Text('this is example'),
                  children: <Widget>[
                    ListTile(title:
                    Text('The scheme includes three days of pre-hospitalisation and 15 days of posthospitalisation expenses. Moreover, around 1,400 procedures with all related costs like OT expenses are taken care of.',
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text('State Government :',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text('Telangana :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const ExpansionTile(
                  title: Text('Aarogyasri'),
                  subtitle: Text('this is example'),
                  children: <Widget>[
                    ListTile(title: Text('The scheme provides financial protection to families living below poverty line upto Rs. 2 lakhs in a year for the treatment of serious ailments requiring hospitalization and surgery.',
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ],
            ),
          )

        ),
      )

    );
  }
}
