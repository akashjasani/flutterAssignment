import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeventsapp/viewmodels/event_view_model.dart';
import 'package:myeventsapp/widgets/event_detail_wrap.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailScreen extends ConsumerStatefulWidget {
  final int id;

  const EventDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends ConsumerState<EventDetailScreen> {
  late Future<void> _eventDetail;

  @override
  void initState() {
    super.initState();
    _eventDetail = ref
        .read(EventViewModel.eventDetailProvider.notifier)
        .loadEventDetail(widget.id);
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventDetail = ref.watch(EventViewModel.eventDetailProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Detail"),
      ),
      body: FutureBuilder(
        future: _eventDetail,
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Hero(
                        tag: widget.id,
                        child: Image.asset(
                          'assets/images/newevent.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    buildSectionTitle(context, "Event Detail"),
                    buildContainer(
                        child: Column(
                      children: [
                        EventDetailWarp(
                            text: eventDetail?.title ?? '',
                            iconData: Icons.event_available),
                        EventDetailWarp(
                            text: eventDetail?.type ?? '',
                            iconData: Icons.arrow_circle_right_outlined),
                        EventDetailWarp(
                            text: eventDetail?.date ?? '',
                            iconData: Icons.date_range_rounded),
                        EventDetailWarp(
                            text: eventDetail?.time ?? '',
                            iconData: Icons.access_time),
                      ],
                    )),
                    buildSectionTitle(context, "Venue"),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        // margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        height: 120,
                        width: 300,
                        child: Column(
                          children: [
                            Text(eventDetail?.venue?.name ?? ''),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(eventDetail?.venue?.address ?? ''),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(eventDetail?.venue?.extendedAddress ?? ''),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(eventDetail?.venue!.country ?? '')
                          ],
                        )),
                    buildSectionTitle(context, "Performers"),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: eventDetail?.performers?.length ?? 0,
                      itemBuilder: (context, index) => Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.network(
                                eventDetail?.performers?[index].image ?? '',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        eventDetail?.performers?[index].name ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Type: ${eventDetail?.performers?[index].type ?? ''}',
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Up coming Event: ${eventDetail?.performers?[index].upcomingEvent ?? ''}',
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await launchUrl(Uri.parse(eventDetail
                                                  ?.performers?[index].url ??
                                              ''));
                                        },
                                        child: const Text(
                                          'Ticket Booking',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
