import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/booking_request.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_card.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  static const router = "/upcoming-screen";

  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}


class _UpcomingScreenState extends State<UpcomingScreen> {
  List<Booking> _upcomingList = [];
  ScrollController _scrollController = ScrollController();
  int _currentMax =0;
  bool isShowIndicator = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchMoreData();
      }
    });
  }

  void fetchMoreData() async {
    await BookingRequest.fetchAllBookingsUpcoming().then((value) {
      for (int i=_currentMax; i<_currentMax+4;  i++) {
        if (value[i].endPeriodTimestamp!.isAfter(DateTime.now())) {
          _upcomingList.add(value[i]);
        }
      }
      setState(() {
        _currentMax=_currentMax+4;
      });
    }).catchError((e) {
      print(e);
      throw e('error fetch data upcoming');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.upcoming, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _upcomingList.length+1,
                      itemBuilder: (context, i) {
                        if (i == _upcomingList.length) {
                          return const CupertinoActivityIndicator();
                        }
                        return UpcomingCard(
                          booking: _upcomingList[i],
                        );
                      }
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

}