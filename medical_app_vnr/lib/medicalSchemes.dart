import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Schemes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15.0,
                ),
                Icon(
                  Icons.account_balance,
                  size: 35.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Central Government :',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ExpansionTile(
                    leading: Icon(Icons.landscape),
                    title: Text("Pradhan Mantri Jan Dhan Yojana (PMJDY)"),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                              'Accident Insurance Cover of Rs.1 lakh is available with RuPay card issued to the PMJDY account holders.')),
                      ListTile(
                        title: Center(
                          child: Text('More Information'),
                        ),
                        onTap: () async {
                          const url = 'https://pmjdy.gov.in/';

                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ExpansionTile(
                    title: Text(
                        'Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY)'),
                    leading: Icon(Icons.landscape),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Risk coverage under this scheme is for Rs. 2 lakh in case of death of the insured, due to any reason.',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text('More Information'),
                        ),
                        onTap: () async {
                          const url =
                              'https://www.jansuraksha.gov.in/Forms-PMJJBY.aspx';

                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ExpansionTile(
                    title: Text('Pradhan Mantri Suraksha Bima Yojana (PMSBY)'),
                    leading: Icon(Icons.landscape),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Risk coverage under the scheme is Rs. 2 lakh for accidental death and full disability and Rs. 1 lakh for partial disability.',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text('More Information'),
                        ),
                        onTap: () async {
                          const url =
                              'https://nationalinsurance.nic.co.in/en/about-us/pradhan-mantri-suraksha-bima-yojana';

                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ExpansionTile(
                    title: Text('Pradhan Mantri Jan Arogya Yojana (PMJAY)'),
                    leading: Icon(Icons.landscape),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'The scheme includes three days of pre-hospitalisation and 15 days of posthospitalisation expenses. Moreover, around 1,400 procedures with all related costs like OT expenses are taken care of.',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text('More Information'),
                        ),
                        onTap: () async {
                          const url =
                              'https://pmjay.gov.in/form/job-seeker-profile';

                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15.0,
                      ),
                      Icon(
                        Icons.account_balance,
                        size: 35.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'State Government :',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Telangana :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.landscape),
                    title: Text("Aarogyasri"),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                              'The scheme provides financial protection to families living below poverty line upto Rs. 2 lakhs in a year for the treatment of serious ailments requiring hospitalization and surgery.')),
                      ListTile(
                        title: Center(
                          child: Text('More Information'),
                        ),
                        onTap: () async {
                          const url =
                              'https://services.india.gov.in/service/detail/telangana-aarogyasri-health-care-trust-information-on-aarogyasri-scheme-1';

                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
