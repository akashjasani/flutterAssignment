import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myeventsapp/routes/route_constant.dart';
import '../viewmodels/event_view_model.dart';
import '../widgets/event_item.dart';

class EventListScreen extends ConsumerStatefulWidget {
  const EventListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends ConsumerState<EventListScreen> {
  late Future<void> _eventList;

  @override
  void initState() {
    super.initState();
    _eventList =
        ref.read(EventViewModel.eventListProvider.notifier).loadEvent();
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(EventViewModel.eventListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
        elevation: 2,
      ),
      body: FutureBuilder(
        future: _eventList,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (ctx, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, eventDetailRoute,
                              arguments: events[index].id);
                        },
                        child: EventItem(
                          id: events[index].id!,
                          title: events[index].title!,
                          date: events[index].date!,
                          venue: events[index].venue!,
                          time: events[index].time!,
                        )),
                  ),
      ),
    );
  }
}
