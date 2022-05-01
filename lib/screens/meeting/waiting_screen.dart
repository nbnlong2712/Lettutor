import 'dart:io';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

// Creating Page
class WaitingScreen extends StatefulWidget {
  WaitingScreen({Key? key, required this.booking}) : super(key: key);

  Booking booking;

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  late TextEditingController serverText;
  late TextEditingController roomText;
  late TextEditingController subjectText;
  late TextEditingController nameText;
  late TextEditingController emailText;

  var isAudioOnly = true;
  var isAudioMuted = true;
  var isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    serverText = TextEditingController(text: "https://meet.lettutor.com/");
    roomText = TextEditingController(text: "${widget.booking.userId}-${widget.booking.tutorId}");
    subjectText = TextEditingController(text: "Meeting");
    nameText = TextEditingController(text: mainUser.name);
    emailText = TextEditingController(text: mainUser.email);

    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onPictureInPictureWillEnter: _onPictureInPictureWillEnter,
        onPictureInPictureTerminated: _onPictureInPictureTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              const Spacer(flex: 59),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(BootstrapIcons.arrow_left), //Import any icon, which you want
                        color: Colors.black.withOpacity(0.3),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              ),
              const Spacer(flex: 1),
              Image.asset("assets/images/meeting_pic.png", width: MediaQuery.of(context).size.width * 0.35, fit: BoxFit.fitWidth),
              const Spacer(flex: 20),
              Container(
                child: Text(
                  "Join the Meet",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                margin: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              ),
              const Spacer(flex: 65),
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(color: const Color(0xfff3f3f3), borderRadius: BorderRadius.circular(16)),
                child: TextField(
                  controller: nameText,
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.person, color: Colors.black),
                      hintText: "Name"),
                ),
              ),
              const Spacer(flex: 58),
              Container(
                width: 350,
                child: Text(
                  "Meet Guidelines -\n1) For privacy reasons you may change your name if you want.\n2) By default your audio & video are muted.",
                  style: TextStyle(fontSize: 14, color: Color(0xff898989)),
                ),
              ),
              const Spacer(flex: 58),
              Row(
                children: [
                  const Spacer(flex: 32),
                  GestureDetector(
                    onTap: () {
                      _onAudioMutedChanged(!isAudioMuted);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: isAudioMuted ? const Color(0xffD64467) : const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.06), offset: const Offset(0, 4)),
                          ]),
                      width: 72,
                      height: 72,
                      child: Icon(isAudioMuted ? Icons.mic_off_sharp : Icons.mic_none_sharp, color: isAudioMuted ? Colors.white : Colors.black),
                    ),
                  ),
                  const Spacer(flex: 16),
                  GestureDetector(
                    onTap: () {
                      _onVideoMutedChanged(!isVideoMuted);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: isVideoMuted ? const Color(0xffD64467) : const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.06), offset: const Offset(0, 4)),
                          ]),
                      width: 72,
                      height: 72,
                      child: Icon(isVideoMuted ? Icons.videocam_off_sharp : Icons.videocam, color: isVideoMuted ? Colors.white : Colors.black),
                    ),
                  ),
                  const Spacer(flex: 16),
                  GestureDetector(
                    onTap: () {
                      _joinMeeting(); // Join meet on tap
                    },
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(color: const Color(0xffAA66CC), borderRadius: BorderRadius.circular(16), boxShadow: [
                          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.06), offset: const Offset(0, 4)),
                        ]),
                        width: 174,
                        height: 72,
                        child: Center(
                          child: Text(
                            "JOIN MEET",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                  const Spacer(flex: 32),
                ],
              ),
              const Spacer(flex: 38),
            ],
          ),
        ),
      ),
    );
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value!;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value!;
    });
  }

  _joinMeeting() async {
    String? serverUrl = (serverText.text.trim().isEmpty ? null : serverText.text);
    try {
      Map<FeatureFlagEnum, bool> featureFlag = {FeatureFlagEnum.WELCOME_PAGE_ENABLED: false, FeatureFlagEnum.INVITE_ENABLED: true};
      if (!kIsWeb) {
        if (Platform.isAndroid) {
          featureFlag[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        } else if (Platform.isIOS) {
          featureFlag[FeatureFlagEnum.PIP_ENABLED] = false;
        }
      }
      var options = JitsiMeetingOptions(room: roomText.text)
        ..serverURL = serverUrl
        ..subject = subjectText.text
        ..userDisplayName = nameText.text
        ..userEmail = emailText.text
        ..audioOnly = isAudioOnly
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..userAvatarURL = mainUser.avatar
        ..featureFlags.addAll(featureFlag)
        ..token = widget.booking.studentMeetingLink!.replaceAll("/call/?token=", "").trim();

      print(widget.booking.studentMeetingLink!.replaceAll("/call/?token=", "").trim());

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(options,
          listener: JitsiMeetingListener(
            onConferenceWillJoin: _onConferenceWillJoin,
            onConferenceJoined: _onConferenceJoined,
            onConferenceTerminated: _onConferenceTerminated,
            onPictureInPictureWillEnter: _onPictureInPictureWillEnter,
            onPictureInPictureTerminated: _onPictureInPictureTerminated,
          ));
      Future.delayed(const Duration(minutes: 50)).then((value) => JitsiMeet.closeMeeting());
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  void _onPictureInPictureWillEnter(message) {
    debugPrint("_onPictureInPictureWillEnter broadcasted with message: $message");
  }

  void _onPictureInPictureTerminated(message) {
    debugPrint("_onPictureInPictureTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
